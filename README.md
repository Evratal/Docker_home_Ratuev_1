# Запуск проекта
## 1.Скопируйте .env.template в .env и заполните значения:

``` bash
cp .env.template .env
```

## 2. Запустите сервисы:

```bash
docker-compose up -d --build
```

## 3. Проверьте работу:

- Django: http://localhost:8000
- Celery Worker: Логи через docker-compose logs celery
- Celery Beat: Логи через docker-compose logs celery_beat