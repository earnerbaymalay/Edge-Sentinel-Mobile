#!/bin/bash
echo "🛡️ Installing Edge-Sentinel Python Environment..."
python -m venv venv; source venv/bin/activate
pip install --upgrade pip; export ANDROID_API_LEVEL=24
pip install fastapi "uvicorn[standard]" pydantic httpx
echo "✅ Python Dependencies Installed."
