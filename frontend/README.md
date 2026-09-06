# frontend

Next.js 16 (App Router) + TypeScript + Tailwind v4 + shadcn/ui на Base UI.
Запуск из корня репозитория: `make dev-web` → http://localhost:3000

```
src/
  app/             маршруты App Router
  app/globals.css  дизайн-токены — цвета берутся только отсюда
  components/      наши компоненты
  components/ui/   shadcn — не редактировать, оборачивать
  api/schema.d.ts  сгенерировано из OpenAPI (make types), не править
  lib/utils.ts
```

- Новый UI-компонент: `pnpm dlx shadcn@latest add <name>`
- Линтер и форматтер — **biome**: `pnpm lint` / `pnpm lint:fix`.
  `components/ui/`, `api/` и `public/` из проверки исключены намеренно —
  это вендорный и сгенерированный код
- `NEXT_PUBLIC_API_URL` берётся из `frontend/.env.local`. Корневой `.env`
  Next.js **не читает** — файл создаёт `make setup`

Правила вёрстки и что можно/нельзя — в [AGENTS.md](../AGENTS.md).
