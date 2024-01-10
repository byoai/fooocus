FROM runpod/pytorch:2.1.1-py3.10-cuda12.1.1-devel-ubuntu22.04

ARG FOOCUS_REPO=lllyasviel/Fooocus

RUN apt-get update && \
    apt-get upgrade --assume-yes && \
    apt-get clean && \
    rm --recursive --force /var/lib/apt/lists/*

WORKDIR /

RUN curl --location https://github.com/${FOOCUS_REPO}/archive/main.zip --output fooocus.zip && \
    unzip fooocus.zip

WORKDIR /Fooocus-main

RUN pip install --no-cache-dir --requirement requirements_versions.txt
