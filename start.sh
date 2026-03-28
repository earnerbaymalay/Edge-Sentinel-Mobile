#!/bin/bash
pkill -f llama-server; pkill -f uvicorn
cd ~/llama.cpp && ./build/bin/llama-server -m models/qwen.gguf -c 512 -t 4 --port 8080 --host 0.0.0.0 > /dev/null 2>&1 &
cd ~/edge-sentinel && source venv/bin/activate && python -m uvicorn app.main:app --port 8001