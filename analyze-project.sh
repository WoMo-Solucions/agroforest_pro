#!/bin/bash
# Script: analyze-project.sh
# Uso: ./analyze-project.sh

echo "🔍 Analizando archivos sensibles en $(basename "$PWD")..."
echo "----------------------------------------"

# Busca archivos comunes a excluir
sensitive_files=$(find . -type f \( \
  -name "*.env*" -o \
  -name "*.key" -o \
  -name "*.pem" -o \
  -name "*.sqlite3" -o \
  -name "*.db" -o \
  -name "secrets.py" -o \
  -name "config.py" -o \
  -name "credentials.json" -o \
  -path "*/config/*" -o \
  -path "*/quantum/*" -o \
  -path "*/cerebro/*" -o \
  -path "*/logica/*" \
\))

if [ -z "$sensitive_files" ]; then
  echo "✅ No se encontraron archivos sensibles (o ya están excluidos)."
else
  echo "🚨 Archivos a considerar para exclusión:"
  echo "$sensitive_files"
fi

echo "----------------------------------------"