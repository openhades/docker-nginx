FROM centos:centos7
MAINTAINER Konrad Mosoń <morsik@darkserver.it>

RUN yum update -y && \
    echo -e "[nginx]\nname=nginx repo\nbaseurl=http://nginx.org/packages/mainline/centos/\$releasever/\$basearch/\ngpgcheck=0\nenabled=1\n" > /etc/yum.repos.d/nginx.repo && \
    yum install -y nginx && \
    yum clean all

WORKDIR /etc/nginx

ADD nginx-default.conf /etc/nginx/conf.d/default.conf
ADD entrypoint.sh /entrypoint
RUN chmod +x /entrypoint
CMD ["/entrypoint"]

EXPOSE 80
