---
name: digest
description: Full cycle — search news via Tavily, write article, generate cover, commit and push.
argument-hint: <тема статьи на русском, например "частотные преобразователи в насосных станциях">
allowed-tools: mcp__tavily-search__tavily-search, Write, Edit, Bash, Glob
---

Напиши новую статью для блога про промышленную автоматизацию.

Тема: $ARGUMENTS

## Шаг 1. Поиск новостей

Используй `mcp__tavily-search__tavily-search` — сделай 2 запроса на английском по теме.
Например, если тема "частотные преобразователи": запросы `"variable frequency drives industrial 2024 2025"` и `"VFD motor control energy saving case study"`.

Выпиши 3–5 конкретных фактов или кейсов из результатов поиска — они лягут в основу статьи.

## Шаг 2. Придумай slug и название

Slug — 3–4 слова на английском строчными через дефис. Примеры: `vfd-pump-stations`, `soft-starter-vs-vfd`.

Название — на русском, живое, без слов "инновационный/передовой/современный".

## Шаг 3. Напиши статью

Правила стиля:
- Язык: русский, живой разговорный технический
- Объём: 400–500 слов
- Аудитория: главные энергетики, механики, инженеры-практики — базовые термины не объяснять
- Позиция: бесконтактные решения предпочтительнее устаревших контактных схем
- Структура: вступление → 2–3 раздела с заголовками H2 → короткий итог
- Конкретика из новостей — вставлять как факты, без ссылок
- Запрет: не упоминать производителей и конкретные модели

## Шаг 4. Сохрани статью

Определи сегодняшнюю дату командой:

```bash
date /t
```

Создай файл `src/content/blog/SLUG.md` с frontmatter:

```markdown
---
title: 'Заголовок статьи'
description: 'Одно предложение — суть статьи для превью.'
pubDate: 'YYYY-MM-DD'
heroImage: '../../assets/covers/SLUG.jpg'
tags: ['тег1', 'тег2', 'тег3']
---

Текст статьи...
```

## Шаг 5. Сгенерируй обложку

Запусти навык `/cover` передав slug и краткое описание темы:

```
/cover SLUG — краткое описание темы на русском
```

## Шаг 6. Закоммить и запуши

```bash
git add src/content/blog/SLUG.md src/assets/covers/SLUG.jpg
git commit -m "add: НАЗВАНИЕ СТАТЬИ"
git push
```

После push сообщи пользователю:
- Название статьи
- Файл: `src/content/blog/SLUG.md`
- Обложка: `src/assets/covers/SLUG.jpg`
- Ссылка на сайт: `https://ai-digest-psdgavr-beep-projects.vercel.app/blog/SLUG`
