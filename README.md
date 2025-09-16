# GitHub Actions CI/CD Pipeline

Простой workflow для автоматического тестирования и публикации приложения в DockerHub.

## Что делает pipeline

### 1. Job "Test"

Запускается при каждом push и PR:

- Устанавливает Go 1.22
- Проверяет форматирование кода (`gofmt`)
- Проверяет код на ошибки (`go vet`)
- Создает тестовую базу данных
- Запускает тесты

### 2. Job "Docker Build & Push"

Запускается только при создании тегов (v1.0.0, v2.1.0 и т.д.):

- Собирает Docker образ
- Публикует в Docker Hub с тегом версии и `latest`

## Настройка

### Секреты GitHub

Добавьте в Settings → Secrets and variables → Actions:

1. **DOCKERHUB_USERNAME** - ваш логин в Docker Hub
2. **DOCKERHUB_TOKEN** - Access Token из Docker Hub (Account Settings → Security → New Access Token)

### Использование

1. **Тестирование** - автоматически при push/PR
2. **Публикация образа**:

   ```bash
   git tag v1.0.0
   git push origin v1.0.0
   ```

## Docker образ

После публикации:

```bash
docker run -p 8080:8080 [ваш-username]/42-docker-tracker:latest
```