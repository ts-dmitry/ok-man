FROM nginx:1.19.6-alpine

RUN addgroup okman && adduser --disabled-password okman -G okman

COPY --chown=okman:okman nginx.conf /etc/nginx/nginx.conf

RUN chown -R okman.okman /var/cache/nginx && \
    chown -R okman.okman /var/log/nginx && \
    touch /var/run/nginx.pid && \
    chown -R okman.okman /var/run/nginx.pid && \
    chown -R okman.okman /docker-entrypoint.d/

USER okman