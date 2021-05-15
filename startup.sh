#!/bin/bash
cp -R  /usr/local/tomcat/webapps/java-web-project /usr/local/tomcat/webapps/ROOT
/usr/local/tomcat/bin/catalina.sh run
sleep 15
cp -R /usr/local/tomcat/webapps/java-web-project /usr/local/tomcat/webapps/ROOT


