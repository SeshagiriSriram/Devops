# syntax=docker/dockerfile:1
# dont really need this. 
# added only for ease of explaingin to Windows Users not familiar with multi-stage builds
# and to show that you can have multiple FROM statements in a Dockerfile
# and for users not familiar with HERE Documents in bash
# https://docs.docker.com/engine/reference/builder/#/from
FROM golang:1.23
WORKDIR /src
COPY ./main.go ./main.go
RUN go build -o /bin/hello ./main.go

FROM scratch
COPY --from=0 /bin/hello /bin/hello
CMD ["/bin/hello"]
