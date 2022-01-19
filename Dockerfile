ARG TAG
FROM ruby:${TAG}

RUN adduser -D -h /home/app -s /bin/sh -u 1001 app

WORKDIR /home/app

COPY --chown=app:app http_server.rb /home/app/

USER app

ENV WEB_PORT=8080

CMD [ "ruby", "/home/app/http_server.rb" ]
