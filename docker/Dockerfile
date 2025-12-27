# Stage 1: build
FROM golang:1.21-alpine AS builder
WORKDIR /app

# Copiar go.mod e go.sum primeiro para cache de dependências
COPY go.mod go.sum ./
RUN go mod download

# Copiar código-fonte
COPY . .

# Compilar binário
RUN go build -o go-notes-app .

# Stage 2: runtime
FROM alpine:latest
WORKDIR /app

# Copiar binário e templates
COPY --from=builder /app/go-notes-app .
COPY --from=builder /app/templates ./templates

# Porta definida pelo env
EXPOSE 8080

# Comando de execução
CMD ["./go-notes-app"]