---
marp: true
theme: gaia
---
<style>
img[alt~="center"] {
  display: block;
  margin: 0 auto;
}
</style>

|
|
|
|

# Ansible Grundlagen

|
|
|
|

---

## Intension und Zielgruppe

- Verständnis schaffen wie mit Ansible technische Prozesse automatisiert werden können
- Befähigung zur Selbsthilfe durch vorhandene Dokumentation

Zielgruppe sind Menschen, die noch nicht oder sehr wenig mit Ansible gearbeitet haben.

---

## Inhalt



---

## Was ist Ansible

Ansible ist eine Automatisierungs-Engine für IT Prozesse.

Es bietet Möglichkeiten für

- Provisionierung
- Konfigurationsmanagement
- Anwendungsbereitstellung
- Orchestrierung

---

## Architektur: Agentless

![width:800px center]()

---

## Architektur: Verbindung

![width:800px center]()

---

## Inventories

Inventories werden verwendet um Nodes für Ansible bekannt zu machen und zu klassifizieren und konfigurieren (i.d.R. Verbindungsparameter).

Es gibt **statische** und **dynamische** Inventories.

#### > Live-Übung

Wir erstellen das Inventory.

---

## Ad-hoc Befehle

Ansible bietet Ad-hoc Befehle um Nodes ohne Playbooks zu steuern oder den Status abzufragen. Diese Befehle werden mit `ansible -m <module> <filter>` ausgeführt.

#### Beispiel

```
$ ansible -i inventory/hosts -m ansible.builtin.ping all
$ ansible -i inventory/hosts -m ansible.builtin.ping linux
$ ansible -i inventory/hosts -m ansible.builtin.win_ping windows
```

---

## Node Fakten abfragen

Ansible stellt eine Liste von Fakten zur Verfügung, die auf jeder Node gesammelt werden. Fakten werden mit dem Modul `ansible.builtin.setup` abgefragt.

#### Beispiel

```
$ ansible -i inventory/hosts -m ansible.builtin.setup windows1
$ ansible -i inventory/hosts -m ansible.builtin.setup linux1
```

---

## Architektur: Modules, Tasks and Playbooks

![width:800px center]()

<small>https://docs.ansible.com/ansible/2.9/modules/list_of_all_modules.html</small>

---

## YAML

YAML ist eine Datenserialisierungssprache mit deren Hilfe man Informationen strukturiert abbilden kann. Sie wird oft als Konfigurationssprache verwendet.

```yaml
---
key: value
list:
  - entry
  - entry
dict:
  key: value
  key: value
```

---

## Benutzerrechte eskalieren

Ansible Playbooks und Tasks bieten die Möglichkeit  Benutzerrechte zu eskalieren.

`become: true|false`

```yaml
---
- name: Beispiel für Benutzerrechteeskalation
  hosts: all
  become: true
  ...
```

---

## Installieren eines Programms

#### > Live-Übung

Wir installieren git auf einer Linux Node.

---

## Variablen in Ansible

Tasks können mit Variablen so angepasst werden, dass die für verschiedene Szenarien wieder verwendet werden können.

Variablen werden mit der Syntax `"{{ variable_name}}"` verwendet.

#### Beispiel

```yaml
    - name: Task mit Variable
      ansible.builtin.file:
        path: "{{ dir_path }}"
        mode: '0644'
        state: directory
```

---

## Variablen in Ansible

Variablen können u.a. in einem Playbook definiert werden.

#### Beispiel

```yaml
- name: Beispielplaybook mit Variablendefinition
  hosts: all
  vars:
    dir_path: /etc/ssh
  tasks:
    - name: Task mit Variable
      ansible.builtin.file:
        path: "{{ dir_path }}"
        mode: '0644'
        state: directory
```

---

## Variablen in Ansible

Mit dem Modul `ansible.builtin.set_fact` können Variablen auch während eines Plays gesetzt werden.

#### Beispiel

```yaml
    - name: Setzen einer Variable im Play
      ansible.builtin.set_fact:
        dir_path: /etc/ssh
```

---

## Installieren eines Programms

Wir installieren 7zip auf einer Windows Node.

#### > Live-Übung

---

## Ansible konfigurieren

Ansible kann an die eigenen Bedürfnisse angepasst werden mit Hilfe der `ansible.cfg` Datei auf der root-Ebene des Git Repositories.

#### > Live-Übung

Wir erstellen die `ansible.cfg` und füllen sie mit Werten.

---

## Gruppen Variablen

Im Inventory können Variablen spezifisch für Gruppen angelegt werden.

Jede Node, die sich im Inventory befindet, ist automatisch Teil der Gruppe `all`.

#### > Live-Übung

Wir erweitern das Inventory mit Gruppen Variablen.

---

## Sichere Variablen mit Vaults

Ansible bietet Vaults an um vertrauliche Variablen sicher zu speichern. Vaults werden mit `ansible-vault` verwaltet.

#### > Live-Übung

Wir erzeugen einen Vault und konfigurieren Ansible diesen zu benutzen.

---

## Jinja

Jinja ist eine Templatingengine welche von Ansible benutzt wird um Variablen und Templates zu verarbeiten.

- `{% ... %}` for Statements
- `{{ ... }}` for Expressions to print to the template output
- `{# ... #}` for Comments not included in the template output

```jinja2
<ul id="navigation">
    {% for item in navigation %}
        <li><a href="{{ item.href }}">{{ item.caption }}</a></li>
    {% endfor %}
</ul>
```

---

## Filter

In Ansible werden Jinja Filter verwendet um Variablen während des Plays anzupassen.

#### Beispiel

```yaml
    - name: Variablennutzung mit Filter
      ansible.builtin.file:
        path: "{{ dir_path | default('/tmp/ssh') }}"
        mode: '0644'
        state: directory
```

---

## Schleifen in Ansible

Schleifen werden in Ansible mit dem Keyword `loop` angewendet. Es kann über Listen und Dictionaries iterieren.

#### Beispiel

```yaml
    - name: Task mit einer Schleife
      ansible.builtin.file:
        path: "{{ item.path }}"
        mode: '0644'
        state: directory
      loop:
        - /etc/ssh
        - /etc/apt
```

---

## Anlegen von Benutzern

#### > Live-Übung

Wir erzeugen Gruppen und Benutzer auf Linux und Windows Nodes.

---

## Aufsetzen eines Webservers

#### > Live-Übung

Wir installieren und konfigurieren einen Webserver auf Linux inklusive der Webseiten.

---
