#!/bin/bash
set -e # Abortar se algum comando falhar

echo "A iniciar deployment..."

cd /home/appuser/go-notes

echo "Atualizar código"
git pull origin main

echo "Garantir dependências"
go get github.com/gofiber/fiber/v2
go get github.com/gofiber/template/html/v2
go get github.com/jackc/pgx/v5
go get golang.org/x/crypto/bcrypt
go mod tidy

echo "Compilar aplicação"
go build -o go-notes-app .

echo "Reiniciar serviço"
sudo systemctl restart go-notes

echo "Deployment concluído com sucesso"