// Console.cpp: the server console window. See Console.h.

#include "stdafx.h"
#include "Console.h"
#include <stdio.h>
#include <stdarg.h>
#include <string>
#include <vector>

CConsole g_Console;

namespace
{
	const char* const kWindowClass = "LunaServerConsole";
	const char* const kLogDirectory = "./Log";
	const char* const kLogFileName = "./Log/ConsoleLog.txt";
	const size_t kMessageSize = 1024;
	const int kMaxLines = 1000;
	const UINT kRefreshTimer = 1;
	const UINT kRefreshMs = 200;
	const UINT kSourceCodePage = 949;

	const UINT kIdExit = 1000;
	const UINT kIdCustomMenu = 2000;

	const COLORREF kBackground = RGB(8, 8, 40);
	const COLORREF kText = RGB(140, 140, 255);
}

struct ConsoleState
{
	HWND window;
	HWND list;
	HWND edit;
	HFONT font;
	HBRUSH background;
	WNDPROC editProc;
	cbRetrnFunc command;
	std::vector<MENU_CUSTOM_INFO> menu;

	CRITICAL_SECTION lock;
	std::vector<std::string> pending;	// lines logged since the last refresh
	unsigned lineNumber;
	FILE* logFile;

	ConsoleState() :
	window(0), list(0), edit(0), font(0), background(0), editProc(0), command(0),
	lineNumber(0), logFile(0)
	{
		InitializeCriticalSection(&lock);
	}
};

namespace
{
	ConsoleState* StateOf(HWND window)
	{
		return (ConsoleState*)GetWindowLongPtrA(window, GWLP_USERDATA);
	}

	// Moves the lines logged since the last refresh into the list box.
	void Refresh(ConsoleState& state)
	{
		std::vector<std::string> lines;
		EnterCriticalSection(&state.lock);
		lines.swap(state.pending);
		LeaveCriticalSection(&state.lock);

		if(lines.empty() || 0 == state.list)
		{
			return;
		}

		SendMessageW(state.list, WM_SETREDRAW, FALSE, 0);

		for(size_t i = 0; i < lines.size(); ++i)
		{
			char text[kMessageSize + 16];
			_snprintf(text, sizeof(text), "%u\t%s", state.lineNumber++, lines[i].c_str());
			text[sizeof(text) - 1] = 0;

			// The servers' messages are CP949 (Korean). Convert them here rather than letting
			// the ANSI list box use the system code page, so they read correctly on
			// non-Korean Windows too.
			wchar_t wideText[kMessageSize + 16] = {0};
			if(0 == MultiByteToWideChar(kSourceCodePage, 0, text, -1, wideText, _countof(wideText)))
			{
				MultiByteToWideChar(CP_ACP, 0, text, -1, wideText, _countof(wideText));
			}
			wideText[_countof(wideText) - 1] = 0;
			SendMessageW(state.list, LB_ADDSTRING, 0, (LPARAM)wideText);
		}

		LRESULT count = SendMessageW(state.list, LB_GETCOUNT, 0, 0);
		while(count > kMaxLines)
		{
			SendMessageW(state.list, LB_DELETESTRING, 0, 0);
			--count;
		}

		SendMessageW(state.list, LB_SETTOPINDEX, (WPARAM)(count - 1), 0);
		SendMessageW(state.list, WM_SETREDRAW, TRUE, 0);
		InvalidateRect(state.list, 0, TRUE);
	}

	void Layout(ConsoleState& state)
	{
		RECT client;
		GetClientRect(state.window, &client);

		const int editHeight = 26;
		const int width = client.right - client.left;
		const int height = client.bottom - client.top;
		const int listHeight = height > editHeight ? height - editHeight : 0;

		MoveWindow(state.list, 0, 0, width, listHeight, TRUE);
		MoveWindow(state.edit, 0, listHeight, width, editHeight, TRUE);
	}

	// Sends the command line to the server's command callback when Enter is pressed.
	LRESULT CALLBACK EditProc(HWND edit, UINT message, WPARAM wParam, LPARAM lParam)
	{
		ConsoleState* const state = StateOf(GetParent(edit));

		if(0 == state)
		{
			return DefWindowProcA(edit, message, wParam, lParam);
		}
		else if(WM_KEYDOWN == message && VK_RETURN == wParam)
		{
			char command[256] = {0};
			GetWindowTextA(edit, command, sizeof(command));
			SetWindowTextA(edit, "");

			if(state->command && command[0])
			{
				state->command(command);
			}

			return 0;
		}
		// Stops the beep a single-line edit control makes for Enter.
		else if(WM_CHAR == message && '\r' == wParam)
		{
			return 0;
		}

		return CallWindowProcA(state->editProc, edit, message, wParam, lParam);
	}

