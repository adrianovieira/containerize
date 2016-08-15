FROM centos:7
MAINTAINER Adriano Vieira <adriano.svieira at gmail.com>
# install base packs
RUN rpm -ivh https://github.com/spf13/hugo/releases/download/v0.16/hugo-0.16-2.el6.x86_64.rpm;

ENV HUGO_BASE_URL http://localhost
ENV HUGO_BUILD_DRAFTS --buildDrafts

EXPOSE 1313

WORKDIR /var/www/html/site
VOLUME ["/var/www/html/site"]
ADD devopsdays-web /var/www/html/site

# run Hugo site
CMD hugo server --watch=false ${HUGO_BUILD_DRAFTS} --bind=0.0.0.0 --baseURL ${HUGO_BASE_URL} --port 1313 --destination="/var/www/html/site_watch"
