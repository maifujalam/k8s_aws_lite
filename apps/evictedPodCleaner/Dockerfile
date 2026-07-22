FROM python:3.13-slim-bookworm as BUILDER
WORKDIR /app
COPY requirements.txt .
RUN pip3 install --no-cache-dir --prefix=/install -r requirements.txt

FROM python:3.13-alpine AS runner
WORKDIR /app
COPY --from=builder /install /usr/local
COPY . .
CMD ["python3", "app.py"]

