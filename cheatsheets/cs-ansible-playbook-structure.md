---
title: Ansible Playbook Struktur
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

# Cheatsheet: Ansible Playbook Struktur

Playbooks sind eine Aneinanderreihung von Tasks. Tasks steuern die parametrisierte Ausführung von Modulen.

```yaml
---
- name: Der Name des Playbooks. Wird bei der Ausführung angezeigt.
  hosts: all # Gruppe oder Host auf den dieses Playbook ausgeführt wird
  gather_facts: true # Node Fakten sammeln
  become: true # Berechtigung eskalieren
  vars:
    example_variable: Hello World
    example_list:
      - Eins
      - Zwei
      - Drei

  tasks:
    - name: Name des Tasks. Wird bei der Ausführung angezeigt.
      ansible.builtin.debug: # Voller Pfad des Ansible Moduls
        var: example_variable
      when: example_variable != "" # Kontrollstruktur: Bedingung

    - name: Beispiel einer Schleife
      ansible.builtin.debug:
        var: "{{ item }}"
      loop: "{{ example_list }}" # Kontrollstruktur: Schleife

    - name: Eine Rolle inkludieren
      ansible.builtin.include_role:
        name: my.role

  handlers:
    - name: Handlers werden am Ende eines Plays ausgeführt, wenn ein Event ausgelöst wurde.
      ansible.builtin.reboot:
        reboot_timeout: 3600
      listen: reboot node # Eventname

```
