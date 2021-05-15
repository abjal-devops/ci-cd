#!/bin/bash
mv /usr/local/tomcat/webapps/java-web-project /usr/local/tomcat/webapps/ROOT
/usr/local/tomcat/bin/catalina.sh run
sleep 15
mv /usr/local/tomcat/webapps/java-web-project /usr/local/tomcat/webapps/ROOT


