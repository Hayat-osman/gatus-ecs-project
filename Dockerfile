# builder 

FROM golang@sha256:c2a1f7b2095d046ae14b286b18413a05bb82c9bca9b25fe7ff5efef0f0826166 AS builder

WORKDIR /app

RUN apk --update add ca-certificates && \
    addgroup -S nonroot && \
    adduser -S nonroot -G nonroot

COPY go.mod go.sum ./

RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o /gatus . && \
    chown nonroot:nonroot /gatus

# runtime 
FROM scratch

LABEL org.opencontainers.image.source="https://github.com/Hayat-osman/gatus-ecs-project" \
      org.opencontainers.image.description="Gatus health monitoring on AWS ECS Fargate" \
      org.opencontainers.image.version="1.0.0"

COPY --from=builder /etc/passwd /etc/group /etc/

COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt

COPY --from=builder /gatus /gatus

COPY config.yaml /config/config.yaml

ENV GATUS_LOG_LEVEL="INFO"

USER nonroot

EXPOSE 8080

ENTRYPOINT ["/gatus"]