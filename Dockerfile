FROM python:3.9

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Открываем порт 8000 для взаимодействия с приложением
EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]