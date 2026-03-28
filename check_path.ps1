# Sicherheitsskript: Blockiert Dateizugriffe außerhalb des Claude Code Ordners
$allowedBase = "C:\Users\Bernd\Desktop\Claude Code"

try {
    $json = [Console]::In.ReadToEnd() | ConvertFrom-Json
    $path = $json.tool_input.file_path
    if (-not $path) { $path = $json.tool_input.path }

    if ($path) {
        # Pfad normalisieren
        $fullPath = [System.IO.Path]::GetFullPath($path)
        if (-not $fullPath.StartsWith($allowedBase)) {
            @{ continue = $false; stopReason = "Sicherheit: Zugriff auf '$fullPath' verweigert. Nur '$allowedBase' erlaubt." } | ConvertTo-Json -Compress
            exit 0
        }
    }
} catch {}

@{ continue = $true } | ConvertTo-Json -Compress
