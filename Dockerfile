FROM python:3.6.5-alpine
LABEL maintainer="samsongama@gmail.com"
ENV TENSORFLOW_VERSION 1.8.0

RUN mkdir build && cd build && apk update && \
    apk add musl-dev wget git build-base && \
    pip install cython && \
    ln -s /usr/include/locale.h /usr/include/xlocale.h  && \
    pip install numpy && \
    wget http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz && \
    pip install https://github.com/better/alpine-tensorflow/releases/download/alpine3.7-tensorflow1.7.0/tensorflow-1.7.0-cp36-cp36m-linux_x86_64.whl && \
    tar -xvzf ta-lib-0.4.0-src.tar.gz && \
    cd ta-lib/ && \
    ./configure --prefix=/usr && \
    make &&  make install && \
    cd / && \
    git clone https://github.com/mrjbq7/ta-lib.git  && cd ta-lib && python setup.py install && \
    cd / && \
    apk del musl-dev wget git build-base && rm -rf /build/ /ta-lib/
