from io import BytesIO
import base64
from model import predict_image, predict_image_path, setup
from flask import Flask, request
app = Flask(__name__)
cnn = setup()


@app.route('/predict', methods=['POST'])
def upload_file():
    if 'file' not in request.files:
        return 'No file part'

    file = request.files['file']

    if file.filename == '':
        return 'No selected file'
    file.save("./.temp")
    return predict_image_path("./.temp", cnn), 200


if __name__ == '__main__':
    app.run()
