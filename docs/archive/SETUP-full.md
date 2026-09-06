> ⚠️ **АРХИВ. Не выполняйте этот файл.**
>
> Это инструкция «как собрать репозиторий с нуля» — она уже выполнена.
> Повторный `uv init`, `create-next-app` или `shadcn init` сломают то, что собрано.
>
> Если вы только что склонировали репозиторий, вам нужен **корневой `README.md`**:
> `make setup` и две команды запуска.
>
> Часть путей и команд здесь устарела (`START.md`, `docs/PITCH.md`, `docs/header.svg`
> переехали). Файл сохранён как справка для следующего хакатона, если начинать заново.

---

# Инициализация репозитория

Делается один раз. После каждого шага написано, **что должно появиться** —
сверяйтесь и не идите дальше с непроверенным шагом.

---

## Шаг 0. Что нужно на машине

```bash
node --version       # 22+
pnpm --version       # 9+    нет: npm i -g pnpm
uv --version         #       нет: curl -LsSf https://astral.sh/uv/install.sh | sh
gh --version         #       GitHub CLI, для доски задач
docker --version     # 24+   можно позже, для разработки не нужен
```

Версии сверьте с напарником — расхождение вылезет на хакатоне в самый неудобный момент.

---

## Шаг 1. Документы

Распаковать `hackathon-template.zip` в корень репозитория.

**Появится:**

```
START.md  SETUP.md  AGENTS.md  README.md  Makefile  .env.example
docs/     STACK.md  WORKFLOW.md  PITCH.md  PROMPTS-3D.md
          CONTEXT.md  DEMO.md  adr/  design/  header.svg  footer.svg
scripts/  seed_issues.sh
```

---

## Шаг 2. Бэкенд

```bash
mkdir -p backend/app/{api,core,ml,repo}
cd backend
uv init --no-workspace --name backend
uv add fastapi "uvicorn[standard]" pydantic pydantic-settings httpx structlog
uv add --dev ruff
```

`uv init` кладёт заготовку `backend/main.py` в корень. Она не нужна, uvicorn читает
`app/main.py`:

```bash
rm -f main.py
```

Создать пустые файлы-маркеры пакетов:

```bash
touch app/__init__.py app/api/__init__.py app/core/__init__.py app/ml/__init__.py app/repo/__init__.py
```

Создать `backend/app/main.py`:

```python
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI(title="API")
app.add_middleware(
    CORSMiddleware, allow_origins=["*"],
    allow_methods=["*"], allow_headers=["*"],
)


@app.get("/health")
def health() -> dict[str, str]:
    return {"status": "ok"}
```

**Проверка:**

```bash
uv run python -c "import app.main"
find . -name "main.py" -not -path "*/.venv/*"
```

Первая команда молчит — синтаксис в порядке. Вторая возвращает ровно `./app/main.py`.

---

## Шаг 3. Фронтенд

```bash
cd ..
pnpm create next-app@latest frontend --ts --tailwind --eslint --app \
  --src-dir --import-alias "@/*" --no-turbopack
cd frontend
pnpm dlx shadcn@latest init
```

В `init`: библиотека компонентов **Base UI**, пресет — любой с иконками **Lucide**
и без декоративного серифа в шрифтах. CSS-переменные — обязательно **да**.
Пресет `Custom` не берите, он уводит в браузерный конструктор.

```bash
pnpm dlx shadcn@latest add button input card dialog table tabs sonner skeleton
pnpm add @tanstack/react-query react-hook-form zod @hookform/resolvers recharts motion
pnpm add -D openapi-typescript @biomejs/biome
pnpm dlx @biomejs/biome init
cd ..
```

**Проверка:**

```bash
ls frontend/components.json
ls frontend/src/components/ui
```

В `ui` должно быть восемь `.tsx`. Если меньше — `add` прервался, прогоните его заново
для недостающих. Если папки нет вовсе — посмотрите путь в `aliases` внутри
`components.json`, компоненты могли уехать в `frontend/components/ui`.

