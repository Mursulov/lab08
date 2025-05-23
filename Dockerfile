FROM ubuntu:20.04

RUN apt update && apt install -y cmake g++ make

COPY . /app
WORKDIR /app

RUN cmake -S . -B build -DCMAKE_BUILD_TYPE=Release && \
    cmake --build build && \
    cmake --install build --prefix /app/install

ENV LOG_PATH=/var/log/solver.log
VOLUME /var/log

WORKDIR /app/install/bin
ENTRYPOINT ["./solver"]
