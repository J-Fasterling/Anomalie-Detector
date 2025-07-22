# Predictive-Maintenance Digital-Twin RL

## Projekt-Pitch
Dieses Repository demonstriert ein KI-gestütztes Predictive-Maintenance-Showcase, das Ausfälle vorhersagt, einen physikbasierten Digital-Twin simuliert und per Reinforcement Learning den Betrieb optimiert. Es liefert reproduzierbare Pipelines, nachvollziehbare Metriken und eine sofort nutzbare Demo.

## Badges
[![Build](https://github.com/J-Fasterling/Anomalie-Detector/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/J-Fasterling/Anomalie-Detector/actions/workflows/ci.yml)
[![License](https://img.shields.io/badge/license-MIT-blue)](TODO)

## Projektstruktur
```text
.
├── data
│   ├── processed
│   └── raw
├── deploy
├── docs
├── notebooks
├── README.md
├── SCOPE.md
├── scripts
│   └── __init__.py
├── src
│   ├── __init__.py
│   ├── ml
│   │   └── __init__.py
│   ├── rl
│   │   └── __init__.py
│   ├── stream
│   │   └── __init__.py
│   └── twin
│       └── __init__.py
└── tests
    └── __init__.py
```

## Roadmap
```mermaid
flowchart LR
    W0[W0: Kickoff] --> W1[W1: Data Pipeline]
    W1 --> W2[W2: Twin Prototype]
    W2 --> W3[W3: Twin Validation]
    W3 --> W4[W4: RUL Model]
    W4 --> W5[W5: RL Training]
    W5 --> W6[W6: Integration & Docker]
    W6 --> W7[W7: Demo & Docs]
    W7 --> W8[W8: Launch]
```

## Quickstart
- **Klonen & Wechseln:**  
  `git clone https://github.com/J-Fasterling/Anomalie-Detector.git && cd Anomalie-Detector`
- **Einrichten & Demo starten:**  
  `./scripts/setup_repo.sh`  # installiert Abhängigkeiten, lädt Daten, baut Container
- **CI prüfen:** Commit pushen oder PR öffnen – Badge oben muss grün sein