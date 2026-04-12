# builder 

FROM golang:alpine AS builder

RUN apk --update add ca-certificates

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

RUN addgroup -S nonroot && adduser -S nonroot -G nonroot

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o /gatus .

# runtime

FROM scratch

COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt

COPY --from=builder /etc/passwd /etc/passwd

COPY --from=builder /etc/group /etc/group

COPY --from=builder /gatus /gatus

COPY config.yaml /config/config.yaml

ENV GATUS_LOG_LEVEL="INFO"

USER nonroot

EXPOSE 8080

ENTRYPOINT ["/gatus"]