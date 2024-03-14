FROM pdok/mapserver:7.6.4-patch-5-6

ARG UID=1000
ARG GID=$UID

# copy our own lighttpd.conf
#COPY config/lighttpd.conf /srv/mapserver/config/lighttpd.conf


# set the UID we will use on the storage server
USER root
RUN groupmod --gid $GID www && usermod --uid $UID --gid $GID www
USER www
CMD ["lighttpd", "-D", "-f", "/srv/mapserver/config/lighttpd.conf"]