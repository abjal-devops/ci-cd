FROM tomcat:8.0
COPY target/*.war .
RUN mv /usr/local/tomcat/webapps/ROOT /usr/local/tomcat/webapps/ROOT.old
COPY startup.sh .
CMD ["sh","startup.sh"]
#CMD ["catalina.sh","run"]
