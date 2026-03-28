# Hetzner Server-Empfehlung für SPX-Handelssystem

> Recherche: Welcher Hetzner Dedicated Server für das gesamte Projekt?
> Stand: März 2026 (Preiserhöhung ab 1. April 2026!)

---

## Projektanforderungen

| Anforderung | Gewicht | Begründung |
|---|---|---|
| Viele CPU-Kerne | KRITISCH | 554 Mio. simulierte Trades, Brute-Force Sweeps mit Numba JIT |
| Viel RAM | HOCH | Große Datasets in-memory, DuckDB, Parquet |
| Schnelle NVMe | HOCH | Parquet I/O, DuckDB |
| Stabile Uptime | HOCH | Live-Trading 24/5 |
| GPU (optional) | MITTEL | ML-Training, lokale LLMs (Ollama) |

---

## Relevante Hetzner Dedicated Server

### AX-Linie (AMD)

| Modell | CPU | Kerne/Threads | RAM | Storage | Preis/Monat |
|---|---|---|---|---|---|
| AX41-NVMe | Ryzen 5 3600 | 6C/12T | 64 GB DDR4 | 2x 512 GB NVMe | ~50 € |
| AX42-U | Ryzen 7 PRO 8700GE | 8C/16T | 64 GB DDR5 | 2x 512 GB NVMe | ~57 € |
| **AX102-U** | **Ryzen 9 7950X3D** | **16C/32T** | **128 GB DDR5** | **2x 1.92 TB NVMe** | **~109 €** |
| **AX162-R** | **EPYC 9454P** | **48C/96T** | **256 GB DDR5 ECC** | **2x 3.84 TB NVMe** | **~209 €** |

### GPU Server

| Modell | GPU | VRAM | CPU | RAM | Preis/Monat |
|---|---|---|---|---|---|
| GEX44 | NVIDIA RTX 4000 SFF Ada | 20 GB GDDR6 | i5-13500 (14C) | 64 GB DDR4 | ~184 € |
| GEX131 | NVIDIA RTX PRO 6000 Blackwell | 96 GB GDDR7 | Xeon Gold 5412U (24C) | 256 GB DDR5 ECC | ~889 € |

### Cloud Server (zum Vergleich)

| Modell | vCPU | RAM | Storage | Preis/Monat |
|---|---|---|---|---|
| CCX53 | 32 | 128 GB | 600 GB | ~192 € |
| CCX63 | 48 | 192 GB | 960 GB | ~288 € |

Alle Preise netto, zzgl. MwSt.

---

## Empfehlung

### IDEAL: AX162-R (~209 €/Monat)

**AMD EPYC 9454P | 48 Kerne / 96 Threads | 256 GB DDR5 ECC | 2x 3.84 TB NVMe**

Warum genau dieser:
- **48 Kerne** — Brute-Force-Sweep (554 Mio. Trades) braucht massive Parallelität
- **256 GB ECC RAM** — DuckDB, Datasets, Trading Bot, Jupyter parallel
- **7.68 TB NVMe** — Jahre historischer Optionsdaten
- **ECC RAM** — kritisch für ein System das echtes Geld handelt
- **Server-Plattform** — designed für 24/7-Betrieb (Live-Trading)
- **Setup:** 79 € einmalig
- **Günstiger als Cloud:** CCX63 (48 vCPU) kostet 288 € mit weniger RAM und Storage

### MINIMAL: AX102-U (~109 €/Monat)

**Ryzen 9 7950X3D | 16 Kerne / 32 Threads | 128 GB DDR5 | 2x 1.92 TB NVMe**

- Beste Single-Core-Performance (gut für Numba JIT, 3D V-Cache)
- Sweeps dauern ~3x länger als AX162-R
- Kein ECC RAM
- Guter Einstieg, später upgraden möglich

---

## GPU-Strategie

Erstmal **nicht nötig**:
- scikit-learn läuft auf CPU
- Ollama kann 7B-Modelle auf 48 Kernen + 256 GB RAM auch ohne GPU
- Falls später nötig: GEX44 (184 €/Monat) als zweiten Server dazunehmen
- Alternativ: Hetzner Server Auction nach günstigen GPU-Servern schauen

---

## Vergleich

| | AX102-U | **AX162-R** | Cloud CCX63 |
|---|---|---|---|
| Kerne | 16 | **48** | 48 (vCPU) |
| RAM | 128 GB | **256 GB ECC** | 192 GB |
| Storage | 3.84 TB | **7.68 TB** | 960 GB |
| Preis/Monat | ~109 € | **~209 €** | ~288 € |
| ECC | Nein | **Ja** | Nein |
| Setup | ~269 € | **~79 €** | 0 € |

---

## Wichtig: Preiserhöhung ab 1. April 2026

Hetzner erhöht Preise um 20-37%. Bestellung vor April sichert aktuelle Preise.

---

## Quellen

- [Hetzner AX-Linie](https://www.hetzner.com/dedicated-rootserver/matrix-ax/)
- [Hetzner GPU-Linie](https://www.hetzner.com/dedicated-rootserver/matrix-gpu/)
- [Hetzner Cloud](https://www.hetzner.com/cloud/general-purpose)
- [Hetzner Preisanpassung](https://docs.hetzner.com/general/infrastructure-and-availability/price-adjustment/)
- [Hetzner Server Auction](https://www.hetzner.com/sb/)

---

_Erstellt: 2026-03-27_
