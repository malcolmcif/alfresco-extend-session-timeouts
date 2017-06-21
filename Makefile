ALFRESCO_INSTALL=/opt/alfresco-community
COPY_FILES_SHARED = $(shell for file in `find shared -type f`;do echo install -D $$file /opt/alfresco-community/tomcat/$$file\;; done)

all: Web

Web:
	(. ./setupMaven.sh; cd Share; rm -rf target; mvn package)
	(. ./setupMaven.sh; cd Alfresco; rm -rf target; mvn package)

Deploy:
	install -D tomcat/shared/classes/alfresco/extension/custom-authentication-timeout-context.xml $(ALFRESCO_INSTALL)/tomcat/shared/classes/alfresco/extension/custom-authentication-timeout-context.xml
	install -D ./Share/target/ExtendSessionTimeoutShare.amp $(ALFRESCO_INSTALL)/amps
	install -D ./Alfresco/target/ExtendSessionTimeoutAlfresco.amp $(ALFRESCO_INSTALL)/amps_share

