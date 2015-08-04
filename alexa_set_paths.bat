@echo off
REM alexa_set_paths.bat file
REM Set paths and values.

REM Be sure the following paths correctly point to your system's directories
SET JAVA_HOME=C:\Program Files (x86)\Java\jdk1.7.0_55
SET MAVEN_PATH=C:\sw\samples\apache-maven-3.3.3
SET NODEJS_PATH=C:\Program Files (x86)\nodejs
SET OPENSSL_PATH=C:\OpenSSL-Win32
SET REFERENCE_IMPLEMENTATION=C:\sw\samples\AlexaVoiceServiceExamples
SET VLC_PATH=C:\Program Files (x86)\VideoLAN\VLC
REM not working - unknown path problem - @SET MAVEN_OPTS=-Djna.library.path=%VLC_PATH%

REM Sample values. You probably will want to change these. These values are used for client device and server.
SET PRODUCT_TYPE_ID=my_device
SET UNIQUE_PRODUCT_ID=123456
SET ALEXA_SERVER_URL=https://localhost:3000

REM Fill in your unique authorization values created by Amazon AVS. https://developer.amazon.com/edw/home.html#/avs/list. They are need to run server.
SET CLIENT_ID=amzn1.application-oa2-client.11727118dfcb4d15ada8fdb59efc86ac
SET CLIENT_SECRET=a84a5ee771edbec987f4a8560da061788ee28a5d551a80e6da7ff5fe64776f8d

REM Following are commands that attempt to validate the above settings.

IF NOT DEFINED JAVA_HOME (
	echo "JAVA_HOME does not exist"
	goto :EOF
) ELSE (
	IF NOT EXIST "%JAVA_HOME%\bin\java.exe" (
		echo "JAVA_HOME directory is invalid - %JAVA_HOME%\bin"
		goto :EOF )
	)
	
IF NOT DEFINED MAVEN_PATH (
	echo "MAVEN_PATH does not exist"
	goto :EOF
) ELSE (
	IF NOT EXIST "%MAVEN_PATH%\bin\mvn" (
		echo "MAVEN_PATH directory is invalid - %MAVEN_PATH%\bin"
		goto :EOF )
	)
	
IF NOT DEFINED NODEJS_PATH (
	echo "NODEJS_PATH does not exist"
	goto :EOF
) ELSE (
	IF NOT EXIST "%NODEJS_PATH%\node.exe" (
		echo "NODEJS_PATH directory is invalid - %NODEJS_PATH%\bin"
		goto :EOF )
	)
	
IF NOT DEFINED OPENSSL_PATH (
	echo "OPENSSL_PATH does not exist"
	goto :EOF
) ELSE (
	IF NOT EXIST "%OPENSSL_PATH%\bin\openssl.exe" (
		echo "OPENSSL_PATH directory is invalid - %OPENSSL_PATH%\bin"
		goto :EOF )
	)
	
IF NOT DEFINED REFERENCE_IMPLEMENTATION (
	echo "REFERENCE_IMPLEMENTATION does not exist"
	goto :EOF
) ELSE (
	IF NOT EXIST "%REFERENCE_IMPLEMENTATION%\samples" (
		echo "REFERENCE_IMPLEMENTATION directory is invalid - %REFERENCE_IMPLEMENTATION%\bin"
		goto :EOF )
	)
	
IF NOT DEFINED VLC_PATH (
	echo "VLC_PATH does not exist"
	goto :EOF
) ELSE (
	IF NOT EXIST "%VLC_PATH%\vlc.exe" (
		echo "VLC_PATH directory is invalid - %VLC_PATH%\bin"
		goto :EOF )
	)

IF "%CLIENT_ID%"=="" (
    echo Missing CLIENT_ID
    goto :EOF
    )

IF "%CLIENT_SECRET%"=="" (
    echo Missing CLIENT_SECRET
    goto :EOF
    )

IF "%PRODUCT_TYPE_ID%"=="" (
    echo Missing PRODUCT_TYPE_ID
    goto :EOF
    )

IF "%UNIQUE_PRODUCT_ID%"=="" (
    echo Missing UNIQUE_PRODUCT_ID
    goto :EOF
    )

IF "%ALEXA_SERVER_URL%"=="" (
    echo Missing ALEXA_SERVER_URL
    goto :EOF
    )


