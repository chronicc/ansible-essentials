---
title: Ansible Inventory
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

# Cheatsheet: ansible-inventory

Die Ansible Inventory Informationen anzeigen lassen.

Siehe auch: https://docs.ansible.com/ansible/latest/cli/ansible-inventory.html

### Kommandozeile

```shell
ansible-inventory -i INVENTORY [--host HOST] [--graph] [--list]
```

### Beispiele

Die Informationen zu allen Managed Nodes anzeigen lassen:

```shell
ansible-inventory -i hosts --list
```

Die Informationen der Managed Node 'dc1' anzeigen lassen:

```shell
ansible-inventory -i hosts --host dc1
```

Die bekannten Managed Nodes als Graph anzeigen lassen:

```shell
ansible-inventory -i hosts --graph
```

### Optionen

| Option | Effekt |
|---|---|
| `-v` bis `-vvvvv` | Zeige mehr Informationen bei der Ausgabe. Kann bis zu 5 mal übergeben werden um die Menge zu kontrollieren.
| `--yaml` | Als Ausgabeformat YAML nutzen. Default ist JSON. |
| `--toml` | Als Ausgabeformat TOML nutzen. Default ist JSON. |
| `-C` / `--check` | Zeige nur welche Änderungen ausgeführt würden. |
| `-D` / `--diff` | Zeige die Differenz bei Dateiänderungen. |
| `-J` / `--ask-vault-pass` | Frage vor der Ausführung nach dem Vault Passwort.
| `-i` / `--inventory INVENTORY` | Pfad zum Inventory. |
| `-l` / `--limit PATTERN` | Filter um die Liste der angesprochenen Managed Nodes einzuschränken. |
| `-e` / `--extra-vars 'key=value ...'` | Extra Variablen, die an Ansible übergeben werden. |
| `--output FILE` | Die Ausgabe in einer Datei abspeichern. |
