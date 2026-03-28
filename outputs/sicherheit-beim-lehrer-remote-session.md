# Sicherheit beim Remote-Arbeiten mit dem Lehrer
**Wichtige Sicherheits-Checkliste für heute 14:00 Uhr**

---

## 🔴 ABSOLUT NICHT zeigen / weitergeben

| Was | Warum | Aktion |
|---|---|---|
| **Private SSH Key** | Das ist dein Hausschlüssel! | Niemals zeigen / kopieren |
| **Hetzner Passwort** | Vollzugriff auf deinen Account | Lehrer tippt selbst ein (oder gibt dir nur den Link) |
| **Kreditkarte / Zahlungsdaten** | Zahlungsmittel-Missbrauch möglich | Du schließt Checkout ab, nicht der Lehrer |
| **Root-Passwort des Servers** | Kompletter Zugriff auf Server | Nicht nötig - SSH Key reicht |
| **API Keys / Tokens** | Zugriff auf deine Konten (IB, ThetaData, etc.) | Für später - heute noch nicht relevant |
| **Persönliche Dateien** | Desktop, Dokumente, etc. | Nur relevante Fenster teilen |

---

## ✅ SICHER zu zeigen

| Was | Warum OK | Wie |
|---|---|---|
| **Public SSH Key** | Ist öffentlich (_.pub Datei) | Gerne zeigen / kopieren |
| **Hetzner Login Screen** | Nur zum Anschauen | Screenshot reicht, nicht live einloggen |
| **Terminal Output** | Ist harmlos | Gerne zeigen |
| **Code / Skripte** | Deine Arbeit | Gerne zeigen / bearbeiten |
| **Server-Zugriff (SSH)** | Zusammen connecten | SSH zusammen verwenden |

---

## 🛡️ Praktische Sicherheitstipps für die Session

### 1. **Screen Sharing mit Bedacht**
```
❌ NICHT: Ganzen Desktop teilen
✅ BESSER: Nur bestimmte Fenster teilen (z.B. Terminal, Browser)
```

**Wie in Windows:**
- Rechtsklick auf Fenster → "Fenster anpinnen" oder
- Alt+Tab um zwischen Fenstern zu wechseln (nicht Desktop zeigen)

### 2. **Hetzner Account — Sichere Anmeldung**
```
Option A (Sicherer):
1. Du loggst dich selbst in Hetzner ein (nur du siehst Passwort)
2. Lehrer sieht nur die Hetzner Console nach Login
3. Zusammen Server bestellen

Option B (Auch OK):
1. Gib dem Lehrer den Direct Link zur Server-Bestellung
2. Er sieht nur die Server-Config-Seite
3. Du zahlst
```

### 3. **SSH Key — Richtig handhaben**
```
✅ PUBLIC KEY zeigen:
   cat C:\Users\Bernd\.ssh\id_ed25519.pub
   → Ganz OK zu zeigen

❌ PRIVATE KEY NIEMALS:
   cat C:\Users\Bernd\.ssh\id_ed25519
   → NIEMALS öffnen/zeigen!
```

### 4. **Server-Access — Zusammen verbinden**
```
Sichere Variante:
1. Du gibst Lehrer die Server-IP (nicht sensibel)
2. Lehrer tippt: ssh root@[IP]
3. Server akzeptiert ihn (weil dein SSH Key da ist)
4. Ihr arbeitet zusammen im Terminal
5. Lehrer sieht alles, aber der Private Key bleibt lokal

Hinweis: Die SSH Key authentifiziert automatisch — kein Passwort nötig!
```

### 5. **Passwort-Manager sperren**
```
Vor Remote Session:
❌ Nicht alle Browser-Passwörter zeigen
✅ Browser auf privaten Modus umschalten
✅ Passwort-Manager sperren (LastPass, etc.)
```

---

## 📋 Pre-Session Checkliste

- [ ] **Hetzner Passwort merken** (nicht aufgeschrieben auf Papier)
- [ ] **Private SSH Key Ordner verstecken** (nicht auf Desktop)
- [ ] **Browser-Tabs cleanen** (nur notwendige Tabs offen)
- [ ] **Persönliche Dateien minimieren** (Desktop aufräumen)
- [ ] **Antivirus/Firewall prüfen** (sollte laufen)
- [ ] **Screenshot-Tool vorbereiten** (falls nötig)
- [ ] **Diese Sicherheits-Checkliste ausdrucken / neben dir haben** 📋

---

## 🚨 Was tun, falls etwas schiefgeht?

| Szenario | Aktion |
|---|---|
| **Lehrer sieht versehentlich ein Passwort** | Passwort sofort ändern! |
| **Lehrer verlangt Private Key** | NEIN sagen. Das ist nicht nötig. |
| **Lehrer verlangt Root Passwort** | NEIN sagen. SSH Key reicht. |
| **Verdächtige Fragen** | Session beenden, Claude fragen |
| **Etwas fühlt sich unsicher an** | Lieber vorsichtig sein und fragen |

---

## ✍️ Merksätze für dich

```
🔑 "Der Private SSH Key bleibt immer auf meinem Rechner"
🔐 "Passwörter gebe ich nur selbst ein, nicht der Lehrer"
👀 "Ich teile nur das, was nötig ist"
❓ "Wenn ich unsicher bin, frage ich Claude"
```

---

## Nach der Session

- [ ] **Überprüfen:** Passwörter wurden nicht kompromittiert
- [ ] **Private Key:** Noch vorhanden und unverändert?
- [ ] **Hetzner Account:** Nur erwartet Aktivitäten?
- [ ] **Browser History cleanen** (optional)

---

## Notizen

- **Dein Lehrer sollte das verstehen** — seriöse Tutoren respektieren Sicherheit
- **Du bist der Account-Owner** — du entscheidest, was geteilt wird
- **Faustregel:** Im Zweifelsfall NICHT teilen
- **SSH Key ist clever designed** — genau dafür, dass du ihn teilen kannst (public) aber nicht dein Passwort

---

_Erstellt: 28.03.2026_
_Vor deiner 14:00 Uhr Session_
