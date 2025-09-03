FROM alpine:3.19
ENV ALPINE_VERSION 3.19

RUN apk add --no-cache dos2unix bash cups cups-filters

# Install GNU libc for rastertoR880NPII
RUN apk add --no-cache libc6-compat

# Install fonts
RUN apk add --no-cache freetype ttf-freefont fontconfig && \
  apk add --no-cache --virtual .build-deps msttcorefonts-installer && \
  update-ms-fonts && \
  fc-cache -f && \
  rm -rf /tmp/* && \
  apk del .build-deps

WORKDIR /

COPY ./docker-entrypoint.sh .
COPY ./driver/R880NPII/R880NPII.ppd /ppd/
COPY ./driver/R880NPII/rastertoR880NPII /usr/lib/cups/filter/rastertoR880NPII

RUN dos2unix docker-entrypoint.sh && chmod +x docker-entrypoint.sh
RUN chown root:root /usr/lib/cups/filter/rastertoR880NPII

# add root user to lpadmin to allow printing
RUN addgroup root lpadmin

# add admin user for cups remote administration (password: cupsadmin)
RUN adduser -D admin && \
  (printf 'cupsadmin\ncupsadmin' | passwd admin) && \
  adduser admin lpadmin

EXPOSE 631

ENTRYPOINT ["/docker-entrypoint.sh"]
