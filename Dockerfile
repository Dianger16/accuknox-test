# PLANTED (SBOM / IaC): end-of-life base image, runs as root, no healthcheck.
FROM python:3.6-slim

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt || true
COPY app/ ./app/

# PLANTED: no USER instruction, so the container runs as root.
CMD ["python", "-c", "print('lab image - do not deploy')"]
