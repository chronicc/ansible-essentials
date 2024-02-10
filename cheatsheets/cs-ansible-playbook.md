---
title: Ansible Playbook
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

# Cheatsheet: ansible-playbook

Ein Playbook gegen einen oder mehrere Managed Nodes ausführen.

Siehe auch: https://docs.ansible.com/ansible/latest/cli/ansible-playbook.html

### Kommandozeile

```shell
ansible-playbook -i INVENTORY playbook [playbook ...]
```

### Beispiele

Ein Playbook gegen alle Managed Nodes in der Linux Gruppe ausführen:

```shell
ansible-playbook -i hosts -l linux playbooks/bootstrap.yml
```

Nur Konfigurationstasks gegen die Managed Node 'dc1' ausführen:

```shell
ansible-playbook -i hosts -l dc1 -t config playbooks/setup-dcs.yml
```

### Argumente

| Argument | Effekt |
|---|---|
| `playbook` | Pfad zum auszuführenden Playbooks. Es können mehrere Playbooks ausgeführt werden. |

### Optionen

| Option | Effekt |
|---|---|
| `-v` bis `-vvvvv` | Zeige mehr Informationen bei der Ausgabe. Kann bis zu 5 mal übergeben werden um die Menge zu kontrollieren.
| `-C` / `--check` | Zeige nur welche Änderungen ausgeführt würden. |
| `-D` / `--diff` | Zeige die Differenz bei Dateiänderungen. |
| `-J` / `--ask-vault-pass` | Frage vor der Ausführung nach dem Vault Passwort.
| `-i` / `--inventory INVENTORY` | Pfad zum Inventory. |
| `-l` / `--limit PATTERN` | Filter um die Liste der angesprochenen Managed Nodes einzuschränken. |
| `-t` / `--tags tag1,tag2` | Filter um die Liste der ausgeführten Tasks einzuschränken. |
| `-e` / `--extra-vars 'key=value ...'` | Extra Variablen, die an Ansible übergeben werden. |
