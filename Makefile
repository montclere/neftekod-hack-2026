.DEFAULT_GOAL := help
.PHONY: help setup dev-api dev-web types lint check

help:      ## показать команды
	@grep -hE '^[a-z-]+:.*##' $(MAKEFILE_LIST) | sed -E 's/:.*## / — /' | sort

setup:     ## поставить зависимости и создать .env-файлы  ← один раз после клона
	@test -f .env || (cp .env.example .env && echo "создан .env — впишите ключи")
	@test -f frontend/.env.local || \
		(echo "NEXT_PUBLIC_API_URL=http://localhost:8000" > frontend/.env.local && \
		 echo "создан frontend/.env.local")
	cd backend && uv sync
	cd frontend && pnpm install

dev-api:   ## бэкенд на :8000 (вкладка 1)
	cd backend && uv run uvicorn app.main:app --reload --port 8000

dev-web:   ## фронтенд на :3000 (вкладка 2)
	cd frontend && pnpm dev

types:     ## TS-типы из OpenAPI  ← после любой правки схем Pydantic
	cd frontend && pnpm exec openapi-typescript http://localhost:8000/openapi.json -o src/api/schema.d.ts

lint:      ## ruff + biome
	cd backend && uv run ruff check .
	cd frontend && pnpm exec biome check .

check:     ## бэкенд отвечает?
	@curl -fsS localhost:8000/health && echo "  ← бэкенд жив" || echo "бэкенд не отвечает: make dev-api"

# Целей up/down/seed/eval здесь нет намеренно: docker-compose.yml, app/seed.py
# и app/eval.py ещё не написаны. Появятся файлы — вернутся цели.
