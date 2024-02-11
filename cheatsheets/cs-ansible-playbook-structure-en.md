---
title: Ansible Playbook Structur
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

# Cheatsheet: Ansible Playbook Structur

Playbooks are an ordered list of tasks. Tasks control the parametrized execution of modules.

```yaml
---
- name: The name of the playbook. Will be shown during execution.
  hosts: all # Group or Host on which the playbook is run
  gather_facts: true # Collect node facts
  become: true # Escalate permissions
  vars:
    example_variable: Hello World
    example_list:
      - One
      - Two
      - Three

  tasks:
    - name: Name of the task. Will be shown during execution.
      ansible.builtin.debug: # Full path of the ansible module
        var: example_variable
      when: example_variable != "" # Control Structure: Condition

    - name: Example of a loop
      ansible.builtin.debug:
        var: "{{ item }}"
      loop: "{{ example_list }}" # Control Structure: Loop

    - name: Include a role
      ansible.builtin.include_role:
        name: my.role

  handlers:
    - name: Handlers will be executed at the end of a play when an event has been fired.
      ansible.builtin.reboot:
        reboot_timeout: 3600
      listen: reboot node # Eventname

```
