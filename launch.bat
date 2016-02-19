@setlocal enableextensions enabledelayedexpansion
@echo off

SET cwd=%~dp0
SET exec=%1
SET setups=file:///%cwd:\=/%/setups/
SET workspace=%userprofile%\workspace

if not x%exec:eclipse-inst=%==x%exec%  GOTO :CASE_INSTALL
if not x%exec:eclipse=%==x%exec% GOTO :CASE_ECLIPSE

REM if label does not exist
GOTO :CASE_DEFAULT 

:CASE_ECLIPSE
	ECHO Launching eclipse...
	start %exec% -data %workspace% -vmargs "-Doomph.redirection.index.redirection=index:/->%setups%" "-Doomph.redirection.index.location.redirection=http://git.eclipse.org/c/oomph/org.eclipse.oomph.git/plain/setups/->%setups%"
	GOTO CASE_RETURN
	
:CASE_INSTALL
	ECHO Launching installer...
	start eclipse-inst.exe -vmargs "-Doomph.redirection.setups=http://git.eclipse.org/c/oomph/org.eclipse.oomph.git/plain/setups/->%setups%"
	GOTO CASE_RETURN
	
:CASE_DEFAULT
	ECHO Nothing to do. Please call this script with "eclipse.exe" or "eclipse-inst.exe"
	GOTO CASE_RETURN
	
:CASE_RETURN
	VER > NUL #reset ERRORLEVEL	
REM	EXIT /B
	
	GOTO :EOF #return from call
			
