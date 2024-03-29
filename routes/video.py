import base64

import cv2
import numpy as np
from fastapi import APIRouter, WebSocket
from concurrent.futures import ThreadPoolExecutor

from facerec.main import compute_face_descriptors, recognize_face
from services.videostream_service import add_video_data

router = APIRouter(
    prefix="/api/video",
    tags=["video"],
    responses={404: {"description": "The requested uri was not found"}},
)

# Load the face descriptors and labels once when the server starts
face_descriptors, face_labels = compute_face_descriptors("facerec/dataset")

executor = ThreadPoolExecutor(max_workers=1)


@router.websocket("/video")
async def video_endpoint(websocket: WebSocket):
    await websocket.accept()
    while True:
        location = "Colombo"
        misc = "no misc data available"

        data = await websocket.receive_text()
        # print("data incoming...")

        # Remove the header of the base64 string (if any)
        base64_data = data.split(",")[-1]

        # Convert the base64 string to bytes
        img_bytes = base64.b64decode(base64_data)

        # Convert the base64 string to a numpy array
        nparr = np.frombuffer(img_bytes, np.uint8)

        # Decode the numpy array as an image
        img = cv2.imdecode(nparr, cv2.IMREAD_COLOR)

        # Run the face recognition on the image
        label = recognize_face(face_descriptors, face_labels, img)

        # Convert the image to binary format
        is_success, im_buf_arr = cv2.imencode(".jpg", img)
        byte_im = im_buf_arr.tobytes()

        # add to the database
        if label:
            add_video_data(label, location, misc, byte_im)

        # Send the result back to the client
        await websocket.send_text(f"The face is recognized as: {label}")
