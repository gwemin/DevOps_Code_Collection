FROM alpine

RUN apk update && upgrade && apk add curl

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]