---
name: cover
description: Generate cover image for blog article via Pollinations.ai (free, no API key). Pass article title/description as argument.
argument-hint: <article description in Russian>
allowed-tools: Bash
---

Сгенерируй обложку для статьи блога про промышленную автоматизацию.

Описание статьи: $ARGUMENTS

## Шаги

**1. Придумай slug**

Возьми 3–4 ключевых слова из описания, переведи на английский, строчными через дефис. Пример: "предиктивная защита двигателей" → `predictive-motor-protection`.

**2. Составь промпт на английском**

Шаблон:
```
Industrial automation: [конкретный объект из темы — двигатель, контактор, щит управления]. Factory environment, electrical equipment. Dark industrial aesthetic, dramatic lighting, high contrast, photorealistic, no text, no people.
```

Закодируй промпт для URL: пробелы → `%20`, запятые → `%2C`.

**3. Скачай картинку**

```bash
curl -sL "https://image.pollinations.ai/prompt/ПРОМПТ_В_URL?width=1024&height=576&model=flux&nologo=true&seed=42" \
  -o "src/assets/covers/SLUG.jpg"
```

**4. Проверь что файл создался**

```bash
ls -lh src/assets/covers/SLUG.jpg
```

**5. Сообщи результат**

Выведи пользователю:
- Файл: `src/assets/covers/SLUG.jpg`
- Строка для frontmatter: `heroImage: '../../assets/covers/SLUG.jpg'`