	LRESULT CALLBACK WindowProc(HWND window, UINT message, WPARAM wParam, LPARAM lParam)
	{
		ConsoleState* const state = StateOf(window);

		switch(message)
		{
		case WM_SIZE:
			if(state && state->list)
			{
				Layout(*state);
			}
			return 0;

		case WM_SETFOCUS:
			if(state && state->edit)
			{
				SetFocus(state->edit);
			}
			return 0;

		case WM_TIMER:
			if(state && kRefreshTimer == wParam)
			{
				Refresh(*state);
			}
			return 0;

		case WM_CTLCOLORLISTBOX:
			if(state)
			{
				HDC dc = (HDC)wParam;
				SetTextColor(dc, kText);
				SetBkColor(dc, kBackground);
				return (LRESULT)state->background;
			}
			break;

		case WM_COMMAND:
			if(state && 0 == lParam)
			{
				const UINT id = LOWORD(wParam);

				if(kIdExit == id)
				{
					DestroyWindow(window);
				}
				else if(id >= kIdCustomMenu && id < kIdCustomMenu + state->menu.size())
				{
					void (*callback)() = state->menu[id - kIdCustomMenu].cbMenuCommand;

					if(callback)
					{
						callback();
					}
				}
				return 0;
			}
			break;

		case WM_CLOSE:
			// MHConsole.dll was created with TLO_NOTMESSAGECLOSE: close without asking.
			DestroyWindow(window);
			return 0;

		case WM_DESTROY:
			KillTimer(window, kRefreshTimer);
			PostQuitMessage(0);
			return 0;
		}

		return DefWindowProcA(window, message, wParam, lParam);
	}

	HMENU CreateMenuBar(const std::vector<MENU_CUSTOM_INFO>& custom)
	{
		HMENU bar = CreateMenu();

		HMENU file = CreatePopupMenu();
		AppendMenuA(file, MF_STRING, kIdExit, "Exit");
		AppendMenuA(bar, MF_POPUP, (UINT_PTR)file, "File");

		if(false == custom.empty())
		{
			HMENU console = CreatePopupMenu();

			for(size_t i = 0; i < custom.size(); ++i)
			{
				char name[MUNU_CUSTOMNAME_SIZE + 1] = {0};
				memcpy(name, custom[i].szMenuName, MUNU_CUSTOMNAME_SIZE);
				AppendMenuA(console, MF_STRING, kIdCustomMenu + i, name);
			}

			AppendMenuA(bar, MF_POPUP, (UINT_PTR)console, "Console");
		}

		return bar;
	}

	void Format(char* buffer, size_t size, const char* format, va_list args)
	{
		_vsnprintf(buffer, size, format, args);
		buffer[size - 1] = 0;

		// The list box shows one line per entry, so drop trailing line breaks.
		size_t length = strlen(buffer);
		while(length > 0 && ('\n' == buffer[length - 1] || '\r' == buffer[length - 1]))
		{
			buffer[--length] = 0;
		}
	}
}

CConsole::CConsole() :
m_pState(new ConsoleState)
{}

// g_Console lives until the process exits, and other threads may still log while static
// objects are destroyed, so the state is deliberately never freed.
CConsole::~CConsole()
{}

