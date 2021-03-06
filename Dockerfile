FROM apemberton/jenkins-enterprise
MAINTAINER Tracy Kennedy

USER root
RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install git vim
RUN printf "AddressFamily inet" >> /etc/ssh/ssh_config 

EXPOSE 8080 22 9990 8888 443
ENV JENKINS_HOME /var/lib/jenkins


ENTRYPOINT ["java", "-jar", "jenkins.war", "--httpPort=8888"]
CMD ["--prefix=/jenkins"]