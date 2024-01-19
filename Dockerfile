FROM python:slim

LABEL maintainer="Wes Lambert, @therealwlambert"
LABEL description="Docker image for YARA Forge, written by Florian Roth - https://github.com/yarahq/yara-forge"

RUN apt-get update -y && \
    apt-get install build-essential \
    git \
    gcc \
    libre2-dev \
    libssl-dev \
    pkg-config -y && \
    git clone https://github.com/YARAHQ/yara-forge /yara-forge && \
    cd /yara-forge && \ 
    pip install --user --no-cache-dir --upgrade pip && \
    pip install --user --no-cache-dir -r requirements.txt && \
    cd /yara-forge/qa && \
    git clone https://github.com/Neo23x0/yaraQA && \
    cd /yara-forge/qa/yaraQA && \
    pip install --user --no-cache-dir -r requirements.txt && \
    apt-get remove gcc libssl-dev -y && \
    apt-get autoremove -y

WORKDIR /yara-forge

