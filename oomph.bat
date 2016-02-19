@SET cwd=%~dp0
@REM echo %cwd:~0,-1%

@SET setups=file:///%cwd:\=/%/setups/
@REM echo Launching eclipse.exe with setups from "%setups%"

start eclipse-inst.exe -vmargs "-Doomph.redirection.setups=http://git.eclipse.org/c/oomph/org.eclipse.oomph.git/plain/setups/->%setups%"