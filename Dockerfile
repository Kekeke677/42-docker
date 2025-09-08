FROM golang:1.21.0 AS builder
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o tracker .
FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/tracker .
COPY tracker.db .
EXPOSE 8080
CMD ["./tracker"]
