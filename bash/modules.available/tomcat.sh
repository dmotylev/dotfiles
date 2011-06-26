export JPDA_OPTS="-Xdebug -Xrunjdwp:transport=dt_socket,address=56789,suspend=n,server=y"
export CATALINA_HOME="${HOME}/Library/Tomcat/Current" 
export CATALINA_PID="${CATALINA_HOME}/catalina.pid"
CATALINA_OPTS="${CATALINA_OPTS} -server -d64 -Xms256m -Xmx512m -XX:MaxPermSize=256m -Dfile.encoding=UTF-8 -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=${CATALINA_HOME}"
CATALINA_OPTS="${CATALINA_OPTS} -Djava.awt.headless=true"
CATALINA_OPTS="${CATALINA_OPTS} -Dcom.sun.management.config.file=${HOME}/Library/Tomcat/jmxremote.config"
CATALINA_OPTS="${CATALINA_OPTS} -Dgog.home=${GOG_HOME}"
CATALINA_OPTS="${CATALINA_OPTS} -Djavax.net.ssl.trustStore=${HOME}/Library/GOG/ssl/jssecacerts"
export CATALINA_OPTS
