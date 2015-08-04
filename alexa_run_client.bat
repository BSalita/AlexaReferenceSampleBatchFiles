@echo off
REM alexa_run_client.bat file
REM Create client device config.json file

call alexa_set_paths.bat

PATH=%MAVEN_PATH%\bin;%VLC_PATH%;%PATH%
pushd "%REFERENCE_IMPLEMENTATION%\samples\javaclient"
call mvn install
if errorlevel 1 goto :EOF
call mvn exec:java
if errorlevel 1 goto :EOF
popd
