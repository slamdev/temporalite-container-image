FROM alpine:3.18.4

ARG TARGETARCH
ARG TEMPORALITE_VERSION

RUN wget -q https://github.com/temporalio/cli/releases/download/v${TEMPORALITE_VERSION}/temporal_cli_${TEMPORALITE_VERSION}_linux_${TARGETARCH}.tar.gz -O temporal_cli.tar.gz \
 && tar -xf temporal_cli.tar.gz temporal -C /usr/local/bin/ \
 && rm -rf temporal_cli.tar.gz

EXPOSE 7233 8233

ENTRYPOINT ["temporal", "server", "start-dev", "--ip=0.0.0.0"]

CMD ["--namespace=default"]
