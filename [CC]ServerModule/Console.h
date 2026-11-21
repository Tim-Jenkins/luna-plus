// Console.h: the server console window (log list, command line and custom menu).
//
// The servers used to get this window from a prebuilt COM component, MHConsole.dll
// (CLSID_ULTRA_TCONSOLE). CConsole now draws it itself with plain Win32, so nothing
// has to be registered (#24).

#if !defined(AFX_CONSOLE_H__CBF4D949_750B_4299_B466_82A70331A49E__INCLUDED_)
#define AFX_CONSOLE_H__CBF4D949_750B_4299_B466_82A70331A49E__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include "TConsole_Def.h"

enum
{
	eLogDisplay,
	eLogFile,
};

struct ConsoleState;

class CConsole
{
	ConsoleState* m_pState;
public:

	CConsole();
	virtual ~CConsole();

	// Creates the console window on the calling thread and makes it that thread's active
	// window, so callers can find it with GetActiveWindow(). WaitMessage() must run on the
	// same thread.
	BOOL Init(int MaxButton,MENU_CUSTOM_INFO* pMenuInfo,void (*CommandFunc)(char* szCommand));
	void Release();

	// Runs the window's message loop until the window is closed.
	void WaitMessage();

	// eLogDisplay appends the message to ./Log/ConsoleLog.txt; eLogFile is ignored, as it
	// was with MHConsole.dll.
	void Log(int nLogType,int LogLevel,char* strMsg,...);
	// Adds a line to the console window. Safe to call from any thread.
	void LOG(int LogLevel,char* strMsg,...);

};

extern CConsole g_Console;

#endif // !defined(AFX_CONSOLE_H__CBF4D949_750B_4299_B466_82A70331A49E__INCLUDED_)
