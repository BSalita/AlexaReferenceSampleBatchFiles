rem @echo off
REM alexa_run_server.bat file
REM Run server

call alexa_set_paths.bat

pushd %REFERENCE_IMPLEMENTATION%\samples\service
REM execute nodejs npm
call npm install
if errorlevel 1 goto :EOF
echo install finished

echo > config.json
echo /** >> config.json
echo  * @module >> config.json
echo  * This module defines the settings that need to be configured for a new >> config.json
echo  * environment. >> config.json
echo  * The clientId and clientSecret are provided when you create >> config.json
echo  * a new security profile in Login with Amazon.   >> config.json
echo  *  >> config.json
echo  * You will also need to specify >> config.json
echo  * the redirect url under allowed settings as the return url that LWA >> config.json
echo  * will call back to with the authorization code.  The authresponse endpoint >> config.json
echo  * is setup in app.js, and should not be changed.   >> config.json
echo  *  >> config.json
echo  * lwaRedirectHost and lwaApiHost are setup for login with Amazon, and you should >> config.json
echo  * not need to modify those elements. >> config.json
echo  */ >> config.json
echo var config = { >> config.json
echo     clientId: '', >> config.json
echo     clientSecret: '', >> config.json
echo     redirectUrl: '%ALEXA_SERVER_URL%/authresponse', >> config.json
echo     lwaRedirectHost: 'amazon.com', >> config.json
echo     lwaApiHost: 'api.amazon.com', >> config.json
echo     validateCertChain: true, >> config.json
echo     products: { >> config.json
echo         "%PRODUCT_TYPE_ID%": ["%UNIQUE_PRODUCT_ID%"], // Fill in with valid device values, eg: "testdevice1": ["DSN1234", "DSN5678"] >> config.json
echo     }, >> config.json
echo }; >> config.json
echo  >> config.json
echo module.exports = config; >> config.json

echo Your server's config.json at %CD% contains:
type config.json

call npm start
if errorlevel 1 goto :EOF

popd