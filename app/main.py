import asyncio,json,httpx;from fastapi import FastAPI,WebSocket;from fastapi.staticfiles import StaticFiles;from fastapi.responses import FileResponse;from fastapi.middleware.cors import CORSMiddleware
app=FastAPI();app.add_middleware(CORSMiddleware,allow_origins=["*"],allow_methods=["*"],allow_headers=["*"]);app.mount("/static",StaticFiles(directory="app/static"),name="static")
@app.get("/")
async def get():return FileResponse('app/static/index.html')
async def analyze_telemetry(data):
    try:
        async with httpx.AsyncClient(base_url="http://localhost:8080",timeout=15.0) as c:
            p={"prompt":"Is battery "+str(data.get('percentage'))+"% good? Yes or no.","n_predict":10};r=await c.post("/completion",json=p);j=r.json();return j.get("content")or j.get("text")or"Model is quiet."
    except Exception as e:return f"AI Error: {str(e)}"
@app.websocket("/ws")
async def websocket_endpoint(websocket:WebSocket):
    await websocket.accept()
    while True:
        try:
            p=await asyncio.create_subprocess_shell("termux-battery-status",stdout=asyncio.subprocess.PIPE);o,_=await p.communicate();d=json.loads(o.decode());d["analysis"]=await analyze_telemetry(d);await websocket.send_json(d);await asyncio.sleep(5)
        except:break
