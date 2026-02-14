FROM golang as builder
RUN go install github.com/caddyserver/xcaddy/cmd/xcaddy@v0.4.5 && \
        xcaddy build v2.10.2 --with github.com/dippysan/caddy_dns_spaceship@v1.0.7

FROM caddy:2.10.2-alpine
COPY --from=builder /go/caddy /usr/bin/caddy
