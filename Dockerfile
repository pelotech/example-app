FROM golang:alpine AS builder
WORKDIR /usr/src/example-app
COPY . .
RUN go build -v -o /usr/local/bin/example-app main.go

FROM scratch
COPY --from=builder /usr/local/bin/example-app /usr/local/bin/
CMD ["example-app"]
