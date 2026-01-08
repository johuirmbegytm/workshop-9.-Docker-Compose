# базовий образ з Python
FROM python:3.11-slim

# робоча директорія
WORKDIR /app

# копіюємо залежності
COPY requirements.txt .
RUN pip install -r requirements.txt

# копіюємо код
COPY app.py .

# запускаємо Flask
CMD ["python", "app.py"]