# UniFi Protect MQTT for UDM
This container parses the UniFi Protect eventlog and publishes MQTT messages to specified topics when a motion starts and ends.

## Configuration
The following environment variables are required when no default has been set

| Variable | Description | Default |
|--|--|--|
| MQTT_BROKER | The DNS/IP address of the MQTT broker| `192.168.1.1` |
| MQTT_PORT |The port of the MQTT broker | `1883` |
| MQTT_TOPIC_BASE | The base topic | `unifi/camera/motion` |
| MQTT_START_PAYLOAD | Payload when motion detected | `Start` |
| MQTT_STOP_PAYLOAD | Payload when the motion ends | `Stop` |
| MQTT_USER | Username of the MQTT broker | - |
| MQTT_PASS | Password of the user | - |
| MQTT_ID | Id of client (to make it work with Hassio) | - |

## Start container on your UDM
```
 podman run --restart always --name protect-mqtt --detach=true \
    -e MQTT_BROKER=192.168.1.x \
    -v /srv/unifi-protect/logs:/logs:ro \
    --network=host \
    bluewalk/unifi-udm-protect-mqtt:latest
```
