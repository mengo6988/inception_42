#!/bin/sh

sed -i "s|bind 127.0.0.1|#bind 127.0.0.1|g" /etc/redis/redis.conf

echo "maxmemory 256mb" >> /etc/redis/redis.conf

redis-server --protected-mode no
