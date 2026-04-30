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

**Content pipeline:** `src/content/blog/*.md` → Astro content collection (typed via `src/content.config.ts`) → pages rendered by `src/pages/blog/[...slug].astro` → listed on `src/pages/blog/index.astro` and `src/pages/index.astro`.

**RSS feed:** `src/pages/rss.xml.js` — auto-generated from the blog collection.

**Site-wide constants** (title, description): `src/consts.ts`.

**Frontmatter schema** (enforced by Zod in `src/content.config.ts`):
```markdown
---
title: 'Заголовок'
description: 'Краткое описание.'
pubDate: '2026-03-25'
tags: ['llm', 'anthropic']
source: 'https://example.com'   # optional, URL of original article
heroImage: ./cover.jpg           # optional
---
```

Articles live in `src/content/blog/` as `.md` or `.mdx` files. Adding a file there is enough to publish it — no registration needed.

**Site URL** is set in `astro.config.mjs` (`site` field) — update before deploying to production.

## Тематика блога

Блог о **промышленной автоматизации** — коммутационное оборудование, системы управления электроприводом, бесконтактные технологии управления.

**Тематические направления:**
- Виды коммутационного оборудования: классификация, преимущества, области применения
- Типовые проекты и решения — разбор почему они морально устарели
- Бесконтактные системы управления электроприводом как альтернатива устаревшим решениям
- Нюансы монтажа и эксплуатации в реальных условиях производства

## Целевая аудитория

Люди принимающие решения о выборе оборудования на производстве:
- Собственники предприятий
- Главные энергетики и главные механики
- Инженеры-практики
- Руководители производства

Аудитория технически грамотная — не нужно объяснять базовые термины, но нужно обосновывать почему старые решения уступают новым.

## Стиль статей

- Язык: русский, деловой технический стиль
- Формат: разборы со схемами, обзоры типовых проектов, сравнение решений
- Акцент: практическая ценность — где, как, почему именно это оборудование
- Объём: 300–600 слов на статью
- Позиция: новые бесконтактные решения предпочтительнее устаревших контактных схем — эта точка зрения последовательно обосновывается в материалах

## Git Conventions

**Ветки:**
- `feature/название` — новая статья или функциональность
- `fix/название` — правка ошибки или опечатки

**Коммиты:**
- `add` — новый файл или статья (`add статья про контакторы`)
- `update` — правка существующего файла (`update CLAUDE.md`)
- `fix` — исправление ошибки (`fix опечатка в заголовке`)

**Правило:** один коммит — одно изменение. Не смешивать несколько задач в один коммит.
