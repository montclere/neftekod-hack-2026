#!/usr/bin/env bash
# Наполнение GitHub Projects задачами.
# Запуск: ./seed_issues.sh <owner> <repo> <project-number>
# Удобнее запускать из Claude Code — он прочитает docs/DEMO.md
# и сгенерирует список задач под конкретный кейс вместо шаблонного.
set -euo pipefail

OWNER=$1; REPO=$2; PROJ=$3

gh label create blocks   --color B60205 --description "блокирует других"  -R $OWNER/$REPO || true
gh label create parallel --color 0E8A16 --description "можно параллельно" -R $OWNER/$REPO || true
gh label create after    --color FBCA04 --description "после интеграции"  -R $OWNER/$REPO || true
gh label create baseline --color 1D76DB -R $OWNER/$REPO || true
gh label create extend   --color 5319E7 -R $OWNER/$REPO || true

TASKS=(
  "Контракт API и схемы Pydantic|blocks,baseline|Эндпоинты и схемы. Блокирует фронт. Делается вдвоём."
  "Схема БД и сиды|blocks,baseline|Модели + app/seed.py с реалистичными данными."
  "Экраны на моках|parallel,baseline|Все экраны демо-сценария на замоканных данных."
  "Ядро логики в core|parallel,baseline|Основной алгоритм решения кейса."
  "Интеграция: моки на реальные вызовы|after,baseline|Точка стыковки дорожек."
  "Замер метрик, make eval|after,baseline|Воспроизводимое число для README."
  "Объяснимость решения|after,extend|Почему система решила именно так."
  "Поведение при неуверенности|after,extend|Человек в контуре."
  "README, схема архитектуры|after,extend|Упаковка."
  "Демо-видео 90 секунд|after,extend|По сценарию из docs/DEMO.md."
)

for t in "${TASKS[@]}"; do
  IFS='|' read -r title labels body <<< "$t"
  url=$(gh issue create -R $OWNER/$REPO --title "$title" --body "$body" --label "$labels")
  gh project item-add $PROJ --owner $OWNER --url "$url"
  echo "→ $title"
done
