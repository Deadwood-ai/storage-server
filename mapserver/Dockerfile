FROM pdok/mapserver:7.6.4-patch-5-6

ARG UID=1000
ARG GID=$UID

# copy our own lighttpd.conf
COPY config/lighttpd.conf /srv/mapserver/config/lighttpd.conf


# set the UID we will use on the storage server
USER root
CMD ["lighttpd", "-D", "-f", "/srv/mapserver/config/lighttpd.conf"]