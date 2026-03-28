# Hetzner Setup Plan für SPX-Handelssystem
**Datum:** 28.03.2026 | **Termin:** 14:00 Uhr mit Tutor
**Server:** AX162-R | **Betriebssystem:** Linux (Debian 12 oder Ubuntu 24.04)

---

## Warum Linux und nicht Windows?

| Aspekt | Linux | Windows |
|---|---|---|
| **Numba JIT Performance** | ✅ Optimal | ⚠️ Langsamer |
| **Python/DuckDB** | ✅ Native | ⚠️ WSL-Overhead |
| **24/7 Stabilität** | ✅ Proven | ⚠️ Reboot-Updates |
| **Uptime für Live-Trading** | ✅ 99,9% Standard | ⚠️ Schwächer |
| **Interactive Brokers TWS** | ✅ Läuft über Wine/VirtualBox | ⚠️ Native (aber Overhead) |
| **Kosten** | ✅ Kostenlos | ⚠️ +ca. 15 €/Monat |
| **Automatisierung** | ✅ systemd, cron (perfekt!) | ⚠️ Task Scheduler |

**Empfehlung: Linux (Debian 12 oder Ubuntu 24.04 LTS)**

---

## Bestellungs-Checkliste (VOR 14:00 Uhr)

### 1. Server-Konfiguration auf Hetzner.com

**URL:** https://www.hetzner.com/dedicated-rootserver/ax162-r/

```
Server: AX162-R
CPU:    AMD EPYC 9454P (48C/96T) — NICHT ändern
RAM:    256 GB DDR5 ECC — NICHT ändern
Storage: 2x 1.92 TB NVMe Gen4 — OK
OS:     Debian 12 oder Ubuntu 24.04 LTS
```

**Wichtig bei Konfiguration:**
- [ ] **Betriebssystem wählen:** Debian 12 (einfacher) oder Ubuntu 24.04 LTS (bekannter)
- [ ] **SSH-Pubkey hochladen** (ggf. jetzt generieren) — NICHT Passwort!
- [ ] **Hostname setzen:** z.B. `spx-trading-01`
- [ ] **Rescue-Partition:** Standard OK (brauchst du für Recovery)

### 2. Bestellung Durchführen

```
Preis:     €209,00/Monat (netto)
Setup:     €79,00 (einmalig, netto)
Zeitrahmen: Lieferung 5-10 Minuten (nach Zahlungsbestätigung)
```

- [ ] **Zahlungsart wählen** (Lastschrift, Kreditkarte, etc.)
- [ ] **WICHTIG: VOR 1. April bestellen** (Preiserhöhung!)

### 3. Nach der Bestellung

Du erhältst innerhalb von **5-10 Minuten**:
- [ ] E-Mail mit Root-Zugang (IP-Adresse, Zugangsdaten)
- [ ] Server lädt OS herunter und bootet
- [ ] SSH-Zugriff möglich

---

## Heutige Setup-Agenda (14:00 – 15:00 Uhr)

### Phase 1: Server bestellen & warten (5-10 Min)

Mit deinem Tutor:
1. Server auf Hetzner.com konfigurieren
2. Checkout
3. Zahlungsbestätigung
4. **Warten:** 5-10 Minuten, bis Server online ist

### Phase 2: Erste SSH-Verbindung (5 Min)

```bash
# Von deinem lokalen Rechner:
ssh root@[SERVER-IP]

# Sollte funktionieren (wenn SSH-Key richtig)
```

- [ ] SSH-Verbindung funktioniert?
- [ ] `uname -a` testen → sollte Linux zeigen

### Phase 3: Basis-Setup (10 Min)

```bash
# Als root:
apt update && apt upgrade -y
apt install -y build-essential python3 python3-pip python3-dev git

# Neuen User erstellen (nicht als root arbeiten!):
useradd -m -s /bin/bash trading
passwd trading
```

### Phase 4: Python + Dependencies (10 Min)

```bash
# Als 'trading' user:
su - trading

# Python packages installieren:
pip install --upgrade pip
pip install numpy numba pandas scikit-learn duckdb pyarrow pydantic
```

### Phase 5: Claude Code Server (15 Min)

```bash
# Claude Code CLI installieren (falls noch nicht)
# Oder: Claude Code direkt mit SSH verbinden

# Workspace-Verzeichnis erstellen:
mkdir -p ~/workspace/spx-trading
cd ~/workspace/spx-trading
git init
```

### Phase 6: Erste Tests (5 Min)

```bash
# Python-Version checken:
python3 --version

# Numba funktioniert?
python3 -c "from numba import jit; print('Numba OK')"

# DuckDB?
python3 -c "import duckdb; print('DuckDB OK')"
```

---

## Was brauchst du VOR 14:00 Uhr?

### Technisch:
- [ ] **SSH-Key generiert** (falls noch nicht)
  ```bash
  ssh-keygen -t ed25519 -f ~/.ssh/hetzner_key
  ```
- [ ] Hetzner Account erstellt (kostet Minuten)
- [ ] Zahlungsmethod hinterlegt

### Organisatorisch:
- [ ] Diese Datei gelesen
- [ ] Klare Anweisungen für deinen Tutor
- [ ] 60 Minuten Zeit + Fokus

### Optional (aber hilfreich):
- [ ] PuTTY oder Terminal-Programm getestet (für Windows)
- [ ] `ssh` command getestet (auf Mac/Linux)

---

## Nach der ersten Stunde (Next Steps)

### Unmittelbar danach:
1. **Server-Zugang dokumentieren**
   - IP-Adresse
   - SSH-Key speichern
   - Hostname merken

2. **Data Pipeline vorbereiten**
   - Verzeichnis für ThetaData-Dumps
   - DuckDB-Schema designen
   - Erste Test-Daten laden

3. **Claude Code integrieren**
   - Remote SSH-Connection in Claude Code
   - Workspace auf Server
   - Erste Backtest-Skripte schreiben

### Zweite Session mit Tutor:
- Datenquellen einrichten (ThetaData oder Alternative)
- Parquet-Storage Setup
- Erste Backtest Engine Grundlagen

---

## Häufige Probleme & Lösungen

| Problem | Lösung |
|---|---|
| SSH-Verbindung verweigert | Server bootet noch (5-10 Min warten) |
| Permission denied (publickey) | SSH-Key Rechte: `chmod 600 ~/.ssh/key` |
| apt update fehlgeschlagen | `apt update` mehrmals versuchen (spiegeln) |
| Python-Module nicht gefunden | `pip install --user` statt `pip install` |
| Speicherplatz voll | `df -h` checken, cleanup nötig |

---

## Wichtige Notizen

- **Root nicht für Development verwenden** — immer normalen User erstellen
- **Firewall:** Hetzner hat keine, aber `ufw` installieren ist sinnvoll
- **Backups:** Mit Hetzner-Backup-Option rechnen (ca. 20 €/Monat extra)
- **Monitoring:** `htop` installieren zur Live-Überwachung

---

## Kontakt & Fragen

Falls Probleme:
- Hetzner Support: [support.hetzner.com](https://support.hetzner.com)
- Dein Tutor sollte Linux-Basics kennen
- Diese Datei als Referenz mitnehmen

---

_Plan erstellt: 2026-03-28_
_Tutor-Session: Heute 14:00 Uhr_
_Status: Bereit zum Starten ✅_
