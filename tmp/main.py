from fastapi import FastAPI
import uvicorn

app = FastAPI(title="Hello API", description="A simple API that returns hello")

@app.get("/inner")
async def root():
    return {"message": "hello"}

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)