**Дизайн-токены.** Открыть `frontend/src/app/globals.css`, заменить значения
в блоках `:root` и `.dark` на свою палитру. Без этого шага интерфейс будет
выглядеть дефолтным shadcn.

---

## Шаг 4. Запуск

Два процесса в двух вкладках терминала. Обе остаются открытыми, пока вы работаете.

**Вкладка 1:**

```bash
cd backend
uv run uvicorn app.main:app --reload --port 8000
```

**Вкладка 2:**

```bash
cd frontend
pnpm dev
```

Создать `frontend/.env.local`:

```
NEXT_PUBLIC_API_URL=http://localhost:8000
```

**Проверка** в третьей вкладке:

```bash
curl -s localhost:8000/health
```

Ответ `{"status":"ok"}`. Плюс открываются http://localhost:3000
и http://localhost:8000/docs — Swagger со схемами.

---

## Шаг 5. Мост между фронтом и бэком

Самая важная связка в проекте: типы фронта генерируются из схем бэка,
а не пишутся руками.

При поднятом бэкенде:

```bash
cd frontend
pnpm dlx openapi-typescript http://localhost:8000/openapi.json -o src/api/schema.d.ts
```

**Проверка руками.** Добавьте в `backend/app/main.py`:

```python
from pydantic import BaseModel


class Ticket(BaseModel):
    id: int
    title: str
    is_duplicate: bool


@app.get("/tickets")
def list_tickets() -> list[Ticket]:
    return []
```

Импорт `BaseModel` поднимите к остальным импортам вверху файла.
Сохраните — uvicorn перезапустится сам.

```bash
curl -s localhost:8000/openapi.json | grep -c Ticket
```

Больше нуля — бэкенд отдаёт новую схему. Тогда:

```bash
pnpm dlx openapi-typescript http://localhost:8000/openapi.json -o src/api/schema.d.ts
grep -A6 "Ticket" src/api/schema.d.ts
```

Видите поля `id`, `title`, `is_duplicate` — мост работает. Тестовый эндпоинт
можно удалить.

Если `grep` по openapi вернул ноль: файл не сохранён, либо правится не тот `main.py`,
либо uvicorn не запущен. Проверяется через `grep -n "Ticket" app/main.py`.

Команды удобно положить в `Makefile`, отступы только табами:

```makefile
dev-api:
	cd backend && uv run uvicorn app.main:app --reload --port 8000
dev-web:
	cd frontend && pnpm dev
types:
	cd frontend && pnpm dlx openapi-typescript http://localhost:8000/openapi.json -o src/api/schema.d.ts
lint:
	cd backend && uv run ruff check . && cd ../frontend && pnpm biome check .
```

---

## Шаг 6. Первый коммит

Создать `.gitignore` в корне:

```
.env
.env.local
.venv/
__pycache__/
node_modules/
.next/
frontend/src/api/schema.d.ts
```

Схема не коммитится намеренно: она генерируется, и в git даст конфликты
при каждом слиянии веток.

```bash
git status --short
```

Просмотрите список глазами. В нём **не должно быть** `node_modules`, `.venv`,
`.next`, `__pycache__`, `.env`. Если что-то есть — правьте `.gitignore` сейчас,
вычищать из истории потом неприятно.

```bash
git add -A
git commit -m "каркас: бэкенд, фронтенд, документы"
git push
```

---

## Шаг 7. Скилы агента

Набор ставится как плагин Claude Code, маркетплейс добавлять не нужно:

```bash
claude plugins install mattpocock-skills
```

Или прямо в сессии: `/plugin install mattpocock-skills`.

Знание о библиотеках — в репозиторий:

```bash
cd frontend && npx skills-npm setup && cd ..
```

Прописать в `frontend/package.json`, чтобы работало само после каждой установки:

```json
"scripts": { "prepare": "skills-npm sync" }
```

**Проверка:** в сессии агента наберите `/grill-me` — скил подхватывается.

---

## Шаг 8. Docker Compose

