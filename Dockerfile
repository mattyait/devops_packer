FROM alpine:latest
MAINTAINER "The Packer Team <packer@hashicorp.com>"

ENV PACKER_VERSION=1.4.0
ENV PACKER_SHA256SUM=7505e11ce05103f6c170c6d491efe3faea1fb49544db0278377160ffb72721e4

RUN apk add --update git bash wget openssl
RUN apk add py-pip && \
    pip install --upgrade pip && \
    pip install awscli
    
ADD https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip ./
ADD https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_SHA256SUMS ./

RUN sed -i '/.*linux_amd64.zip/!d' packer_${PACKER_VERSION}_SHA256SUMS
RUN sha256sum -cs packer_${PACKER_VERSION}_SHA256SUMS
RUN unzip packer_${PACKER_VERSION}_linux_amd64.zip -d /bin
RUN rm -f packer_${PACKER_VERSION}_linux_amd64.zip

WORKDIR /mnt
