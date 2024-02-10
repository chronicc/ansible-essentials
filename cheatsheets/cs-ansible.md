---
title: Ansible
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

# Cheatsheet: ansible

Ein ad-hoc Kommando gegen einen oder mehrere Managed Nodes ausführen.

Siehe auch: https://docs.ansible.com/ansible/latest/cli/ansible.html

### Kommandozeile

```shell
ansible -i INVENTORY -m MODULE pattern
```

### Beispiele

Die Verbindung und Authentifizierung aller Managed Nodes testen:

```shell
ansible -i hosts -m ansible.builtin.ping all
```

Die Ansible Fakten von der Managed Node 'dc1' anzeigen:

```shell
ansible -i hosts -m ansible.builtin.setup dc1
```

Eine Datei auf der Managed Node 'webserver1' löschen:

```shell
ansible -i hosts -m ansible.builtin.file -a 'path=/root/log.txt state=absent' webserver1
```

### Argumente

| Argument | Effekt |
|---|---|
| `pattern` | Filter um die Liste der angesprochenen Managed Nodes einzuschränken. |

### Optionen

| Option | Effekt |
|---|---|
| `-v` bis `-vvvvv` | Zeige mehr Informationen bei der Ausgabe. Kann bis zu 5 mal übergeben werden um die Menge zu kontrollieren.
| `-C` / `--check` | Zeige nur welche Änderungen ausgeführt würden. |
| `-D` / `--diff` | Zeige die Differenz bei Dateiänderungen. |
| `-J` / `--ask-vault-pass` | Frage vor der Ausführung nach dem Vault Passwort.
| `-i` / `--inventory INVENTORY` | Pfad zum Inventory. |
| `-m` / `--module-path MODULE` | Pfad und Name des anzuwendenden Moduls |
| `-a` / `--args 'key=value ...'` | Liste von Parametern, die an das Modul übergeben werden. |
| `-e` / `--extra-vars 'key=value ...'` | Extra Variablen, die an Ansible übergeben werden. |
