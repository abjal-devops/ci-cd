#!/bin/bash
/usr/local/tomcat/bin/catalina.sh run
sleep 15
cp target/*.war /usr/local/tomcat/webapps
cp -R  /usr/local/tomcat/webapps/java-web-project /usr/local/tomcat/webapps/ROOT



