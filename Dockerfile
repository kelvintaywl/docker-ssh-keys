# syntax=docker/dockerfile:experimental
FROM alpine
RUN apk add --no-cache openssh-client
RUN mkdir -p -m 0600 ${HOME}/.ssh && ssh-keyscan github.com >> ${HOME}/.ssh/known_hosts
RUN --mount=type=ssh ssh-add -L
RUN --mount=type=ssh ssh git@github.com
