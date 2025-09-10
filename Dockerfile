# Simple single-stage Dockerfile for Go tracker project
FROM golang:1.21.0
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN go build -o tracker .
COPY tracker.db .
EXPOSE 8080
CMD ["./tracker"]
