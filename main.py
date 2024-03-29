from fastapi import FastAPI
from starlette.middleware.cors import CORSMiddleware

from routes import auth, video, civilian, officer

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(auth.router)
app.include_router(video.router)
app.include_router(civilian.router)
app.include_router(officer.router)
