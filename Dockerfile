# Stage 1: compile the front (Node is only needed here)
FROM node:20-slim AS front
WORKDIR /front
COPY front/package*.json ./
RUN npm ci
COPY front/ .
RUN npm run build

# Stage 2: final image (Python only, no Node)
FROM python:3.13-slim
WORKDIR /app
COPY back/requirements.txt back/requirements.txt
RUN pip install --no-cache-dir -r back/requirements.txt
COPY back/ back/
COPY --from=front /front/dist front/dist

# The app reads/writes config.ini, auth.ini, taximetro.db and the log in its
# working directory, so ONE volume on /data keeps everything.
WORKDIR /data
COPY back/config.ini .
ENV PYTHONPATH=/app/back
EXPOSE 8000
CMD ["uvicorn", "taximetro.api:app", "--host", "0.0.0.0", "--port", "8000"]
