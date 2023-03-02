---
title: Environment Requirements
description: Requirements necessary to provision an environment with Install Doctor
sidebar_label: Requirements
slug: /getting-started/requirements
---
Install Doctor has a minimal set of requirements since it is, by nature, a batteries-included provisioning script / framework. However, on some devices there may be some initial legwork required.

## Linux

On Linux, you need `bash` and `curl` installed. These are required since they are utilized by the one-line kickstarter script:

```
bash <(curl -sSL https://install.doctor/start)
```

### Arch Linux

```
pacman -Syu bash curl
```

### CentOS / Fedora

```
sudo dnf install -y bash curl
```

### Debian / Ubuntu

```
sudo apt-get install -y bash curl
```

## macOS

macOS has no special requirements.

## Qubes

To provision Qubes, it is important that you begin the provisioning process from a `dom0` terminal session if you want to utilize the one-line kickstarter script:

```
qvm-run --pass-io sys-firewall "curl -sSL https://install.doctor/qubes" > ~/setup.sh && bash ~/setup.sh
```

## Windows

The Windows 11 requires elevated administrator privileges so when you first run the one-line setup script, you should preferrably run it from an Administrator PowerShell terminal window.
