# Aktuelle Daten

> Diese Datei enthält Metriken, Datenpunkte und aktuelle Statusinformationen, die für deine Rolle und Strategie relevant sind. Sie liefert Claude konkreten Kontext für Analysen und Entscheidungsfindung.

---

## Wie das zusammenhängt

- **business-info.md** liefert den organisatorischen Kontext
- **personal-info.md** definiert, wofür du verantwortlich bist
- **strategy.md** beschreibt, worauf du optimierst
- **Diese Datei** gibt Claude die Zahlen hinter der Erzählung

---

## Live-System (Referenz des Partners)

| Metrik | Wert |
|---|---|
| Live seit | 23.03.2026 |
| Trades/Tag | 97 (53 CALL + 44 PUT Credit Spreads) |
| Historische Daten | 945 Handelstage (Mai 2022 – Feb 2026) |
| Simulierte Trades | 554 Mio. (letzter Sweep) |
| Validierte Strategien | 2.490 (nach FDR + Walk-Forward) |

## Eigenes System (Aufbaustatus)

| Komponente | Status | Notizen |
|---|---|---|
| Data Pipeline | In Planung | ThetaData-Integration, Storage-Schema offen |
| Backtest Engine | In Planung | Numba-Kernels, Kostenmodell |
| Sweep & Analyse | In Planung | Parametersuche, Walk-Forward, FDR-Filter |
| Trading Bot | In Planung | Safety Architecture, IB TWS Integration |
| Tests / Coverage | In Planung | Ziel: >85% |

## Referenz-Tech-Stack (Partner)

- Python, Numba JIT, DuckDB, Parquet, pytest
- ThetaData Pro API, Interactive Brokers TWS API
- Telegram Bot + Twilio (Alerts)
- systemd / Windows Task Scheduler

## Offene Entscheidungen

- [ ] Eigene Datenquelle wählen (ThetaData vs. Alternative)
- [ ] Storage-Schema definieren (DuckDB + Parquet übernehmen?)
- [ ] Backtest-Engine von Grund auf oder adaptieren?
- [ ] Broker bestätigen (IB TWS?)

## Datenquellen

- Referenzsystem des Partners (Metriken manuell übertragen)
- ThetaData Pro API (historische Optionsdaten — noch nicht angebunden)
- Interactive Brokers TWS API (Live-Trading — noch nicht angebunden)

---

## Automatisierungshinweis

_Diese Datei funktioniert als statischer Snapshot, kann aber mit Skripten erweitert werden, die Live-Daten ziehen. Sobald du mit dem Workspace vertraut bist, erwäge ein Skript in `scripts/` hinzuzufügen, das diese Datei aus deinen Datenquellen aktualisiert (Dashboards, APIs, Spreadsheets, etc.)._

---

_Regelmäßig aktualisieren — veraltete Daten begrenzen Claudes Nützlichkeit als analytischer Partner._
