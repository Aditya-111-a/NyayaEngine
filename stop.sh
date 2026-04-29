#!/usr/bin/env bash
set -e

echo "Stopping backend/frontend (uvicorn/vite)..."
pkill -f "uvicorn app.main:app" || true
pkill -f "npm run dev" || true
pkill -f "vite" || true

echo "Stopping Neo4j Docker container..."
docker compose down

echo "Stopping Ollama (local)..."
pkill -f "ollama serve" || true

echo "Stopped."
