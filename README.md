# AlexaReferenceSampleBatchFiles
Windows Batch Files to Automate Execution of Amazon Alexa Reference Sample

I've create Windows batch files to automate execution of the Reference Preview Sample. Currently there's only one sample on Amazon's website. You need to thoroughly review Amazon's sample's documentation before using the batch files.

https://developer.amazon.com/public/solutions/alexa/alexa-voice-service/docs/reference-implementation-guide

There are five batch files. I run them from C:\Temp. I'm using a Windows 10 system.

1. alexa_set_paths.bat contains path and value settings. YOU MUST MODIFY THE SETTINGS FOR YOUR INSTALLATION. This batch file is called by all other batch files.

2. alexa_install_openssl_cert.bat creates an ssl certificate for your server. Be sure to specify "localhost" in the FQN prompt as Amazon as documented. This is the only batch file that needs Administrator mode.

3. alexa_run_server.bat start the server.

4. alexa_create_config.bat creates the client device config.json file.

5. alexa_run_client.bat starts the client device. 
