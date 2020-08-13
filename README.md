## docker-swarm-node-exporter

This is an extension of the original node exporter for being used with Swarm Clusters so that as special metric with Swarm Node ID and hostname is generated for later join operations.

Inspired on https://github.com/stefanprodan/swarmprom

### Usage
docker-compose.yml

```
version: '3.5'

services:
  node-exporter:
    image: flaviostutz/docker-swarm-node-exporter
    environment:
      - NODE_ID={{.Node.ID}}
    volumes:
      - /proc:/host/proc:ro
      - /sys:/host/sys:ro
      - /:/rootfs:ro
      - /etc/hostname:/etc/nodename
    networks:
      - metrics-net
    deploy:
      mode: global
      resources:
        limits:
          memory: 128M
        reservations:
          memory: 64M
```

Sample Prometheus query displaying metrics along with node id:

```
100 - (avg(irate(node_cpu{mode="idle"}[$interval])  * on(instance) group_left(node_name) node_meta{node_id=~"$node_id"} * 100) by (node_name))
```
