FROM adrianovieira/httpd:2.4.6

MAINTAINER Adriano Vieira <adriano.svieira at gmail.com>

RUN  yum install -y epel-release ; \
    curl --fail -sSLo /etc/yum.repos.d/passenger.repo https://oss-binaries.phusionpassenger.com/yum/definitions/el-passenger.repo ; \
    yum install -y mod_passenger ; \
    /usr/bin/passenger-config validate-install ; \
    /usr/sbin/passenger-memory-stats ; \
    yum clean all