FROM ubuntu:latest
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install -y build-essential autoconf libtool pkg-config git
RUN git clone https://github.com/grpc/grpc
RUN cd grpc && git submodule update --init && make -j$((`nproc --all` + 1)) grpc_php_plugin && make -j$((`nproc --all` + 1)) install
RUN mv /grpc/bins/opt /protoc
ENTRYPOINT ["/protoc/protobuf/protoc", "--proto_path=/in", "--php_out=/out", "--grpc_out=/out", "--plugin=protoc-gen-php", "--plugin=protoc-gen-grpc=/protoc/grpc_php_plugin"]
