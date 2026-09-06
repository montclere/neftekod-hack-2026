# neftekod-hack-2026

Заготовка хакатонной команды: FastAPI + Next.js, зависимости зафиксированы,
типы фронта генерируются из схем бэкенда. Собрана заранее, чтобы на хакатоне
не тратить время на настройку.

> **Этот README — рабочий, для своих.** На фазе упаковки он заменяется витриной
> для жюри — два равноправных варианта лежат в [docs/pitch/](docs/pitch/):
> `README-svg.md` (шапка из локальных SVG) и `README-external.md` (с внешних
> генераторов). Отличаются только шапкой и футером.

---

## Быстрый старт

Нужно на машине: **Node 22+**, **pnpm**, **uv**.

```bash
node --version   # 22+
pnpm --version   # нет: npm i -g pnpm
uv --version     # нет: curl -LsSf https://astral.sh/uv/install.sh | sh
```

Точную версию pnpm подтягивать не нужно: она закреплена полем `packageManager`
в `frontend/package.json`, pnpm сам переключится на неё при первом запуске.

Дальше:

```bash
git clone git@github.com:montclere/neftekod-hack-2026.git
cd neftekod-hack-2026
make setup
```

`make setup` ставит зависимости из локов (те же версии, что у напарника)
и создаёт `.env` и `frontend/.env.local`. **Откройте `.env` и впишите ключи** —
пустые ключи это самая частая причина «у меня не работает».

Запуск — два процесса в двух вкладках терминала:

```bash
make dev-api     # вкладка 1 → http://localhost:8000
make dev-web     # вкладка 2 → http://localhost:3000
```

Проверка:

```bash
make check       # ждём {"status":"ok"}
```

Плюс открываются http://localhost:3000 и http://localhost:8000/docs — Swagger
со всеми схемами.

---

## Команды

```
make setup     поставить зависимости и создать .env-файлы  ← один раз после клона
make dev-api   бэкенд на :8000
make dev-web   фронтенд на :3000
make types     TS-типы из OpenAPI  ← после любой правки схем Pydantic
make lint      ruff + biome
make check     бэкенд отвечает?
make help      этот список
```

---

## Главное правило: типы не пишутся руками

FastAPI отдаёт OpenAPI-схему, из неё генерируются типы TypeScript.

```
backend/app/schemas.py  ──(make types)──▶  frontend/src/api/schema.d.ts
```

Поменяли модель Pydantic — прогоните `make types` и скажите об этом напарнику.
Фронту не хватает поля — добавьте его в схему бэкенда, а не в тип фронта:
`schema.d.ts` сгенерирован, ручные правки затрутся.

Файл лежит в репозитории, поэтому после `git pull` он у вас уже актуальный.
Если бэкенд поменялся, а типы нет — `make types`.

---

## Где что лежит

```
backend/app/
  main.py          FastAPI: health, CORS
  api/             HTTP-слой: валидация, вызов сервиса, ответ
  core/            предметная логика — суть системы
  ml/              инференс, эмбеддинги, промпты
  repo/            доступ к данным
frontend/src/
  app/             маршруты App Router
  app/globals.css  дизайн-токены — цвета берутся только отсюда
  components/ui/   shadcn — не редактировать, оборачивать
  api/schema.d.ts  сгенерировано из OpenAPI, не править
docs/
  WORKFLOW.md      как работаем: фазы, нарезка задач, ритм
  CONTEXT.md       словарь предметной области — заполняем вдвоём
  DEMO.md          демо-сценарий — заполняем вдвоём
  adr/             почему приняли то или иное решение
  pitch/           презентация, промпты для слайдов, два витринных README
  design/          графика: header/footer для README, фоны слайдов
  archive/         справочники, в работе не нужны
scripts/
  seed_issues.sh   наполнение доски GitHub Projects
AGENTS.md          конвенции проекта — по ним работает ИИ-агент
```

---

## Что читать дальше

1. **[AGENTS.md](AGENTS.md)** — правила проекта. Обязательно до первой строки кода:
   по ним работает агент, и по ним же ревьюится код.
2. **[docs/WORKFLOW.md](docs/WORKFLOW.md)** — фазы хакатона, как режем задачи, ритм синхронизаций.

---

## Чего в заготовке ещё нет

Осознанные дыры, а не забытое:

- [ ] `docker-compose.yml` + Dockerfile'ы — пока запуск локальный, через `make dev-*`
- [ ] база данных: моделей, миграций и ORM нет. Понадобится — это Postgres + pgvector,
      но добавляется через разговор и ADR, а не молча
- [ ] `app/seed.py` — генерация демо-данных
- [ ] `app/eval.py` и `make eval` — воспроизводимый замер метрик для README
- [ ] дизайн-токены в `globals.css` под свою палитру (сейчас дефолт shadcn)
- [ ] `docs/demo.gif` и `docs/architecture-dark.png` для витринного README

Последняя проверка перед хакатоном: `git clone` + `make setup` на **чужом** ноутбуке.
Инструкция, которая не работает, хуже отсутствующей.

---

## Если не поднялось

| Симптом | Причина |
|---|---|
| `No pyproject.toml found` | вы не в папке `backend` — запускайте `make` из корня |
| порт 8000 занят | висит старый процесс: `pkill -f uvicorn` |
| `make check` молчит | uvicorn не запущен |
| `Module not found` во фронте | не выполнен `make setup` |
| типы не совпадают с бэком | не прогнан `make types` после правки схем |
| Next не видит `NEXT_PUBLIC_API_URL` | нет `frontend/.env.local` — прогоните `make setup` |

Всё, что чинили руками, дописывайте в эту таблицу. Те же грабли встретит напарник.
