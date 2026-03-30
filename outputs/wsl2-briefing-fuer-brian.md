# WSL2 Briefing für Brian
**Vorbereitung für Schulung am 30.03.2026 um 16:00 Uhr**

---

## Was ist WSL2?

**Windows Subsystem for Linux 2** — ein echtes Linux, das direkt in Windows läuft. Kein VirtualBox, keine virtuelle Maschine im klassischen Sinn. Es verhält sich wie ein Linux-Terminal als Windows-App.

---

## Warum will Bernd WSL2?

### Problem mit der aktuellen Lösung (VirtualBox + Linux Mint):
- Zwischenablage funktioniert nicht zuverlässig (z.B. Screenshots zwischen Windows und Linux)
- Mikrofon/Audio-Durchreichung ist umständlich
- Hoher RAM-Verbrauch (~4 GB für die VM)
- Langsam, da VM in VirtualBox
- Viele Linux-Befehle sind Bernd noch ungewohnt — die VM macht es nicht einfacher

### Was WSL2 besser macht:
| Aspekt | VirtualBox + Linux Mint | WSL2 |
|---|---|---|
| Installation | 30-60 Min | 5 Min (1 Befehl) |
| RAM-Verbrauch | ~4 GB | ~0.5 GB |
| Zwischenablage | Probleme | Funktioniert nativ |
| Audio/Mikrofon | Umständlich | Funktioniert nativ |
| Dateiaustausch | Gemeinsame Ordner nötig | Direkt möglich |
| Geschwindigkeit | Langsam | Fast nativ |
| Bedienung | Eigener Desktop, eigenes Fenster | Terminal-Fenster in Windows |

---

## Wofür braucht Bernd das?

Bernd baut ein **automatisiertes SPX-Optionen-Handelssystem** in Python. Dafür nutzt er **Claude Code** — ein KI-Entwicklungsassistent, der in einem Linux-Terminal läuft. WSL2 ist der einfachste und performanteste Weg, Claude Code unter Windows zu nutzen.

---

## Sicherheitskonzept

Bernds Sorge: WSL2 hat eine Brücke zu Windows (z.B. `/mnt/c/` Zugriff, `.exe`-Ausführung). In einer klassischen Linux-VM gibt es diese Brücke nicht.

### Lösung (bereits vorbereitet):
1. **CLAUDE.md Regel**: Claude Code verhält sich so, als wäre Windows nicht vorhanden — keine Vorschläge oder Befehle, die über die WSL2-Windows-Brücke gehen
2. **Settings deny-Liste**: Technische Blockierung von `/mnt/c/`, `.exe`, `powershell.exe`, `cmd.exe`
3. **cs-Modus**: Claude fragt vor jeder Aktion um Erlaubnis

Damit ist WSL2 **genauso sicher** wie eine isolierte Linux-VM.

---

## Was ist heute zu tun?

1. WSL2 auf Windows installieren (`wsl --install` in PowerShell als Admin)
2. PC neustarten
3. Ubuntu-Benutzer anlegen
4. Claude Code installieren (`curl -fsSL https://claude.ai/install.sh | sh`)
5. Projekt von GitHub klonen (`git clone git@github.com:Bernd9876/P_2_Test.git`)
6. Sicherheitsregeln testen

Geschätzte Dauer: **15-20 Minuten**

---

## Zusammenfassung in einem Satz

WSL2 ersetzt die umständliche Linux-Mint-VirtualBox durch ein schnelles, nativ integriertes Linux-Terminal in Windows — gleiche Sicherheit, viel mehr Komfort.
