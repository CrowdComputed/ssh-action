FROM alpine:latest

# 清理缓存并更新包
RUN apk update && apk upgrade

# 重新安装 OpenSSL 和相关包
RUN apk del openssl
RUN apk add --no-cache openssl ca-certificates

# 然后安装其他需要的包
RUN apk add --no-cache openssh-client sshpass bash

COPY LICENSE README.md /

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
