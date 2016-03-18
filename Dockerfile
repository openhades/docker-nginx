FROM centos:centos7

RUN rpm --import http://mirror.centos.org/centos/7/os/x86_64/RPM-GPG-KEY-CentOS-7
RUN yum install -y epel-release
RUN yum update -y
RUN echo -e "[nginx]\nname=nginx repo\nbaseurl=http://nginx.org/packages/mainline/centos/\$releasever/\$basearch/\ngpgcheck=0\nenabled=1\n" > /etc/yum.repos.d/nginx.repo
RUN yum install -y nginx

WORKDIR /etc/nginx

CMD ["nginx", "-g", "daemon off;"]

EXPOSE 80
