#!/bin/bash
nohup /usr/local/tomcat/bin/catalina.sh run &
cp /usr/local/tomcat/*.war /usr/local/tomcat/webapps/
cp -R  /usr/local/tomcat/webapps/java-web-project /usr/local/tomcat/webapps/ROOT



