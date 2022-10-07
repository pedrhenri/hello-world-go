FROM golang:1.8 as build
WORKDIR /go/src/hello-world
COPY hello-world.go .
RUN go build -o hello-world .

FROM alpine:latest
COPY --from=build /go/src/hello-world/hello-world /bin
CMD hello-world