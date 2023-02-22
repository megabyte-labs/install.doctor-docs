---
title: Install Doctor Documentation
description: Overview of Install Doctor, the multi-OS provisioning framework that can setup workstations and servers
slug: /
sidebar_label: Overview
hide_table_of_contents: true
---
## What is Install Doctor?

![Free, Simple, Easy Software Installations](https://install.doctor/assets/img/og.png)

Install Doctor is a set of scripts, software, and configurations that can setup your PCs quickly. It allows you to define software and plugins in YAML / JSON in such a way that as little work as possible is involved when adding a new package to your stack. It is a [Chezmoi](https://www.chezmoi.io/) based project so all the features of Chezmoi are also included.

## Multi-OS Provisioning

Part of what seperates Install Doctor from other provisioning systems is that it includes features that make it easy to apply your same configurations across multiple operating systems. It includes its own software installation program that can be configured to, for instance, prefer to install software with the system package manager but leverage [Homebrew](https://brew.sh/) if the package is not available via the system package manager.

Apart from installing a configurable set of software packages, it also leverages Chezmoi's built-in feature that allows you to delegate specific scripts to run on certain operating systems. This is how, at provisioning time, the system runs PowerShell scripts on Windows and Bash scripts on other targets.

## Pre-Configured Dotfiles

Another feature of Install Doctor is that, by default, it includes a highly-optimized and robust set of configurations that most people know as *dotfiles*. They are called *dotfiles* because they are generally stored in the user's home directory and prefixed with a period / dot on Linux systems. The dotfiles connect key software packages into the eco-system that Install Doctor provisions by:

* Configuring Bash / ZSH terminal sessions to use feature-packed setups like [Oh-My-ZSH](https://ohmyz.sh/)
* Optimizing the default functionality of many terminal CLIs to use settings that are recommended by their developers
* Housing configurations for applications that are better than the default application settings
* Ensuring that the home directory is clear of random folders by adhereing to [XDG spec](https://wiki.archlinux.org/title/XDG_Base_Directory)

## Automated Feature Integration

Many packages have setup that is required after installing. For instance, [Tailscale](https://tailscale.com/), a piece of software that allows you to connect any two devices connected to the internet as a WireGuard VPN LAN, needs to register and connect to the Tailscale relay before you can use it. With a Tailscale API token defined, Install Doctor will automatically connect your device to your VPN LAN.

With so many pieces of great, free, unique software, there is really only one way of integrating these technologies into your stack and that is with Install Doctor. Instead of worrying about configuring software each time you wipe and restore a device, you can define your user-specific credentials in an encrypted store within your Install Doctor configuration and then forget about it.

There are so many features that Install Doctor adds the capability of integrating into your dream setup. Read about the [features that Install Doctor adds](/docs/features).
