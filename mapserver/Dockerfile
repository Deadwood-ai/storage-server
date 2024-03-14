FROM pdok/mapserver:7.6.4

# copy our own lighttpd.conf
COPY .config/lighttpd.conf /srv/mapserver/config/lighttpd.conf


# switch back to root
USER root
CMD ["lighttpd", "-D", "-f", "/srv/mapserver/config/lighttpd.conf"]