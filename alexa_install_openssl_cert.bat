@echo off
REM alexa_install_openssl_cert.bat file
REM Install/Reinstall openssl certificate

REM Perform test that determines if we are running in Administrative mode.
net session >nul 2>&1
if %errorLevel% NEQ 0 (
    echo Please run in Administrator mode
    goto :EOF
)

call alexa_set_paths.bat

pushd "%REFERENCE_IMPLEMENTATION%\samples\service\ssl"
PATH %OPENSSL_PATH%\bin;%JAVA_HOME%\bin;%PATH%
openssl genrsa -des3 -out server.key 2048
if errorlevel 1 goto :EOF
openssl req -new -key server.key -out server.csr
if errorlevel 1 goto :EOF
move/Y server.key server.key.passphrase
if errorlevel 1 goto :EOF
openssl rsa -in server.key.passphrase -out server.key
if errorlevel 1 goto :EOF
openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt
if errorlevel 1 goto :EOF
REM First remove any existing certificate.
keytool -delete -v -trustcacerts -alias avs-companion-service -file server.crt -keystore "%JAVA_HOME%\jre\lib\security\cacerts" -keypass changeit -storepass changeit
keytool -importcert -v -trustcacerts -alias avs-companion-service -file server.crt -keystore "%JAVA_HOME%\jre\lib\security\cacerts" -keypass changeit -storepass changeit
if errorlevel 1 goto :EOF
popd
