FROM lararun/web
COPY aio.sh /run.sh
ENTRYPOINT ["/run.sh"]