Можно отложить: для разработки хватает шага 4. Но до хакатона довести обязательно,
иначе разворачивание на чужой машине превращается в квест.

`docker-compose.yml` без базы:

```yaml
services:
  api:
    build: ./backend
    command: uvicorn app.main:app --host 0.0.0.0 --port 8000 --reload
    environment:
      LLM_API_KEY: ${LLM_API_KEY}
    volumes: ["./backend:/app"]
    ports: ["8000:8000"]

  web:
    build: ./frontend
    command: pnpm dev
    environment:
      NEXT_PUBLIC_API_URL: ${NEXT_PUBLIC_API_URL}
    volumes: ["./frontend:/app", "/app/node_modules"]
    ports: ["3000:3000"]
    depends_on: [api]
```

Плюс `backend/Dockerfile` и `frontend/Dockerfile` — минимальные, на официальных образах.

Если по кейсу понадобится Postgres, добавляется сервис `db` на образе
`pgvector/pgvector:pg16`, том `pgdata` и зависимость у `api`. Плюс возвращаются
пакеты `sqlalchemy`, `psycopg[binary]`, `pgvector`.

**Проверка:** `make up`, затем `docker compose ps` — оба сервиса в статусе running.

---

## Шаг 9. Сделать репозиторий шаблоном

GitHub → Settings → General → галочка **Template repository**.

**Появится:** кнопка «Use this template» на странице репозитория.
Следующий хакатон начинается с неё.

---

# Для второго участника

Что делать после того, как склонировал репозиторий. Всё уже собрано,
инициализировать заново ничего не нужно.

## 1. Поставить инструменты

```bash
node --version    # 22+
pnpm --version    # 9+    нет: npm i -g pnpm
uv --version      #       нет: curl -LsSf https://astral.sh/uv/install.sh | sh
```

## 2. Склонировать и поставить зависимости

```bash
git clone <url>
cd <repo>
cp .env.example .env

cd backend && uv sync && cd ..
cd frontend && pnpm i && cd ..
```

`uv sync` и `pnpm i` читают файлы блокировок из репозитория и ставят те же версии,
что у первого участника. Никаких `uv init`, `create-next-app` и `shadcn init`.

## 3. Заполнить ключи

Открыть `.env` и вписать значения. Пустые ключи — самая частая причина
«у меня не работает».

Создать `frontend/.env.local`:

```
NEXT_PUBLIC_API_URL=http://localhost:8000
```

## 4. Запустить

Две вкладки терминала:

```bash
cd backend && uv run uvicorn app.main:app --reload --port 8000
```

```bash
cd frontend && pnpm dev
```

## 5. Сгенерировать типы

Файл `schema.d.ts` не лежит в репозитории, его нужно создать у себя.
При поднятом бэкенде:

```bash
cd frontend
pnpm dlx openapi-typescript http://localhost:8000/openapi.json -o src/api/schema.d.ts
```

**Повторять после каждого `git pull`,** если напарник менял схемы Pydantic.
Иначе редактор будет показывать типы, которых на бэкенде уже нет.

## 6. Проверить

```bash
curl -s localhost:8000/health
```

Ответ `{"status":"ok"}`, открываются http://localhost:3000 и
http://localhost:8000/docs.

## 7. Прочитать два файла

- `AGENTS.md` — правила проекта, по ним работает агент
- `docs/WORKFLOW.md` — как устроена работа: фазы, нарезка задач, ритм синхронизаций

## Если что-то не поднялось

| Симптом | Причина |
|---|---|
| `No pyproject.toml found` | вы не в папке `backend` |
| порт 8000 занят | висит старый процесс, `pkill -f uvicorn` |
| curl возвращает пустоту | uvicorn не запущен |
| типы не обновились | не перезапущена генерация после правки схем |
| `Module not found` во фронте | не выполнен `pnpm i` |

Всё, что чинилось руками, — записывайте. Это правки в `SETUP.md`, а не личный опыт:
на хакатоне те же грабли встретит кто-то третий.

