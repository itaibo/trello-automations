FROM alpine:latest

RUN apk add --no-cache bash curl jq

WORKDIR /scripts

COPY ./scripts ./

RUN find . -name "*.sh" -exec chmod +x {} \;

# Keep the container running
CMD ["tail", "-f", "/dev/null"]
