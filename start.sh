#!/usr/bin/env bash
set -e

echo "Starting Neo4j (Docker)..."
docker compose up -d neo4j

echo "Checking Ollama (local)..."
if command -v ollama >/dev/null 2>&1; then
  if ! curl -s http://localhost:11434/api/tags >/dev/null 2>&1; then
    echo "Starting local ollama serve..."
    nohup ollama serve >/dev/null 2>&1 &
    sleep 1
  else
    echo "Ollama already running locally"
  fi
else
  echo "Ollama not installed. Auto-LLM extraction won't work."
fi

echo "Starting backend (FastAPI)..."
cd backend
source .venv/bin/activate
nohup python -m uvicorn app.main:app --reload --host 0.0.0.0 --port 8000 >/dev/null 2>&1 &
cd ..

echo "Starting frontend (Vite)..."
cd frontend
nohup npm run dev -- --host >/dev/null 2>&1 &
cd ..

echo ""
echo "Project running:"
echo "Frontend: http://localhost:5173"
echo "Backend : http://localhost:8000/docs"
echo "Neo4j   : http://localhost:7474"
echo "Ollama  : http://localhost:11434"
