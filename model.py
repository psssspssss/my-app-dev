# predict_image.py

import tensorflow as tf
from keras.preprocessing.image import ImageDataGenerator
import numpy as np
from keras.preprocessing import image
from PIL import Image


def setup():

    # Check TensorFlow version
    print(tf.__version__)

    # Create an ImageDataGenerator for training data
    train_datagen = ImageDataGenerator(
        rescale=1./255,
        shear_range=0.2,
        zoom_range=0.2,
        horizontal_flip=True
    )

    # Load training data from directory
    training_set = train_datagen.flow_from_directory(
        "D:/vs folders/e waste/training",
        target_size=(64, 64),
        batch_size=32,
        class_mode='binary'
    )

    # Create an ImageDataGenerator for testing data
    test_datagen = ImageDataGenerator(rescale=1./255)

    # Load testing data from directory
    test_set = test_datagen.flow_from_directory(
        "D:/vs folders/e waste/testing",
        target_size=(64, 64),
        batch_size=32,
        class_mode='binary'
    )

    # Build the CNN model
    cnn = tf.keras.models.Sequential()
    cnn.add(tf.keras.layers.Conv2D(filters=32, kernel_size=3,
            activation='relu', input_shape=[64, 64, 3]))
    cnn.add(tf.keras.layers.MaxPool2D(pool_size=2, strides=2))
    cnn.add(tf.keras.layers.Conv2D(
        filters=32, kernel_size=3, activation='relu'))
    cnn.add(tf.keras.layers.MaxPool2D(pool_size=2, strides=2))
    cnn.add(tf.keras.layers.Flatten())
    cnn.add(tf.keras.layers.Dense(units=128, activation='relu'))
    cnn.add(tf.keras.layers.Dense(units=1, activation='sigmoid'))

    # Compile the model
    cnn.compile(optimizer='adam', loss='binary_crossentropy',
                metrics=['accuracy'])

    # Train the model
    cnn.fit(x=training_set, validation_data=test_set, epochs=10)
    return cnn


def predict_image(file, cnn):
    # Load and preprocess the image

    img = Image.open(file)

    img = Image.open(file)

    img = img.resize((64, 64))

    test_image = np.array(img)
    result = cnn.predict(test_image)

    def predict_device(input_data):
        try:
            result = your_model.predict(input_data)

            if result is not None and result.shape == (1, 1):
                if result[0][0] == 1:
                    prediction = 'phone'
                else:
                    prediction = 'laptop'
            else:
                prediction = 'error'

        except Exception as e:
            print(f"Error predicting device: {e}")
            prediction = 'error'

    return prediction


def predict_image_path(file, cnn):
    # Load and preprocess the image
    test_image = image.load_img(file, target_size=(64, 64))
    test_image = image.img_to_array(test_image)
    test_image = np.expand_dims(test_image, axis=0)

    # Make a prediction
    result = cnn.predict(test_image)

    # Interpret the prediction
    if result[0][0] == 1:
        prediction = 'phone'
    else:
        prediction = 'laptop'

    return prediction
