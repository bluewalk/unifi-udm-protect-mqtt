FROM arm64v8/alpine:latest

LABEL maintainer="Bluewalk"
LABEL documentation="https://github.com/bluewalk/unifi-udm-protect-mqtt"

RUN apk add --no-cache inotify-tools mosquitto-clients

COPY ./unifi-udm-protect-mqtt.sh /

ENTRYPOINT [ "/bin/sh", "/unifi-udm-protect-mqtt.sh" ]