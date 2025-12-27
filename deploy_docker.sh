#!/bin/bash
set -e

echo "=== Início do deployment Docker ==="

cd /home/appuser/go-notes

echo "Atualizar código"
git pull origin main

echo "Construir imagem da aplicação"
docker build \
  -t go-notes-app:latest \
  -f docker/Dockerfile .

echo "Arrancar stack Docker Compose"
docker compose -f docker/docker-compose.yml up -d

echo "Limpar imagens antigas"
docker image prune -f

echo "Deployment Docker concluído com sucesso"