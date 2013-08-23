# Jenkins
#
# VERSION 0.0.1

FROM base:ubuntu-quantal
MAINTAINER Mark Kusch "mark.kusch@silpion.de"

# install everything required to run jenkins
#   provide static files for required system configuration
ADD assets/jenkins-ci.org.gpg.pub /tmp/jenkins-ci.org.gpg.pub
ADD assets/etc/apt/apt.conf.d/99silpion /etc/apt/apt.conf.d/99silpion
ADD assets/etc/apt/sources.list.d/jenkins-ci.list /etc/apt/sources.list.d/jenkins-ci.list
ADD assets/usr/local/sbin/jenkins.sh /usr/local/sbin/jenkins.sh
#   install jenkins and perform a packages cache cleanup
RUN install -d /srv/jenkins/home
RUN install -d /srv/jenkins/var/builds
RUN install -d /srv/jenkins/cache/workspaces
RUN apt-key add /tmp/jenkins-ci.org.gpg.pub
RUN rm -f /tmp/jenkins-ci.org.gpg.pub
RUN DEBIAN_FRONTEND=noninteractive apt-get -q -y update
RUN DEBIAN_FRONTEND=noninteractive apt-get -q -y install jenkins bc
RUN rm -rf /var/lib/apt /var/lib/aptitude /var/cache/apt/archives/*.deb /usr/share/doc


CMD ["/usr/local/sbin/jenkins.sh"]
