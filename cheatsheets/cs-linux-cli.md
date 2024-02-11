---
title: Linux Kommandozeile
linestretch: 1.0
disable-header-and-footer: true
listings-disable-line-numbers: true
table-use-row-colors: true
geometry:
  - top=1cm
  - bottom=1cm
  - left=1in
  - right=1in
---

# Cheatsheet: Linux Kommandozeile

Grundlegende Operationen auf der Linux Kommandozeile.

### Kommandos

| Kommando | Effekt |
|---|---|
| `cd [PFAD]` | Wechseln in ein Verzeichnis. |
| `ls [PFAD]` | Auflisten der Inhalte in einem Verzeichnis. |
| `rm PFAD` | Löschen einer Datei unter dem angegebenen Pfad. |
| `pwd` | Zeigt das aktuelle Verzeichnis an. |
| `cat PFAD` | Gibt den Inhalt einer Datei aus. |
| `make TARGET` | Das Target einer Makefile ausführen. |
| `nano PFAD` | Eine Datei mit dem Texteditor nano öffnen. |
| `source PFAD` | Eine Datei in die Shell laden. |
| `python PFAD` | Eine Datei mit dem Interpreter der Programmiersprache Python ausführen. |
| `pip` | Der Paketmanager der Programmiersprache Python. |
| `ssh` | Zu entfernten Linux Machinen eine Verbindung herstellen. |

### Beispiele

- In das eigene HOME Verzeichnis wechseln: `cd`
- In das Verzeichnis /etc wechseln: `cd /etc`
- Eine Verzeichnisebene höher gehen: `cd ..`
- Die Dateien des aktuellen Verzeichnises ausgeben: `ls`
- Die Dateien des aktuellen Verzeichnises als Liste ausgeben: `ls -l`
- Die Dateien des aktuellen Verzeichnis ausgeben inklusive verstecker Dateien: `ls -a`
- Die Dateien von /etc ausgeben: `ls /etc`
- Den Inhalt der Datei /etc/resolv.conf anzeigen: `cat /etc/resolv.conf`
- Die Datei /etc/resolv.conf löschen: `rm /etc/resolv.conf`
- Das init Target einer Makefile ausführen: `make init`
- Eine virtuelle Umgebung laden:
  ```
  source ./venv/bin/activate
  ```
- Die Abhängigkeiten eines Pythonprojekts installieren:
  ```
  pip install -r requirements.txt
  ```
- Die installierten Abhängigkeiten eines Pythonprojekts anzeigen:
  ```
  pip freeze
  ```
- Ein SSH Zertifikate erzeugen:
  ```
  ssh-keygen -t rsa -b 4096
  ```
