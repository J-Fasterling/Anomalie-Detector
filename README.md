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
│   └── setup_repo.sh
├── src
│   ├── __init__.py
│   ├── ml/     …
│   ├── rl/     …
│   ├── stream/     …
│   └── twin/     …
└── tests
    └── __init__.py
```

## Roadmap
```mermaid
gantt
    title 8-Wochen-Roadmap
    dateFormat  YYYY-MM-DD
    axisFormat  %W   %% Kalenderwoche
    section Sprints
    Kickoff                :milestone, 2025-07-22, 0d
    Data Pipeline          :active,  2025-07-23, 7d
    Twin Prototype         :         2025-07-30, 7d
    Twin Validation        :         2025-08-06, 7d
    RUL Model              :         2025-08-13, 7d
    RL Training            :         2025-08-20, 7d
    Integration & Docker   :         2025-08-27, 7d
    Demo & Docs            :         2025-09-03, 7d
    Launch                 :milestone, 2025-09-10, 0d
```

## Quickstart
- **Klonen & Wechseln:**  
  `git clone https://github.com/J-Fasterling/Anomalie-Detector.git && cd Anomalie-Detector`
- **Einrichten & Demo starten:**  
  `./scripts/setup_repo.sh`  # installiert Abhängigkeiten, lädt Daten, baut Container
- **CI prüfen:** Commit pushen oder PR öffnen – Badge oben muss grün sein