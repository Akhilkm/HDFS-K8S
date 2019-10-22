
# Create hadoop user with no password
RUN apk update \
    && apk add --no-cache openssh \
    && adduser -D hadoop
USER hadoop

