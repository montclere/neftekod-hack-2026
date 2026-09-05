<!-- ═════════════════════ ШАПКА ═════════════════════
     Шапка и футер — локальные файлы docs/header.svg и docs/footer.svg.
     Внутри: переливающийся градиент + бегущий питч (боль → решение → эффект).
     Текст питча правится прямо в SVG обычными буквами.

     ПАЛИТРА ПРОЕКТА:
       4F46E5 индиго · 7C3AED фиолетовый · DB2777 малиновый
     Растяжка для бейджей (равные шаги):
       4F46E5 · 6141E8 · 733CEB · 8F36D5 · B52FA6 · DB2777
     ══════════════════════════════════════════════════ -->

<div align="center">

<img src="docs/header.svg" width="100%" alt="" />

<br/><br/>

[![Демо](https://img.shields.io/badge/Живое_демо-4F46E5?style=for-the-badge&logo=vercel&logoColor=white)](URL)
[![Видео](https://img.shields.io/badge/Видео_2_мин-7C3AED?style=for-the-badge&logo=youtube&logoColor=white)](URL)
[![Презентация](https://img.shields.io/badge/Презентация-DB2777?style=for-the-badge&logo=googleslides&logoColor=white)](URL)

<!-- СТРОКА СОСТОЯНИЯ — читается как приборная панель живого продукта -->

![Часы](https://img.shields.io/badge/%D1%81%D0%BE%D0%B1%D1%80%D0%B0%D0%BD%D0%BE_%D0%B7%D0%B0-48_%D1%87-4F46E5?style=flat-square)
![Точность](https://img.shields.io/badge/%D1%82%D0%BE%D1%87%D0%BD%D0%BE%D1%81%D1%82%D1%8C-0.94_F1-733CEB?style=flat-square)
![Скорость](https://img.shields.io/badge/%D0%B2%D1%80%D0%B5%D0%BC%D1%8F_%D0%BE%D1%82%D0%B2%D0%B5%D1%82%D0%B0-200_ms-B52FA6?style=flat-square)
![Стенд](https://img.shields.io/badge/%D1%81%D1%82%D0%B5%D0%BD%D0%B4-%D1%80%D0%B0%D0%B7%D0%B2%D1%91%D1%80%D0%BD%D1%83%D1%82-DB2777?style=flat-square)

<br/>

<img src="docs/demo.gif" width="100%" alt="Демонстрация" />

</div>

<!-- ПРАВИЛА ФАЙЛА
     1. Гифка выше — главный элемент. 10–15 сек, один сквозной сценарий.
     2. Длинное прячется в <details>: суть видна, детали доступны.
     3. Каждый абзац отвечает на вопрос жюри. Не отвечает — удалить. -->

<br/>

## Проблема

**{Роль}** тратит **{цифра}** на **{операция}**.

{Одно предложение: почему так происходит сейчас.}

## Что мы сделали

```diff
- Ручная сверка обращений — 40 секунд каждое, 217 раз за смену
+ Автоматическое склеивание дублей — 0.2 секунды, без участия человека
```

|  | Было | Стало |
|---|---|---|
| **{Ключевая метрика}** | {знач.} | **{знач.}** |
| **{Вторая метрика}** | {знач.} | **{знач.}** |
| **{Третья}** | {знач.} | **{знач.}** |

{За счёт чего получен результат. Не «мы применили ИИ», а конкретный механизм.}

<br/>

## Возможности

<table>
<tr>
<td width="50%">

**{Фича 1}**
{Что даёт пользователю}

</td>
<td width="50%">

**{Фича 2}**
{Что даёт пользователю}

</td>
</tr>
<tr>
<td width="50%">

**{Фича 3}**
{Что даёт пользователю}

</td>
<td width="50%">

**{Фича 4}**
{Что даёт пользователю}

</td>
</tr>
</table>

<br/>

## Как устроено

<!-- Две версии схемы. GitHub подставит нужную под тему смотрящего. -->
<div align="center">
<picture>
  <source media="(prefers-color-scheme: dark)"  srcset="docs/architecture-dark.png">
  <source media="(prefers-color-scheme: light)" srcset="docs/architecture-light.png">
  <img src="docs/architecture-dark.png" width="90%" alt="Архитектура" />
</picture>
</div>

**Ключевое решение:** {то, чем гордитесь технически. Какую альтернативу рассматривали и почему отказались. Сюда придёт первый вопрос жюри — ответ пишется заранее.}

<br/>

## Стек

<div align="center">

<!-- Ряд 1: инструменты. Иконки единообразные, поэтому фирменные бейджи здесь лишние. -->
<img src="https://skillicons.dev/icons?i=python,fastapi,postgres,docker,nextjs,ts,react,tailwind,git,linux&theme=dark&perline=10" alt="Python, FastAPI, PostgreSQL, Docker, Next.js, TypeScript, React, Tailwind, Git, Linux" />

<br/><br/>

<!-- Ряд 2: что именно делает система. Цвета по растяжке слева направо —
     строка читается как один объект, а не набор наклеек. -->

![RAG](https://img.shields.io/badge/RAG_Pipeline-4F46E5?style=flat-square&logoColor=white)
![Vector Search](https://img.shields.io/badge/pgvector_%C2%B7_Vector_Search-6141E8?style=flat-square&logoColor=white)
![Embeddings](https://img.shields.io/badge/Embeddings-733CEB?style=flat-square&logoColor=white)
![Semantic Dedup](https://img.shields.io/badge/Semantic_Dedup-8F36D5?style=flat-square&logoColor=white)
![Streaming](https://img.shields.io/badge/Streaming_Responses-B52FA6?style=flat-square&logoColor=white)
![Human in the loop](https://img.shields.io/badge/Human_in_the_Loop-DB2777?style=flat-square&logoColor=white)

<br/>

<!-- Ряд 3: библиотеки с логотипами, та же растяжка -->

![Hugging Face](https://img.shields.io/badge/Hugging_Face-4F46E5?style=flat-square&logo=huggingface&logoColor=white)
![Transformers](https://img.shields.io/badge/Transformers-6141E8?style=flat-square&logo=huggingface&logoColor=white)
![Pydantic](https://img.shields.io/badge/Pydantic-733CEB?style=flat-square&logo=pydantic&logoColor=white)
![SQLAlchemy](https://img.shields.io/badge/SQLAlchemy-8F36D5?style=flat-square&logo=sqlalchemy&logoColor=white)
![HeroUI](https://img.shields.io/badge/HeroUI-B52FA6?style=flat-square&logoColor=white)
![uv](https://img.shields.io/badge/uv-DB2777?style=flat-square&logo=uv&logoColor=white)

</div>

<br/>

## Запуск

```bash
git clone URL && cd REPO
cp .env.example .env
make up
```

→ http://localhost:3000 · API: http://localhost:8000/docs

Нужен только Docker. Проверено на чистой машине.

<details>
<summary><b>Переменные окружения, команды, запуск без Docker</b></summary>

<br/>

| Переменная | Зачем | Обязательна |
|---|---|---|
| `VAR` | назначение | да |
| `VAR` | назначение | нет |

```bash
make seed      # демо-данные
make eval      # воспроизвести замер метрик
make lint      # проверки
make down      # остановить
```

Без Docker:

```bash
cd backend  && uv sync && uv run uvicorn app.main:app --reload
cd frontend && pnpm i  && pnpm dev
```

</details>

<details>
<summary><b>Структура репозитория</b></summary>

<br/>

```
backend/
  app/api/       роуты FastAPI
  app/core/      бизнес-логика
  app/ml/        модели и инференс
frontend/
  app/           App Router
  components/    UI
docs/            схемы, гифки, презентация
```

</details>

<br/>

## Что дальше

- **{Пункт}** — что нужно для внедрения в прод
- **{Пункт}** — ограничение прототипа и как снимается
- **{Пункт}** — как масштабируется на объёмы заказчика

<br/>

<div align="center">

**{Имя}** · Backend / ML · [@tg](URL) &nbsp;·&nbsp; **{Имя}** · Frontend · [@tg](URL) &nbsp;·&nbsp; **{Имя}** · Аналитика · [@tg](URL)

</div>

<img src="docs/footer.svg" width="100%" alt="" />