---
name: digest
description: Full cycle — search news via Tavily, write article, generate cover, judge, commit and push.
argument-hint: <тема статьи на русском, например "частотные преобразователи в насосных станциях">
allowed-tools: Agent, mcp__tavily-search__tavily-search, Write, Edit, Bash, Glob, Read
---

Запусти полный цикл публикации статьи через три субагента: article-writer → article-judge → publisher.

Тема: $ARGUMENTS

## Шаг 1. Написать статью

Запусти субагент **article-writer**, передав ему тему:

```
Agent: article-writer
Prompt: $ARGUMENTS
```

Субагент напишет статью и сгенерирует обложку. Запомни slug статьи из его ответа.

## Шаг 2. Проверить статью

Запусти субагент **article-judge**, передав ему путь к файлу статьи:

```
Agent: article-judge
Prompt: src/content/blog/SLUG.md
```

Если субагент вернул `✅ ПРОШЛА ПРОВЕРКУ` — переходи к шагу 3.

Если вернул `❌ НАРУШЕНИЯ НАЙДЕНЫ` — покажи пользователю список нарушений и **остановись**. Не публикуй статью.

## Шаг 3. Опубликовать статью

Запусти субагент **publisher**, передав ему slug:

```
Agent: publisher
Prompt: SLUG
```

## Финал

После успешной публикации сообщи:
- Название статьи
- Результат проверки: ✅ прошла
- Ссылка: `https://ai-digest-psdgavr-beep-projects.vercel.app/blog/SLUG`
