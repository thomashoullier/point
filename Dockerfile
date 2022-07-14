FROM fukamachi/sbcl:latest-alpine

RUN apk add git file && \
    ros install fukamachi/rove fukamachi/cl-coveralls
RUN ros install alexandria

ENTRYPOINT ["/bin/sh"]
