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

Пиши как описание реальной фотографии — конкретный объект крупным планом, материал, откуда свет, что на фоне. Не «промышленная атмосфера», а что именно видит камера.

Шаблон:
```
Close-up photo of [конкретный объект: frequency converter display / contactor terminals / motor nameplate / control cabinet wiring], metal and plastic surfaces, industrial facility background with blurred machinery, cool blue light from indicator LEDs, shallow depth of field, professional industrial photography, sharp focus, no text, no people, no logos.
```

Примеры хороших объектов по теме:
- ЧРП / частотник → `frequency converter front panel with digital display and indicator lights`
- Контактор → `heavy-duty electrical contactor with copper terminals and arc chambers`
- Насос → `industrial pump volute casing with flange connections and pressure gauge`
- Реле → `thermal overload relay with adjustment dial and trip indicator`
- Щит управления → `open electrical control cabinet with DIN rail mounted components`

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
