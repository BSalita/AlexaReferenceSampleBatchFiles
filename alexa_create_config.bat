@echo off
REM alexa_create_config.bat file
REM Create client device config.json file

call alexa_set_paths.bat

pushd "%REFERENCE_IMPLEMENTATION%\samples\javaclient"
echo { "pid":"%PRODUCT_TYPE_ID%", "serial":"%UNIQUE_PRODUCT_ID%", "url":"%ALEXA_SERVER_URL%" } > config.json
echo Client device config.json file at %CD% contains:
type config.json
popd
