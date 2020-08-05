@echo off
setlocal
title "HL 7010"

:Init
set JAVA_CMD="E:\srvmgr3.6_jre1.7.0_80\jre\bin\java.exe"
if exist %JAVA_CMD% (
   set VAR_CMD=%JAVA_CMD%
) else set VAR_CMD=java

set VAR_VM_ARGUMENTS="-Dcom.jiuqi.dna.ui.theme=sky -Dfile.encoding=GBK -Dosgi.console.blockOnReady=true -XX:+HeapDumpOnOutOfMemoryError -XX:+UseParallelGC -XX:MaxNewSize=768M -XX:MaxPermSize=256M -XX:PermSize=128M -Xmn768M -Xms2048M -Xmx2048M -XX:+PrintCommandLineFlags -Duser.timezone=GMT+08"

goto :Run

:Run
%VAR_CMD% %VAR_VM_ARGUMENTS:~1,-1% -jar "%~dp0thr\com.jiuqi.dna.launcher_1.0.0.jar"
goto :END

:DaemonRun
start /b %VAR_CMD% %VAR_VM_ARGUMENTS:~1,-1% -Dout.redirect=true -jar "%~dp0thr\com.jiuqi.dna.launcher_1.0.0.jar"
goto :END

:End
endlocal
