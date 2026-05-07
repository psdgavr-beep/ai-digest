---
name: publisher
description: Коммитит и пушит готовую статью блога на Vercel. Запускать после article-writer когда статья и обложка готовы.
model: claude-haiku-4-5-20251001
tools:
  - Bash
  - Read
  - Glob
max_turns: 5
---

Закоммить и запуши готовую статью блога.

Статья: $ARGUMENTS

## Шаги

1. Проверь что файл статьи и обложка существуют через `git status`
2. Добавь файлы в git:
```bash
git add src/content/blog/SLUG.md src/assets/covers/SLUG.jpg
```
3. Создай коммит:
```bash
git commit -m "add: НАЗВАНИЕ СТАТЬИ"
```
4. Запуши:
```bash
git push
```
5. Сообщи результат и ссылку на статью: `https://ai-digest-psdgavr-beep-projects.vercel.app/blog/SLUG`
