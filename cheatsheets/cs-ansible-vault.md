---
title: Ansible Vault
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

# Cheatsheet: ansible-vault

Vault Dateien ver- oder entschlüsseln oder einzelne Variablen verschlüsseln.

Siehe auch https://docs.ansible.com/ansible/latest/cli/ansible-vault.html.

### Kommandozeile

```shell
ansible-vault {create,decrypt,edit,view,encrypt,encrypt_string,rekey}
```

### Beispiele

Den Wert einer Variable verschlüsseln:

```shell
ansible-vault encrypt_string 'P4ssword!' --name password --ask-vault-pass
```

Eine Vault Datei verschlüsseln:

```shell
ansible-vault encrypt inventory/group_vars/all/vault.yml --ask-vault-pass
```

Eine Vault Datei entschlüsseln:

```shell
ansible-vault decrypt inventory/group_vars/all/vault.yml --ask-vault-pass
```

### Argumente

| Argument | Effekt |
|---|---|
| `create` | Eine neue Vault Datei erzeugen. |
| `decrypt` | Eine Vault Datei entschlüsseln. |
| `edit` | Eine Vault Datei mit dem Standarteditor anpassen. |
| `view` | Den Inhalt einer Vault Datei auf der Kommandozeile ausgeben. |
| `encrypt` | Eine Vault Datei verschlüsseln. |
| `encrypt_string` | Den Wert einer Variable verschlüsseln. |
| `rekey` | Das Vault Passwort einer Vault Datei ändern. |

### Optionen

| Option | Effekt |
|---|---|
| `-v` bis `-vvvvv` | Zeige mehr Informationen bei der Ausgabe. Kann bis zu 5 mal übergeben werden um die Menge zu kontrollieren. |
| `-J` / `--ask-vault-pass` | Frage vor der Ausführung nach dem Vault Passwort. |
