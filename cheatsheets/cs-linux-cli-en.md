---
title: Linux Commandline
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

# Cheatsheet: Linux Commandline

Basic operation on the Linux commandline.

### Commandos

| Commando | Effect |
|---|---|
| `cd [PATH]` | Change into a directory. |
| `ls [PATH]` | List the contents of a directory. |
| `rm PATH` | Delete a file on the specified path. |
| `pwd` | Shows the current working directory. |
| `cat PATH` | Shows the content of a file. |
| `make TARGET` | Runs a target of a Makefile. |
| `nano PATH` | Opens a file with the text editor nano. |
| `source PATH` | Loads a file into the shell. |
| `python PATH` | Runs a file with the interpreter of the programming language python. |
| `pip` | The package manager of the programming language python. |
| `ssh` | Connect to remote linux machines via this program. |

### Examples

- Change into your own home directory: `cd`
- Change into the directory /etc: `cd /etc`
- Go up one directory level: `cd ..`
- Show the contents of the current directory: `ls`
- Show the contents of the current directory in list format: `ls -l`
- Show the contents of the current directory including hidden files: `ls -a`
- Show the contents of the /etc: `ls /etc`
- Show the content of the file /etc/resolv.conf: `cat /etc/resolv.conf`
- Delete the file /etc/resolv.conf: `rm /etc/resolv.conf`
- Run the init target of a Makefile: `make init`
- Load up a virtual environment:
  ```
  source ./venv/bin/activate
  ```
- Install the dependencies of a python project:
  ```
  pip install -r requirements.txt
  ```
- Show the installed dependencies of a python project:
  ```
  pip freeze
  ```
- Create a ssh certificate:
  ```
  ssh-keygen -t rsa -b 4096
  ```
