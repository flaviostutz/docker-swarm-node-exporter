FROM prom/node-exporter:v1.0.1

ENV NODE_ID ""

USER root

COPY entrypoint.sh /

ENTRYPOINT  [ "/entrypoint.sh" ]
CMD [ "/bin/node_exporter" ]
