FROM arm64v8/alpine:latest

LABEL maintainer="Bluewalk"
LABEL documentation="https://github.com/bluewalk/unifi-udm-protect-mqtt"

RUN apk add --no-cache inotify-tools mosquitto-clients

COPY ./unifi-udm-protect-mqtt.sh /

RUN addgroup -g 902 -S unifi && \
    addgroup -g 903 -S unifi-protect && \
    addgroup -g 9903 -S unifi-protect-mqtt && \
    adduser -G unifi-protect-mqtt -S -u 9903 unifi-protect-mqtt && \
    addgroup unifi-protect-mqtt unifi && \
    addgroup unifi-protect-mqtt unifi-protect
USER unifi-protect-mqtt

ENTRYPOINT [ "/bin/sh", "/unifi-udm-protect-mqtt.sh" ]
