---
title: Getting Started
description: An overview of how to get started with Install Doctor
sidebar_label: Getting Started
slug: /getting-started
---

Install Doctor is designed to be incredibly easy to use. It can provision your entire operating system with a one-liner. It supports Archlinux, CentOS, Debian, Fedora, macOS, Qubes, and Windows. It can also be easily adapted to run on other operating systems. Pull requests are welcome.

On macOS/Linux, the only requirements are that `bash` and `curl` are installed.

## Run Install Doctor

### macOS/Linux

```
bash <(curl -sSL https://install.doctor/start)
```

### Windows

On Windows, you can run the following from an administrator PowerShell terminal:

```
iex ((New-Object System.Net.WebClient).DownloadString('https://install.doctor/windows'))
```

### Qubes

The following one-liner should be run from Qubes dom0:

```
qvm-run --pass-io sys-firewall "curl -sSL https://install.doctor/qubes" > ~/setup.sh && bash ~/setup.sh
```

## Guided Terminal Prompts

The one-liner installation methods will interactively prompt for a few details if they are not provided via environment variables or as Chezmoi-housed secrets. These prompts will ask you for information like:

* The type of installation (i.e. a minimal set of software or all the software Install Doctor supports)
* Your name / e-mail address (to pre-populate things like the Git configuration)
