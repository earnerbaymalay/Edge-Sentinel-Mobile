#!/bin/bash
echo "🚀 Booting Edge-Sentinel System..."
pkill -f llama-server; pkill -f uvicorn
cd ~/llama.cpp; ./build/bin/llama-server -m models/qwen.gguf -c 512 -t 4 --port 8080 --host 0.0.0.0 > /dev/null 2>&1 &
echo "🧠 AI Engine Online"
cd ~/edge-sentinel; source ~/venv/bin/activate
python -m uvicorn app.main:app --port 8001 &
echo "🛡️ Dashboard Online: http://127.0.0.1:8001"
