<!-- ═══════════════════════════════════════════════════════════════════
     ШАБЛОН ВИТРИННОГО README — лицевая страница для жюри.
     ВАРИАНТ «ЛОКАЛЬНЫЕ SVG»: шапка и футер — файлы docs/design/header.svg и footer.svg.
     Текст правится обычными буквами внутри SVG, палитра — в блоке <defs>.
     Ничего не зависит от чужих сервисов.

     Второй, равноправный вариант — README-external.md (шапка и футер с внешних генераторов).
     Отличаются только шапкой и футером (и оттенками палитры под них);
     разделы, тексты и структура идентичны. Выбор — вкусовой.

     Как пользоваться (фаза упаковки, 80–90% срока):
       cp docs/pitch/README-svg.md README.md
     и дальше править уже в корне. Пути к картинкам отсчитываются
     ОТ КОРНЯ репозитория — пока файл лежит здесь, на GitHub
     картинки будут битыми. Это нормально.

     Рабочий README, который читает команда, — тот, что сейчас в корне.
     ═══════════════════════════════════════════════════════════════════ -->

<!-- ═════════════════════ ШАПКА ═════════════════════
     Шапка и футер — локальные файлы docs/design/header.svg и footer.svg.
     Внутри переливающийся градиент, текст правится обычными буквами.

     ПАЛИТРА ПРОЕКТА:
       050A0F чёрный · 246487 глубокий · 338EBF средний · 42B6F5 акцент
     Растяжка для бейджей (равные шаги, белый текст читается на всех):
       0A1B27 · 123244 · 1A4961 · 226080 · 2B779F · 338EBF
     Яркий 42B6F5 держим для акцентов: кнопка презентации,
     логотипы на бейджах, черта в шапке.
     ══════════════════════════════════════════════════ -->

<div align="center">

<img src="docs/design/header.svg" width="100%" alt="" />

<br/><br/>

[![Видео](https://img.shields.io/badge/Видео_2_мин-0A1B27?style=for-the-badge&logo=youtube&logoColor=42B6F5)](URL)
[![Презентация](https://img.shields.io/badge/Презентация-42B6F5?style=for-the-badge&logo=googleslides&logoColor=050A0F)](URL)

<!-- СТРОКА СОСТОЯНИЯ — читается как приборная панель живого продукта -->

![Часы](https://img.shields.io/badge/%D1%81%D0%BE%D0%B1%D1%80%D0%B0%D0%BD%D0%BE_%D0%B7%D0%B0-48_%D1%87-0A1B27?style=flat-square)
![Точность](https://img.shields.io/badge/%D1%82%D0%BE%D1%87%D0%BD%D0%BE%D1%81%D1%82%D1%8C-0.94_F1-174158?style=flat-square)
![Скорость](https://img.shields.io/badge/%D0%B2%D1%80%D0%B5%D0%BC%D1%8F_%D0%BE%D1%82%D0%B2%D0%B5%D1%82%D0%B0-200_ms-25678A?style=flat-square)
![Стенд](https://img.shields.io/badge/%D1%81%D1%82%D0%B5%D0%BD%D0%B4-%D1%80%D0%B0%D0%B7%D0%B2%D1%91%D1%80%D0%BD%D1%83%D1%82-338EBF?style=flat-square)

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

<!-- ⚠️ БЕЙДЖИ НИЖЕ — ПРИМЕР под гипотетический RAG-кейс (postgres, pgvector,
     RAG Pipeline, Semantic Dedup, Hugging Face). В проекте этого нет.
     Замените на то, что реально запущено: бейдж — такое же обещание жюри,
     как цифра. Технический эксперт спросит про каждый.
     Актуальный состав стека — в корневом README и docs/adr/0002-stack.md. -->

<!-- Ряд 1: инструменты. Иконки единообразные, поэтому фирменные бейджи здесь лишние. -->
<img src="https://skillicons.dev/icons?i=python,fastapi,postgres,docker,nextjs,ts,react,tailwind,git,linux&theme=dark&perline=10" alt="Python, FastAPI, PostgreSQL, Docker, Next.js, TypeScript, React, Tailwind, Git, Linux" />

<br/><br/>

<!-- Ряд 2: что именно делает система. Цвета по растяжке слева направо —
     строка читается как один объект, а не набор наклеек. -->

![RAG](https://img.shields.io/badge/RAG_Pipeline-0A1B27?style=flat-square&logoColor=white)
![Vector Search](https://img.shields.io/badge/pgvector_%C2%B7_Vector_Search-123244?style=flat-square&logoColor=white)
![Embeddings](https://img.shields.io/badge/Embeddings-1A4961?style=flat-square&logoColor=white)
![Semantic Dedup](https://img.shields.io/badge/Semantic_Dedup-226080?style=flat-square&logoColor=white)
![Streaming](https://img.shields.io/badge/Streaming_Responses-2B779F?style=flat-square&logoColor=white)
![Human in the loop](https://img.shields.io/badge/Human_in_the_Loop-338EBF?style=flat-square&logoColor=white)

<br/>

<!-- Ряд 3: библиотеки с логотипами, та же растяжка.
     Логотипы в 42B6F5 — единственное место, где ярко. -->

![Hugging Face](https://img.shields.io/badge/Hugging_Face-0A1B27?style=flat-square&logo=huggingface&logoColor=42B6F5)
![Transformers](https://img.shields.io/badge/Transformers-123244?style=flat-square&logo=huggingface&logoColor=42B6F5)
![Pydantic](https://img.shields.io/badge/Pydantic-1A4961?style=flat-square&logo=pydantic&logoColor=42B6F5)
![SQLAlchemy](https://img.shields.io/badge/SQLAlchemy-226080?style=flat-square&logo=sqlalchemy&logoColor=42B6F5)
![shadcn/ui](https://img.shields.io/badge/shadcn%2Fui-2B779F?style=flat-square&logoColor=white)
![uv](https://img.shields.io/badge/uv-338EBF?style=flat-square&logo=uv&logoColor=42B6F5)

</div>

<br/>

## Запуск

<!-- ⚠️ СВЕРЬТЕ С РЕАЛЬНЫМ Makefile перед сдачей: `make help`.
     Жюри выполняет эти команды. Команда из README, которой нет, —
     это минус доверие ко всему остальному в файле. -->

```bash
git clone URL && cd REPO
make setup
```

Дальше две вкладки терминала:

```bash
make dev-api     # → http://localhost:8000/docs
make dev-web     # → http://localhost:3000
```

Нужны Node 22+, pnpm и uv. Проверено на чистой машине.

<details>
<summary><b>Переменные окружения и остальные команды</b></summary>

<br/>

| Переменная | Зачем | Обязательна |
|---|---|---|
| `VAR` | назначение | да |
| `VAR` | назначение | нет |

```bash
make types     # TS-типы из OpenAPI после правки схем
make lint      # ruff + biome
make check     # бэкенд отвечает?
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

<img src="docs/design/footer.svg" width="100%" alt="" />