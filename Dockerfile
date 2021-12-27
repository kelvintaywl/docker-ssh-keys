# syntax=docker/dockerfile:experimental
FROM alpine
RUN apk add --no-cache openssh-client
RUN --mount=type=ssh ssh-add -L
RUN --mount=type=ssh ssh git@github.com
