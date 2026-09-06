# backend

FastAPI. Запуск из корня репозитория: `make dev-api` → http://localhost:8000
(Swagger: http://localhost:8000/docs).

```
app/
  main.py   FastAPI: health, CORS
  api/      HTTP-слой: валидация входа, вызов сервиса, формирование ответа
  core/     предметная логика — суть системы
  ml/       инференс, эмбеддинги, промпты
  repo/     доступ к данным
```

Зависимости — только через `uv` (`uv add <пакет>`), `pip install` не использовать.
Правила слоёв и что можно/нельзя — в [AGENTS.md](../AGENTS.md).
