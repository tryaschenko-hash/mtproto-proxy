FROM alpine:3.19

RUN apk add --no-cache python3 git

WORKDIR /app

RUN git clone https://github.com/alexbers/mtprotoproxy.git /tmp/mtprotoproxy && \
    cp -r /tmp/mtprotoproxy/* /app/ && \
    rm -rf /tmp/mtprotoproxy

COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

EXPOSE 443

ENTRYPOINT ["/app/entrypoint.sh"]
