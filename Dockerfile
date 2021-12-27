# syntax=docker/dockerfile:experimental
FROM alpine
RUN apk add --no-cache openssh-client
RUN mkdir -p -m 0600 ${HOME}/.ssh && ssh-keyscan github.com >> ${HOME}/.ssh/known_hosts
RUN --mount=type=ssh ssh-add -L
RUN --mount=type=ssh ssh git@github.com
RUN --mount=type=ssh git clone git@github.com:kelvintaywl/aws-s3-copy-experiment.git

ENTRYPOINT ["git"]

CMD ["--version"]
