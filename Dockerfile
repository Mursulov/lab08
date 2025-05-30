FROM ubuntu:24.04

RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    lcov \
    g++ \
    && rm -rf /var/lib/apt/lists/*

COPY . /app
WORKDIR /app


RUN git submodule init && git submodule update

RUN mkdir -p build


RUN cd build && \
    cmake -DCMAKE_BUILD_TYPE=Debug -DCOVERAGE=ON .. && \
    cmake --build . --config Debug --parallel $(nproc)


RUN find build -name RunTest
RUN find build -name RunTest -exec {} \;


RUN cd build && \
    lcov --capture --directory . --output-file coverage.info \
    --rc geninfo_unexecuted_blocks=1 \
    --ignore-errors mismatch,unused || true && \
    lcov --remove coverage.info \
    '/usr/*' \
    '*/googletest/*' \
    '*/test/*' \
    --output-file coverage.info \
    --ignore-errors unused || true && \
    genhtml coverage.info --output-directory coverage_report \
    --ignore-errors unmapped,unused || true

CMD ["bash"]
