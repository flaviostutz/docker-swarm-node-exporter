FROM prom/node-exporter:v0.14.0

ENV NODE_ID ""

USER root

COPY entrypoint.sh /

ENTRYPOINT  [ "/entrypoint.sh" ]
CMD [ "/bin/node_exporter" ]
