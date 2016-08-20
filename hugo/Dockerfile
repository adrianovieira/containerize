FROM centos:7
MAINTAINER Adriano Vieira <adriano.svieira at gmail.com>
# install base packs
RUN rpm -ivh https://github.com/spf13/hugo/releases/download/v0.16/hugo-0.16-2.el6.x86_64.rpm;

# possible environment variables to setup
ENV HUGO_BASE_URL http://localhost
ENV HUGO_BASE_URL_PORT 1313
ENV HUGO_BUILD_DRAFTS --buildDrafts
ENV HUGO_WATCH false

# possible hugo ports
EXPOSE 1313
EXPOSE 80

WORKDIR /var/www/html/site

# add your source <website> directory
# ADD website /var/www/html/site

# run Hugo site
CMD hugo server --verbose --verboseLog --watch=${HUGO_WATCH} ${HUGO_BUILD_DRAFTS} --bind=0.0.0.0 --baseURL ${HUGO_BASE_URL} --port ${HUGO_BASE_URL_PORT}
