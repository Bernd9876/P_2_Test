# Business-Informationen

> Diese Datei liefert Hintergrund zur Organisation oder zum Business, in dem du arbeitest. Sie schafft die Grundlage, um deine Rolle (personal-info.md) und strategischen Prioritäten (strategy.md) zu verstehen.

---

## Wie das zusammenhängt

- **Diese Datei** liefert den organisatorischen Kontext
- **personal-info.md** definiert deine Rolle darin
- **strategy.md** beschreibt die Ziele, auf die du hinarbeitest
- **current-data.md** trackt den Fortschritt und informiert Entscheidungen

---

## Überblick zur Organisation

Eigenes Börsen-Trading-Unternehmen, das sich auf automatisierten Optionshandel spezialisiert hat. Das Unternehmen bedient ausschließlich den eigenen Handel — kein Drittkundengeschäft. Mission: vollautomatisiertes Trading-System aufbauen, das auf Basis eigener Backtests und KI-gestützter Analyse eigenständig handelt.

## Produkte / Dienstleistungen / Schwerpunkte

- **Optionshandel** — Schwerpunkt SPX 0-DTE Credit Spreads (CALL + PUT), perspektivisch Iron Condors, Debit Spreads
- **Trade Automation Tool (TAT)** — eigens entwickeltes Tool zur automatisierten Orderweiterleitung an Interactive Brokers
- **Strategie-Entwicklung** — Strategiefindung über Option Omega + automatisiertes Backtesting
- **KI-Integration** — Ziel: eigene Backtests mit eigenen Daten, vollautomatisiert über KI

## Zielarchitektur (Kernkomponenten)

| Komponente | Beschreibung |
|---|---|
| **Data Pipeline** | Historische Optionsdaten (ThetaData o.ä.), Parquet/DuckDB Storage |
| **Backtest Engine** | Hochperformante Simulation (Numba JIT), realistische Kostenmodelle |
| **Sweep & Analyse** | Brute-Force-Parametersuche, Walk-Forward-Validierung, Overfitting-Schutz |
| **Trading Bot** | Vollautomatischer Live-Handel, Multi-Layer Safety Architecture |
| **Wissensdatenbank** | Dokumentation aller Entscheidungen, Bugs, Lessons Learned |

## Wichtiger Kontext

- **Underlying:** S&P 500 Index (SPX)
- **Broker:** Interactive Brokers (TWS API, Combo/BAG Orders)
- **Tools:** Trade Automation Tool (TAT), Option Omega, automatisiertes Backtesting
- **Aktiv an der Börse seit:** 2016
- **Teamgröße:** 1 Person (Bernd) + 1 externer Partner (KI-Entwickler, bereits aktiv programmierend)
- **Projektstatus:** Neuaufbau — Referenzsystem existiert beim Partner, eigene Implementierung in Entwicklung
- **Phase:** Trading-Seite weit fortgeschritten und automatisiert; KI-Integration noch am Anfang
- **KI-Stand:** Partner bringt KI-Expertise; Bernd selbst noch auf Level 0 in KI — Lernphase läuft

---

_Halte dies auf hohem Niveau — genug um Claude zu orientieren, kein umfassendes Unternehmens-Wiki._
