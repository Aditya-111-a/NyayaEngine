#!/usr/bin/env bash
set -e

echo "Stopping backend/frontend (uvicorn/vite)..."
pkill -f "uvicorn app.main:app" || true
pkill -f "npm run dev" || true
pkill -f "vite" || true

echo "Stopping Neo4j Docker containers..."
docker compose down

echo "Stopped."