---

# Как это работает на хакатоне

## Первые минуты

```bash
gh repo create hack-<название> --template <owner>/hackathon-template --private --clone
cd hack-<название>
cp .env.example .env
cd backend && uv sync && cd ../frontend && pnpm i && cd ..
```

**Появится:** работающий проект, пока остальные команды ещё ставят зависимости.

## Первые часы

1. Положить файл с идеей в `docs/IDEA.md`
2. Прогнать `/grill-me` по нему — до кода
3. Заполнить `docs/DEMO.md` — что видит жюри за 90 секунд
4. Заполнить `docs/CONTEXT.md` — термины кейса и их имена в коде
5. Заполнить шапку `AGENTS.md` — кейс, дедлайн, демо-сценарий
6. **Написать контракт API вдвоём** — `backend/app/schemas.py` и список эндпоинтов.
   Единственная по-настоящему блокирующая задача
7. Нарезать задачи и залить на доску

```bash
gh project create --owner <owner> --title "Хакатон"
./scripts/seed_issues.sh <owner> <repo> <номер-проекта>
```

Задачи под конкретный кейс генерирует агент: читает `IDEA.md`, `DEMO.md`
и `CONTEXT.md`, переписывает массив `TASKS` в скрипте по правилам из `WORKFLOW.md`.

## Дальше

Работа расходится на две дорожки — бэк с ML и фронт с упаковкой.
Стыковка одна: моки меняются на реальные вызовы. Генерация типов держит их в согласии.

Синхронизация каждые 3–4 часа. После интеграции на каждом синке — прогон
демо-сценария целиком.

## Упаковка

- гифка демо в `docs/`, ссылка в README
- текст в `docs/design/header.svg` и `footer.svg` правится обычными буквами
- слайды по `docs/PITCH.md`, фоны из `docs/design/`, объекты по `docs/PROMPTS-3D.md`
- палитра одна: интерфейс, README, слайды

## Финал

Команда «стабилизация» — правила в конце `AGENTS.md`. Новых возможностей нет,
правится только видимое в демо, README и ADR приводятся в соответствие с кодом.

---

# Итоговое дерево

```
.
├── START.md                 с чего начать
├── SETUP.md                 этот файл
├── AGENTS.md                конвенции для агента
├── README.md                лицевая страница
├── Makefile
├── docker-compose.yml
├── .env.example
├── .gitignore
├── backend/
│   ├── pyproject.toml
│   ├── uv.lock
│   └── app/
│       ├── main.py          FastAPI, health, CORS
│       ├── api/             роуты
│       ├── core/            предметная логика
│       ├── ml/              инференс, промпты
│       ├── repo/            доступ к данным
│       ├── schemas.py       контракт API
│       └── seed.py          демо-данные
├── frontend/
│   ├── package.json
│   ├── pnpm-lock.yaml
│   ├── components.json
│   ├── biome.json
│   └── src/
│       ├── app/globals.css  дизайн-токены
│       ├── components/ui/   shadcn — не редактировать
│       └── api/schema.d.ts  генерируется, не коммитится
├── docs/
│   ├── STACK.md  WORKFLOW.md  PITCH.md  PROMPTS-3D.md
│   ├── CONTEXT.md  DEMO.md   заполняются на месте
│   ├── IDEA.md               кладётся на хакатоне
│   ├── adr/
│   └── design/               фоны, header.svg, footer.svg
└── scripts/seed_issues.sh
```

---

# Что осталось за пределами репозитория

- **Дизайн-пак:** 15–20 скриншотов с refero по типам экранов — дашборд, таблица,
  чат, онбординг, пустое состояние. Держать в облаке
- **Мастер-слайды** в Figma: титул, крупная цифра, скриншот во весь экран,
  три колонки, схема, диаграмма
- **OBS** с готовой сценой и команда ffmpeg для гифки
- **Ключи API.** Получить заранее: регистрация и пополнение баланса
  в разгар работы стоят часа