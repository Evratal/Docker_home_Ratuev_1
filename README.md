# Развёртывание Django с Docker и Nginx

Проект представляет собой Django-приложение с автоматизированным CI/CD пайплайном через GitHub Actions.

## Требования

- Сервер Ubuntu 22.04
- Python 3.10+
- Docker и Docker Compose
- Nginx
- Аккаунт GitHub

## Настройка сервера

1. Установите зависимости:
```bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y docker.io docker-compose nginx python3-pip
```

2. Настройте фаервол:

```bash
sudo ufw allow 22
sudo ufw allow 80
sudo ufw allow 443
sudo ufw enable
```

3. Добавьте пользователя в группу docker:

```bash
sudo usermod -aG docker $USER
newgrp docker  # или переподключитесь к серверу
```


## Структура проекта

Docker_home_Ratuev_1/
├── core/              # Основной проект Django
├── app/               # Приложения Django
├── staticfiles/       # Собранные статические файлы
├── .github/
│   └── workflows/
│       └── deploy.yml # CI/CD пайплайн
├── docker-compose.yml # Продакшен-конфигурация
├── Dockerfile
├── nginx.conf
└── manage.py