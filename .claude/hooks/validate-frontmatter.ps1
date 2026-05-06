# Проверяет frontmatter в новых/изменённых статьях блога
# Запускается автоматически при остановке Claude (Stop-хук)
# exit 2 = Claude получает ошибку и должен исправить

$required = @("title", "description", "heroImage", "pubDate")
$errors = @()

# Только файлы, которые изменились в git (новые + изменённые)
$changed = & git status --porcelain "src/content/blog" |
    ForEach-Object { $_.Substring(3).Trim() } |
    Where-Object { $_ -match "src/content/blog/.*\.md$" }

if ($changed.Count -eq 0) { exit 0 }

foreach ($file in $changed) {
    if (-not (Test-Path $file)) { continue }
    $content = Get-Content $file -Raw

    if ($content -notmatch "(?s)^---.*?---") {
        $errors += "${file}: frontmatter не найден"
        continue
    }

    foreach ($field in $required) {
        if ($content -notmatch "(?m)^${field}:") {
            $errors += "${file}: отсутствует поле '${field}'"
        }
    }
}

if ($errors.Count -gt 0) {
    Write-Host "FRONTMATTER VALIDATION FAILED:"
    $errors | ForEach-Object { Write-Host "  - $_" }
    exit 2
}

exit 0
