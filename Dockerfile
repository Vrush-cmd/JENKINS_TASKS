FROM centos:latest


RUN yum install wget -y
RUN wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
RUN rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
RUN yum upgrade -y
RUN yum install epel-release java-11-openjdk-devel -y
RUN yum install jenkins -y



RUN echo "jenkins ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers


USER jenkins
ENV USER jenkins


CMD ["java", "-jar", "/usr/lib/jenkins/jenkins.war"]
