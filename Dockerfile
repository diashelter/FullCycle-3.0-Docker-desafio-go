FROM golang:1.18-alpine3.15 AS builder

WORKDIR /app

COPY hello.go /app

RUN go build -o hello hello.go

FROM scratch

WORKDIR /app

COPY --from=builder /app/hello .

ENTRYPOINT [ "/app/hello" ]
