FROM bitnami/codeigniter:3

RUN apt-get update && apt-get install -y \
 python3 \
 python3-pip \
 && python3 -m pip install --no-cache-dir --upgrade pip \
 && pip3 install --upgrade --no-cache-dir "supervisor>=4" \
 && mkdir -p /var/log/supervisor \
 && echo_supervisord_conf > /etc/supervisord.conf \
 && echo "\n[include]\nfiles = /etc/supervisor.d/*.ini" >> /etc/supervisord.conf

COPY docker/supervisor/ /etc/supervisor.d/

COPY docker/docker-entrypoint.sh /
RUN chmod a+x /docker-entrypoint.sh
WORKDIR /app
EXPOSE 8000/tcp

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["supervisord", "-c", "/etc/supervisord.conf", "-n"]
