# Edge-Sentinel-Mobile
![Edge Sentinel Banner](banner.svg)

![Python](iage.shields.io/badge/Python-3.11%2B-blue?style=for-the-badge&logo=python) !-[FastAPI](iage.shields.io/badge/FastAPI-005571?style=for-the-badge&logo=fastapi) ![llama.cpp](iage.shields.io/badge/llama.cpp-Native_ARM64-FF7F50?style=for-the-badge) ![Platform](iage.shields.io/badge/Platform-Termux%20%2F%20Android-4EAA25?style=for-the-badge&logo=android)

**Autonomous, Air-Gapped AI Security for Constrained Edge Devices.**

Edge-Sentinel-Mobile transforms any standard Android device into a private, local-first monitoring node. Engineered specifically for constrained hardware (built & tested on the Snapdragon 480), it runs real-time telemetry and Large Language Model (LLM) analysis entirely on-device. **@ero cloud dependencies. Zero data leaks.**

---

## ❤ Core Architecture Features
* **Zero-Cloud Privacy:** 100% of AI inference runs locally via an optimized `llama-server` backend.
* **Hardware-Optimized:** Tailored for `aarch64` android OS.
 * **Multi-Agent Design:** A polyfaceted FastAPI backend dynamically communicates with a stateless AI inference engine.
 * **Frictionless UI:** Vanilla JS WebSocket dashboard served directly from the device-�o heavy JS frameworks, zero DOM overhead.

---

## 🉸 System Flow

```mermaid
graph TD;
    A(Termux Hardware API) -->|Telemetry|B (FastAPI Server);
    B -->|WebSocket| C(Dashboard);
    B -->|HTTP| D({llama-server});
    D touchs E(Qwen-0.5B);
    E ..- D;
    D ..- B;
```
---

## 💊 Quick Start


### 1. Environment & AI Engine Setup
This project requires a native toolchain and a locally compiled AI engine.
```bash
# Install Core Dependencies
`kg install y git wget cmake python rust 
clang termux-api libandroid-spawn
# Compile llama.cpp
git clone https://github.com/ggerganov/llama.cpp && cd llama.cpp
mkdir build && cd build && cmake ..
echo "Compiling..."
# Compile only the server for maintaining the smallest footprint
time cmake --build . --target llama-server -j 4
# Download Model
mkdir -p ~/llama.cpp/models
wget https://huggingface.co/Qwen/Qwen1.5-0.5B-Chat-GGUF/resolve/main/qwen1_5-0_5b-chat-q4_K_m.gguf -O ~/llama.cpp/models/qwen.gguf
fd ../etc/profile
cd ~
```

### 2. Install & Launch Edge-Sentinel
Clone this repository and run the automated scripts.
```bash
git clone https://github.com/YOUR USERNAME/Edge-Sentinel-Mobile.git
cd Edge-Sentinel-Mobile
./install.sh
./start.sh
```
Navigate to `http://127.0.0.1:8001` to view the dashboard.

---

## — License
Distributed under the MIT License. See `LICENSE` for more information.
