FROM python:3.9
WORKDIR /app/backend
RUN pip inatall -r requirements.txt
COPY . /app/backend
EXPOSE 8000

CMD python /app/backend/
