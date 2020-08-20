# syntax = docker/dockerfile:experimental
FROM ubuntu:18.04

ARG TEKTON_CLI_VERSION
ENV TEKTON_CLI_VERSION=${TEKTON_CLI_VERSION:-0.8.0}

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# hadolint ignore=DL3009,SC2215
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        curl=7.58.0-2ubuntu3.10 \
        gnupg2=2.2.4-1ubuntu1.2 \
        ca-certificates=20180409

RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" |tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -

# hadolint ignore=DL3009,SC2215
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        google-cloud-sdk=306.0.0-0 \
        google-cloud-sdk-app-engine-python=306.0.0-0 \
        google-cloud-sdk-app-engine-python-extras=306.0.0-0

RUN curl -L https://github.com/tektoncd/cli/releases/download/v${TEKTON_CLI_VERSION}/tkn_${TEKTON_CLI_VERSION}_Linux_x86_64.tar.gz | tar xvz -C /usr/local/bin

RUN echo "source $(tkn completion bash) >> /root/.bashrc"

ENTRYPOINT ["/usr/local/bin/tkn"]
