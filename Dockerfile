FROM golang:1.19 AS builder
WORKDIR /app
COPY . .
RUN go build -o main main.go

FROM scratch
COPY --from=builder /app/main /main
ENTRYPOINT ["/main"]