FROM python:3.6.5
LABEL maintainer="samsongama@gmail.com"
COPY ta-lib-0.4.0-src.tar.gz /tmp/ta-lib-0.4.0-src.tar.gz
RUN mkdir build && cd build && apt-get update && \
    apt-get install -y wget git && \
    pip install cython numpy
RUN pip install --upgrade \
    https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-1.8.0-cp36-cp36m-linux_x86_64.whl
RUN cd /tmp && \
    tar -xvzf ta-lib-0.4.0-src.tar.gz && \
    cd ta-lib/ && \
    ./configure --prefix=/usr && \
    make &&  make install && \
    cd / && \
    git clone https://github.com/mrjbq7/ta-lib.git  && cd ta-lib && python setup.py install && \
    cd / && \
    apt-get remove -y wget git && rm -rf /build/ /ta-lib/
