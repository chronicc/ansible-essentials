---
title: Ansible Galaxy
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

# Cheatsheet: ansible-galaxy

Neue Rollen oder Collections erzeugen oder aus der Galaxy installieren.

Siehe auch: https://docs.ansible.com/ansible/latest/cli/ansible-galaxy.html

### Kommandozeile

```shell
ansible-galaxy {install,role,collection}
```

### Beispiele

Eine Collection aus der Galaxy installieren:

```shell
ansible-galaxy collection install microsoft.ad
```

Alle Rollen und Collections eines Projekts installieren:

```shell
ansible-galaxy install -r requirements.yml
```

Eine neue Rolle erzeugen:

```shell
ansible-galaxy role init my.custom-role
```

### Argumente

| Argument | Effekt |
|---|---|
| `install` | Abhängigkeiten aus einer Datei installieren. |
| `collection init` | Eine neue Collection erzeugen. |
| `collection install` | Eine Collection aus der Ansible Galaxy installieren. |
| `collection list` | Alle installierten Collections anzeigen. |
| `role init` | Eine neue Rolle erzeugen. |
| `role remove` | Eine Rolle vom lokalen System entfernen. |
| `role list` | Alle installierten Rollen anzeigen. |
| `role install` | Eine Rolle aus der Ansible Galaxy installieren. |


### Optionen

| Option | Effekt |
|---|---|
| `-h` | Die Hilfe anzeigen. |
| `--version` | Die Version anzeigen. |
| `-v` bis `-vvvvv` | Zeige mehr Informationen bei der Ausgabe. Kann bis zu 5 mal übergeben werden um die Menge zu kontrollieren.
| `-r` / `--requirements-file` | Eine Datei in der Rollen und Collections definiert sind. |
| `-c` / `--ignore-certs` | SSL Zertifikate beim Download ignorieren. Nützlich hinter einem Proxy. |
