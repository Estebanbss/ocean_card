#!/bin/bash

# Script para hacer build y deploy manual a GitHub Pages
# Ejecuta: chmod +x deploy.sh && ./deploy.sh

echo "🚀 Iniciando build para GitHub Pages..."

# Verificar que estemos en la rama principal
BRANCH=$(git branch --show-current)
if [ "$BRANCH" != "main" ]; then
    echo "⚠️  Advertencia: No estás en la rama 'main'. Rama actual: $BRANCH"
    read -p "¿Continuar de todos modos? (y/n): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "❌ Deploy cancelado"
        exit 1
    fi
fi

# Limpiar build anterior
echo "🧹 Limpiando builds anteriores..."
flutter clean

# Obtener dependencias
echo "📦 Obteniendo dependencias..."
flutter pub get

# Habilitar web si no está habilitado
echo "🌐 Habilitando plataforma web..."
flutter config --enable-web

# Hacer build para web
echo "🔨 Construyendo aplicación web..."
flutter build web --release --web-renderer html --base-href "/ocean_card/"

# Verificar que el build fue exitoso
if [ $? -eq 0 ]; then
    echo "✅ Build completado exitosamente"
    echo "📁 Los archivos están en: ./build/web"
    echo ""
    echo "Para hacer deploy automático, haz:"
    echo "  git add ."
    echo "  git commit -m 'Update app'"
    echo "  git push origin main"
    echo ""
    echo "O sube los archivos manualmente desde ./build/web a GitHub Pages"
else
    echo "❌ Error en el build"
    exit 1
fi
