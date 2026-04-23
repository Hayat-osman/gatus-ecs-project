FROM cgr.dev/chainguard/go:latest AS builder

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o /gatus .


FROM cgr.dev/chainguard/static:latest

LABEL org.opencontainers.image.source="https://github.com/Hayat-osman/gatus-ecs-project" \
      org.opencontainers.image.description="Gatus health monitoring on AWS ECS Fargate" \
      org.opencontainers.image.version="1.0.0"

COPY --from=builder /gatus /gatus

COPY config.yaml /config/config.yaml

ENV GATUS_LOG_LEVEL="INFO"

EXPOSE 8080

ENTRYPOINT ["/gatus"]