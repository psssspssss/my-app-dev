FROM python:3.9
WORKDIR /app/backend
COPY requirements.txt /app/backend
RUN pip install -r requirements.txt \
    && rm -rf /var/lib/apt/lists/*
