#!/bin/sh

set -e

# 512 MB of memory should be available before trying to run Jenkins!
CON_MEM_MIN=536870912
: ${CON_MEM:=${CON_MEM_MIN}}

# hostname for the container
: ${CON_NAME:=jenkins}


# memory information which will make up JAVA_OPTS
JAVA_OPTS=
JAVA_MEM_PERM=134217728 # 128 MB for the Java Permament Size
JAVA_MEM_APP=268435456  # 256 MB for the application (minimum)


_bc(){
  cat - | bc | awk -F . '{print $1}'
}


if [ $CON_MEM -lt $CON_MEM_MIN ]; then
  echo "Memory provided (${CON_MEM}) less then minimum memory required (${CON_MEM_MIN})" >&2
  exit 123
fi


APP_MEM_AVAIL=$( echo "scale=2; $CON_MEM / 100 * 75" | _bc )
JAVA_MEM_APP=$(( $APP_MEM_AVAIL - $JAVA_MEM_PERM ))


JAVA_OPTS="-Xms${JAVA_MEM_APP} -Xmx${JAVA_MEM_APP} -XX:MaxPermSize=${JAVA_MEM_PERM}"


# hack containers /etc/hosts
echo >> /etc/hosts $( ip a show dev eth0 | awk '/inet\ /{split($2, a, "/"); print a[1]}' ) $CON_HOSTNAME


# run Jenkins
/usr/bin/java $JAVA_OPTS -jar /usr/share/jenkins/jenkins.war
