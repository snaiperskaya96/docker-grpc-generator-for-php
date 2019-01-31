# docker-grpc-generator-for-php
A docker image that generates gRPC stuff for PHP

## Why
I've spent too much time trying to get this to work, so I thought it might be useful for someone else out there

## Usage
The container will expect a folder mounted on /in and another folder mounted on /out, where the former contains .proto files and the latter the generated files. The entrypoint argument specifies the .proto file to be parsed.

## Building the image
`docker build -t grpc-php:latest`
or just use it within a docker-compose file using the `build` directive instead of `image`
## Examples
I personally use it with docker-compose (anti-pattern detected!) but i assume someone could just run this:
```bash
docker run --rm  -v "path/to/my/protos:/in" -v "path/to/my/generated/files:/out" grpc-php:latest path/to/my/protocol.proto
```
or with docker-compose, like:
```yml
version: '3'
services:
  build-protos:
    build: ./docker-grpc-generator-for-php
    command: ./path/to/my/protocol.proto
    volumes:
      - path/to/my/protos:/in
      - path/to/my/generated/files:/out
```
