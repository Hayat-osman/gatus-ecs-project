FROM cgr.dev/chainguard/go@sha256:de16290c696963903cb430c6dfd1842defca9006b97e67dfa8a366ef3ca4621e AS builder

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -a -o /gatus .


FROM cgr.dev/chainguard/static:latest

LABEL org.opencontainers.image.source="https://github.com/Hayat-osman/gatus-ecs-project" \
      org.opencontainers.image.description="Gatus health monitoring on AWS ECS Fargate" \
      org.opencontainers.image.version="1.0.0"

COPY --from=builder /gatus /gatus

COPY config.yaml /config/config.yaml

ENV GATUS_LOG_LEVEL="INFO"

EXPOSE 8080

ENTRYPOINT ["/gatus"]