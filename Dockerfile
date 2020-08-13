# FROM prom/node-exporter:v1.0.1
FROM prom/node-exporter:v0.16.0

ENV NODE_ID ""

USER root

COPY startup.sh /

ENTRYPOINT  [ "/startup.sh" ]
# CMD [ "/startup.sh" ]