BOOL CConsole::Init(int MaxButton,MENU_CUSTOM_INFO* pMenuInfo, cbRetrnFunc commandFunc)
{
	ConsoleState& state = *m_pState;

	if(state.window)
	{
		return TRUE;
	}

	HINSTANCE instance = GetModuleHandleA(0);

	WNDCLASSEXA windowClass = {0};
	windowClass.cbSize = sizeof(windowClass);
	windowClass.lpfnWndProc = WindowProc;
	windowClass.hInstance = instance;
	windowClass.hIcon = LoadIconA(0, (LPCSTR)IDI_APPLICATION);
	windowClass.hCursor = LoadCursorA(0, (LPCSTR)IDC_ARROW);
	windowClass.hbrBackground = (HBRUSH)(COLOR_WINDOW + 1);
	windowClass.lpszClassName = kWindowClass;

	if(0 == RegisterClassExA(&windowClass) && ERROR_CLASS_ALREADY_EXISTS != GetLastError())
	{
		return FALSE;
	}

	state.command = commandFunc;
	state.menu.clear();
	for(int i = 0; pMenuInfo && i < MaxButton; ++i)
	{
		state.menu.push_back(pMenuInfo[i]);
	}

	state.window = CreateWindowExA(
		0,
		kWindowClass,
		"Darkstory",
		WS_OVERLAPPEDWINDOW,
		CW_USEDEFAULT,
		CW_USEDEFAULT,
		800,
		400,
		0,
		CreateMenuBar(state.menu),
		instance,
		0);

	if(0 == state.window)
	{
		return FALSE;
	}

	SetWindowLongPtrA(state.window, GWLP_USERDATA, (LONG_PTR)&state);

	// A Unicode list box, so Korean shows correctly whatever the system code page is.
	state.list = CreateWindowExW(
		WS_EX_CLIENTEDGE,
		L"LISTBOX",
		0,
		WS_CHILD | WS_VISIBLE | WS_VSCROLL | LBS_NOINTEGRALHEIGHT | LBS_NOSEL | LBS_USETABSTOPS,
		0, 0, 0, 0,
		state.window,
		0,
		instance,
		0);
	state.edit = CreateWindowExA(
		WS_EX_CLIENTEDGE,
		"EDIT",
		0,
		WS_CHILD | WS_VISIBLE | ES_AUTOHSCROLL,
		0, 0, 0, 0,
		state.window,
		0,
		instance,
		0);

	if(0 == state.list || 0 == state.edit)
	{
		DestroyWindow(state.window);
		state.window = 0;
		return FALSE;
	}

	state.editProc = (WNDPROC)SetWindowLongPtrA(state.edit, GWLP_WNDPROC, (LONG_PTR)EditProc);

	// MHConsole.dll was asked for bold 17 px Gulim. Gulim only comes with the Korean
	// supplemental fonts, while Malgun Gothic ships with every Windows since Vista.
	LOGFONTW logFont = {0};
	logFont.lfHeight = 17;
	logFont.lfWeight = FW_BOLD;
	logFont.lfCharSet = DEFAULT_CHARSET;
	wcscpy(logFont.lfFaceName, L"Malgun Gothic");
	state.font = CreateFontIndirectW(&logFont);
	state.background = CreateSolidBrush(kBackground);

	SendMessageW(state.list, WM_SETFONT, (WPARAM)state.font, FALSE);
	SendMessageA(state.edit, WM_SETFONT, (WPARAM)state.font, FALSE);

	// One tab stop after the line number column (in dialog units).
	const int tabStop = 24;
	SendMessageW(state.list, LB_SETTABSTOPS, 1, (LPARAM)&tabStop);

	Layout(state);
	ShowWindow(state.window, SW_SHOW);
	UpdateWindow(state.window);
	// The servers find the window with GetActiveWindow() right after Init.
	SetActiveWindow(state.window);
	SetFocus(state.edit);

	SetTimer(state.window, kRefreshTimer, kRefreshMs, 0);
	Refresh(state);

	return TRUE;
}

void CConsole::Release()
{
	ConsoleState& state = *m_pState;

	if(state.window && IsWindow(state.window))
	{
		SetWindowLongPtrA(state.window, GWLP_USERDATA, 0);
		DestroyWindow(state.window);
	}

	state.window = 0;
	state.list = 0;
	state.edit = 0;

	if(state.font)
	{
		DeleteObject(state.font);
		state.font = 0;
	}

	if(state.background)
	{
		DeleteObject(state.background);
		state.background = 0;
	}

	EnterCriticalSection(&state.lock);
	if(state.logFile)
	{
		fclose(state.logFile);
		state.logFile = 0;
	}
	LeaveCriticalSection(&state.lock);
}

void CConsole::Log(int LogType,int MsgLevel,char* LogMsg,...)
{
	char buffer[kMessageSize];

	va_list vl;
	va_start(vl, LogMsg);
	Format(buffer, sizeof(buffer), LogMsg, vl);
	va_end(vl);

	switch(LogType)
	{
	case eLogDisplay:
		{
			ConsoleState& state = *m_pState;
			SYSTEMTIME time;
			GetLocalTime(&time);

			EnterCriticalSection(&state.lock);
			if(0 == state.logFile)
			{
				CreateDirectoryA(kLogDirectory, 0);
				state.logFile = fopen(kLogFileName, "a");
			}
			if(state.logFile)
			{
				fprintf(
					state.logFile,
					"%04d-%02d-%02d %02d:%02d:%02d %s\n",
					time.wYear, time.wMonth, time.wDay,
					time.wHour, time.wMinute, time.wSecond,
					buffer);
				fflush(state.logFile);
			}
			LeaveCriticalSection(&state.lock);
			break;
		}
	case eLogFile:
		break;
	default:
		MessageBox(NULL,"Not Defined LogType",0,0);
	}
}

void CConsole::LOG(int MsgLevel,char* LogMsg,...)
{
	char buffer[kMessageSize];

	va_list vl;
	va_start(vl, LogMsg);
	Format(buffer, sizeof(buffer), LogMsg, vl);
	va_end(vl);

	ConsoleState& state = *m_pState;
	EnterCriticalSection(&state.lock);
	// Keep the queue bounded if nothing drains it (before Init, or after the window closes).
	if(state.pending.size() >= size_t(kMaxLines))
	{
		state.pending.erase(state.pending.begin());
	}
	state.pending.push_back(buffer);
	LeaveCriticalSection(&state.lock);
}

void CConsole::WaitMessage()
{
	MSG message;

	while(GetMessageA(&message, 0, 0, 0) > 0)
	{
		TranslateMessage(&message);
		DispatchMessageA(&message);
	}
}
