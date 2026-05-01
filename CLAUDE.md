# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
npm install       # install dependencies (Node >=22.12.0 required)
npm run dev       # dev server at http://localhost:4321
npm run build     # production build
npm run preview   # preview production build
```

## Architecture

Astro static site with MDX support, deployed to Vercel. Content is driven entirely by Markdown files — no database, no API.

**Content pipeline:** `src/content/blog/*.md` → Astro content collection → pages rendered by `src/pages/blog/[...slug].astro`.

**Frontmatter schema:**
```markdown
---
title: 'Заголовок'
description: 'Краткое описание.'
pubDate: '2026-04-30'
tags: ['контакторы', 'автоматизация']
---
```

Articles live in `src/content/blog/` as `.md` files. Adding a file there is enough to publish it.

## Git Conventions

**Ветки:** `feature/название` — новая статья, `fix/название` — правка.

**Коммиты:** `add` — новый файл, `update` — правка существующего, `fix` — исправление ошибки.

**Правило:** один коммит — одно изменение.

## Rules

Правила блога (тематика, аудитория, стиль статей): `.claude/rules/blog-style.md`

## Compact Instructions

При сжатии контекста обязательно сохранить:
- Стиль статей: живой разговорный технический, русский язык
- Аудитория: главные энергетики, механики, инженеры-практики
- Объём статьи: 400–500 слов
- Позиция блога: бесконтактные решения лучше контактных
- Запреты: не упоминать производителей, не использовать "инновационный/передовой/современный"
