# Базовый образ Python
FROM python:3.10

# Установка зависимостей системы
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        gcc \
        libpq-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Рабочая директория
WORKDIR /app

# Копирование и установка Python-зависимостей
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Копирование всего проекта
COPY . .

# Создание директории для статики
RUN mkdir -p /app/staticfiles \
    && chown -R 1000:1000 /app/staticfiles \
    && chmod -R 755 /app/staticfiles

# Пользователь для безопасности (не root)
USER 1000

# Порт и команда запуска
EXPOSE 8000
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "core.wsgi:application"]0"]