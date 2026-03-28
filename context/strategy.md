# Strategie

> Diese Datei beschreibt aktuelle strategische Prioritäten — jährlich, quartalsweise oder projektbasiert. Claude liest sie, um zu verstehen, worauf du hinarbeitest, damit er als Denkpartner agieren kann, der auf deine Ziele ausgerichtet ist.

---

## Wie das zusammenhängt

- **business-info.md** liefert den organisatorischen Kontext
- **personal-info.md** definiert deine Rolle und Verantwortlichkeiten
- **Diese Datei** beschreibt, wie Erfolg aktuell aussieht
- **current-data.md** trackt den Fortschritt gegenüber diesen Prioritäten

---

## Übergeordnetes Ziel

Ein produktionsreifes, vollautomatisches SPX-Handelssystem aufbauen — von der Datensammlung bis zum Live-Trading.

## Aktueller Fokuszeitraum

2026 — Neuaufbau des Systems, schrittweise Umsetzung der Komponenten

## Strategische Prioritäten (in Reihenfolge)

1. **Systemverständnis aufbauen** — Referenzarchitektur verstehen, eigene Architektur definieren
2. **Data Pipeline** — ThetaData-Integration, Storage-Schema, Download-Automation
3. **Backtest Engine** — Numba-Kernels, Kostenmodell, Validierung gegen Referenz
4. **Sweep & Analyse** — Parametersuche, Walk-Forward, FDR-Filter
5. **Trading Bot** — Safety Architecture, IB TWS Integration, Notifications
6. **Track-Record** — Live-Betrieb starten, PnL dokumentieren

## Designprinzipien

- **Realismus vor Performance:** Simulation muss echte Kosten & Slippage abbilden
- **Overfitting-Schutz:** Walk-Forward und Out-of-Sample-Tests sind Pflicht
- **Safety first:** Kein Trade ohne vollständige Sicherheitsarchitektur
- **Alles dokumentieren:** Entscheidungen, Fehler, Hypothesen festhalten

## Wie Erfolg aussieht

- Eigene Backtest Engine liefert Ergebnisse, die gegen Referenzsystem validiert sind
- Data Pipeline läuft automatisch und liefert saubere historische Optionsdaten
- Trading Bot handelt live mit vollständiger Safety Architecture
- Track-Record dokumentiert und nachvollziehbar

## Schlüsselentscheidungen oder offene Fragen

- Slippage-Modellierung bei Regime-Shifts
- Datenqualität (Forward-Fill-Anteil)
- OHLC vs. Tick-Level für Stop-Loss-Validierung

---

_Aktualisiere dies, wenn sich Prioritäten verschieben. Claude nutzt dies, um die Arbeit in die richtige Richtung zu lenken._
