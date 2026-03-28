#!/bin/bash
python -m venv venv
source venv/bin/activate
pip install fastapi uvicorn httpx pydantic
echo "Setup Complete."