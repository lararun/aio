FROM lararun/web
COPY aio.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]