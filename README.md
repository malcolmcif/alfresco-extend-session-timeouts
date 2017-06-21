#Description 
This modification extends the default session timeout for web clients from 1 hour to 16 hours.

The following files are deployed to you installation:
./Alfresco/src/main/amp/web/WEB-INF/web.xml (via alfresco amp)
./Share/src/main/amp/web/WEB-INF/web.xml (via share amp)
./tomcat/shared/classes/alfresco/extension/custom-authentication-timeout-context.xml (copy to your extension folder)

#Deployment
Look in the Makefile

#Note
The timeout specified in the custom-authentication-timeout-context.xml file must be greater than the timeout specified in the web.xml files. If it is not then the upload new version action can fail in a manner where by the user is unaware it has failed.

#Supported Alfresco
* only tested with 201605 of Alfresco Community
