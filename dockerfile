FROM golang:alpine as build-env

RUN apk update && apk add bash ca-certificates git gcc g++ libc-dev

RUN mkdir /chat_app_grpc
RUN mkdir -p /chat_app_grpc/proto

WORKDIR /chat_app_grpc

COPY ./proto/service.pb.go /chat_app_grpc/proto
COPY ./main.go /chat_app_grpc

RUN go get google.golang.org/grpc/grpclog
RUN go get google.golang.org/grpc

RUN go build -o chat_app_grpc .
CMD ./docker_example
