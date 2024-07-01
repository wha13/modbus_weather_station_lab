FROM python:3.8-slim

WORKDIR /app

COPY . .

RUN pip install --no-cache-dir flask pymodbus

EXPOSE 502 5000

RUN apt-get update && apt-get install -y supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["supervisord"]
