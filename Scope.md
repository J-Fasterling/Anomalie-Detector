# SCOPE.md

## Projekt in einem Satz
Ein **KI-gestütztes Predictive-Maintenance-System** mit Digital-Twin und Reinforcement-Learning-Optimierer, das reale Aero-/Auto-/Space-Sensordaten nutzt, Ausfälle vorhersagt und den Betrieb simulativ verbessert.

## Ziele (SMART)
- **RUL-Vorhersage:** MAE ≤ 20 % für kritische Komponenten.
- **Physikbasierter Digital-Twin:** Sensorabweichung < 5 % (MAPE).
- **RL-Agent:** Betriebseffizienz ≥ 5 % (Kraftstoff / Verschleiß).

## Definition of Done (DoD)
| Kriterium | Messgröße |
|-----------|-----------|
| GitHub-Repo öffentlich, strukturiert, CI-grün | README, Build-Badge ✔ |
| Datensätze versioniert (DVC) & Loader-Tests | pytest > 90 % pass |
| ML-Modell (ONNX) mit MAE-Ziel erreicht | MLflow Run validiert |
| Digital-Twin (Gym-Env) ≤ 5 % MAPE | Val-Report im Repo |
| RL-Policy verbessert Reward ≥ 5 % | TensorBoard-Kurve |
| Docker-Compose-Demo: Streaming-Inference + Grafana | `docker compose up` läuft ohne Fehler |
| 90-Sek-Demo-Video + LinkedIn-Post-Text | `/docs/demo.mp4`, `/docs/post.md` |

## Hauptrisiken & Mitigation
| Risiko | Auswirkung | Gegenmaßnahme |
|--------|------------|---------------|
| Datensatz zu groß (N-CMAPSS ≈ 50 GB) | Speicher/Zeit frisst Projekt | Nur Teilsets laden; DVC-pull selective |
| Twin mismatch > 5 % | RL lernt falsches Modell | Physik-Parameter kalibrieren, Sensitivitäts-Analyse |
| RL-Training instabil | Keine Performance-Verbesserung | Reward-Normalisierung, Curriculum Learning |
| Edge-HW nicht verfügbar | Kein Real-Benchmark | Cloud GPU simulieren, später Jetson-Test nachholen |
| Zeitknappheit | Roadmap rutscht | Wöchentliche Milestone-Checks, Features strikt nach DoD |

## Out-of-Scope
- Proprietäre Legacy-Systemintegration
- Hardware-Schnittstellen jenseits Standard-Sensor-Protokolle
- Produktivbetrieb (dies bleibt ein Showcase)

## Timeline (High-Level)
1. **Setup & Data Pipeline** (Woche 1–2)  
2. **Digital-Twin & Validation** (Woche 3–4)  
3. **RUL-Modell & MLflow** (Woche 5–6)  
4. **RL-Optimierung** (Woche 7–8)  
5. **Demo-Packaging & Kommunikation** (Woche 9)  

## Kontakt
| Rolle | Name | E-Mail | GitHub | LinkedIn |
|-------|------|--------|--------|----------|
| Projektleitung | Jonas Fasterling | jonas@fasterling.de | @jfasterl | linkedin.com/in/jonas-fasterling |