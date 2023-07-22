FROM python:3.9


LABEL author="Alireza"

RUN apt-get update && apt-get install -y supervisor nginx

COPY app.py /app/



WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt


EXPOSE 443
EXPOSE 80


CMD service nginx start && gunicorn --bind 0.0.0.0:5000 app:app
