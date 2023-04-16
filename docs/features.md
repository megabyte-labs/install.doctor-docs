---
title: Features Overview
description: A synopsis of the numerous features and capabilities that Install Doctor adds to a device that it provisions.
sidebar_label: Overview
slug: /features
---

Install Doctor bundles together thousands of open-source projects into a single configuration that you can bring with you to nearly any operating system. The feature set will vary based on your configuration. The framework will intelligently apply optimizations and run setup routines based on which pieces of software you decide to include in your stack. Install Doctor turns your devices into open-source powerhouses that integrate all the nice-to-haves into a *cannot-live-without-it* operating system.

## Background

Install Doctor was originally intended to be a sub-repo for the Ansible-based project called [Gas Station](https://github.com/megabyte-labs/gas-station). However, after years of dealing with Ansible's shortcomings, we decided to transition the entire Gas Station project, which contains hundreds of custom Ansible roles, to Install Doctor's Chezmoi-based format. Since Install Doctor is based on [Chezmoi](https://www.chezmoi.io/), that means you get to leverage all the great template directives that Chezmoi makes available. There is also a feature that allows you to see the changes that Install Doctor will make to a file prior to applying the change during the provision process which is a great way of determining new settings to include in your base configuration.

The information below provides high-level details on what features Install Doctor will integrate into your operating system if you decide to choose the `Full` install after running `bash <(curl -sSL https://install.doctor/start)` (or the equivalent for your OS).

## Consistent Features

The majority of Install Doctor software and configurations can be applied on any operating system. The features that the software and configurations integrate include:

* Storing software lists in YAML files
* Ability to define multi-OS package definitions (i.e. the ability run `install-program androidstudio` on any OS). The package definitions can be found in the `software.yml` file. Further details can be found in the [Customization](/docs/customization) [Customizing Software Definition](/docs/customization/software) guides.
* Integrated secret management system that allows you to enable advanced functionality by embedding encrypted password-protected secrets directly into your public GitHub fork of Install Doctor
* Automatic installation of YAML-defined lists of application-specific plugins (e.g. Google Chrome extensions, Firefox add-ons, VIM plugins, Visual Studio Code extensions, and more)
* Optimized default configurations for hundreds of applications which ensures that there less setup work involved when you run an application for the first time
* Automated backups of both system files and user files to S3-compliant buckets
* Fully-optimized Visual Studio Code configuration that comes pre-configured to utilize our linter / auto-fixer presets whenever a project-specific configuration is not available (e.g. [`eslint-config-strict-mode`](https://github.com/megabyte-labs/eslint-config-strict-mode), [`prettier-config-strict-mode`](https://github.com/megabyte-labs/prettier-config-strict-mode), [`stylelint-config-strict-mode`](https://github.com/megabyte-labs/stylelint-config-strict-mode), and more). *This is done by including the definitions in a `package.json` that installs `node_modules` to a low-level directory so any projects without configurations traverse up to see it as the default configuration.*
* Fully configured settings, with sensible defaults, like the Git config template that automatically injects your name and e-mail address so Git does not hassle you about it again. The Git config also includes a beautifully styled `git diff` tool powered by [delta](https://github.com/dandavison/delta) and [bat](https://github.com/sharkdp/bat).
* Start projects with boilerplates and synchronize settings across all your repositories by simply running `npm init` which utilizes [GitSync.org](https://gitsync.org). *Coming soon..*
* Automatically configure your SSH settings including your `~/.ssh/authorized_keys` file which links to your GitHub SSH keys so that you can SSH into your machine with the same SSH keys you use to access GitHub
* Create a LAN-like network of VPN-connected devices anywhere on the internet via our [Tailscale](https://tailscale.com/) integration (i.e. no need to worry about opening ports in your firewall / router)
* Synchronize browser profiles to a private git repository so that you do not have to reset up all your extensions settings and logins the next time you distro hop or reformat. *This is a WIP.*
* Patches VMWare so that it can run macOS and also automatically accepts the license agreement and applies a license key

### Web Applications

**Automated web application deployment integration is a WIP. Right now, the plan is to utilize [KubeSphere](https://kubesphere.io/) to host any local web services via Kubernetes. Pull requests, feature requests, and tips are welcome. Please refer to the [Community](https://install.doctor/community) page for details on engaging with the team.**

* Provided the appropriate variables, [Netdata Cloud](https://www.netdata.cloud/) is setup so you can monitor your device's performance in the free Netdata Cloud app. Also, this opens the door for providing alerts when devices are unhealthy.

### CloudFlare

**The CloudFlare integration is a WIP. Pull requests, feature requests, and tips are welcome. Please refer to the [Community](https://install.doctor/community) page for details on engaging with the team.**

Install Doctor is proud to include many different (optional) capabilities that can be enabled by providing various CloudFlare API tokens. CloudFlare offers DNS hosting, S3-compliant buckets, and endpoint protection services. Combining all of these features leads to a system that can host web services that you can access over the internet by leveraging automatically configured domains (with HTTPS) protected by SSO. More specifically, our integration with CloudFlare provides the following features:

* After specifying a domain you would like to use that is registered to your CloudFlare account, Install Doctor can automatically configure the subdomains of that domain to point to any web services that you launch with Install Doctor (requires providing appropriate variables and secrets - more details on the [Integrating Secrets](/docs/customization/secrets) page)
* Integrate [CloudFlare for Teams](https://www.cloudflare.com/plans/zero-trust-services/) (free) and automatically connect via [warp-cli](https://developers.cloudflare.com/warp-client/get-started/linux/)
* Protect all your web services by SSO
* Authenticate with SSH endpoints using short lived certificates for improved security
* Ability to integrate CloudFlare for Teams browser isolation feature which allows you to render websites on CloudFlare's edge network which improves security. *Note: This is a paid-feature provided by CloudFlare that costs $10/month. This feature is optional. This is currently a WIP - pull requests welcome.*
* S3-compliant storage buckets mounted to system folders (which are utilized as backup locations but can also be used for other storage purposes)

## Terminal Features

There are so many useful frameworks, tools, and applications that can enhance CLI productivity and ease-of-use. Our team has spent years browsing through GitHub and trialing the tools that are most well-received by the open-source community. We then meticulously crafted `~/.bashrc`, `~/.zshrc`, and PowerShell configurations that are well-organized and fully integrate all the optimal settings for all the best CLI tools without hindering CLI performance. The finished product is a major pillar stone of the Install Doctor feature set. All of our terminals include:

* System `PATH` definitions come pre-configured so that all the package managers like Go, Cargo, [ASDF](https://asdf-vm.com/), and more work without any modification necessary to your `~/.bashrc` or `~/.zshrc`. There is no need to spend a half hour trying to figure out how to get `adb` to work.
* Well-thought ZSH, Bash, and PowerShell configurations that reference organized, modular profile source files
* Automatic Node.js version switching based on project via [Volta](https://volta.sh/)
* [direnv](https://github.com/direnv/direnv) to automatically load `.env` files
* Dozens of different terminals like GNOME terminal, iTerm2, and Tabby are all styled to be consistent with the [Sweet](https://github.com/EliverLara/Sweet)-based theme
* Default terminal application profiles so you can easily navigate between a Bash and ZSH instance
* A smarter version of `cd`, powered by [zoxide](https://github.com/ajeetdsouza/zoxide), that remembers which directories you use most frequently so you can *jump* to them in just a few keystrokes
* Directories and files are colored based on what type folder or file they are by integrating [LS_COLORS](https://github.com/trapd00r/LS_COLORS)
* A custom MOTD with important system information
* Implementation of the XDG Spec which decreases the amount of noise in the home directory by specifying where files should go. This is combined with a lot of nit-picking and even a handful of PRs made to open-source projects that we implement, all so the home directory has as little clutter as possible.
* Integration of all the best VIM plugins, resulting in a VIM instance that looks great and includes power-user features like in-editor linting and code intellisense (see the [Software Customization](/docs/customization/software) page for details on how to customize the list of VIM plugins that are automatically provisioned)
* Integration of NVIM for a terminal text editor experience that parallels Visual Studio Code by utilizing the [NvChad](https://github.com/NvChad/NvChad) project along with some customizations
* Aliases all organized into `~/.config/shell/aliases.sh` and functions all organized into `~/.config/shell/functions.sh`
* Hundreds of micro-optimizations that do things like style manpages, incorporate fonts with icons used by the terminal themes, and many, many more

### ZSH

ZSH is included as the default shell wherever possible. Our ZSH implementation is feature-rich and suitable for everyone from beginners to advanced open-source sleuths. The configuration includes:

* Integration of [Oh-My-ZSH](https://ohmyz.sh/)
* [Antigen](https://github.com/zsh-users/antigen) for managing Oh-My-ZSH plugins
* Auto-completions based on which pieces of software you install
* [Syntax highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
* [Auto-suggestions](https://github.com/zsh-users/zsh-autosuggestions)
* Beautiful, intelligent prompt system based on [Powerlevel10k](https://github.com/romkatv/powerlevel10k)

### Bash

Bash is the de-facto standard. It is used as the default shell on headless terminal setups and comes well-configured on the desktop as well. It features:

* Integration of [Bash It](https://github.com/Bash-it/bash-it)
* Fallback configurations for minimal terminals using [Oh-My-Posh](https://ohmyposh.dev/)
* Auto-completions loaded based on software that is installed

### PowerShell

On Windows, it is hard to ignore PowerShell. There are no widely-acclaimed frameworks like Oh-My-ZSH or Bash It available for PowerShell. On PowerShell, the default configuration of Install Doctor includes:

* Integration of [Oh-My-Posh](https://ohmyposh.dev/)
* Backwards compatibility tool integrations to allow running Bash scripts from PowerShell without having to invoke WSL. *This is a WIP. Pull requests welcome.*

### CLI Tools

By default, our pre-defined software templates include dozens (or hundreds, depending on what template you choose) of CLI tools that are integrated into the terminal configurations. Software like [fzf](https://github.com/junegunn/fzf) and a handful of other utilities are included in dotfile configurations that instruct various tools to work together to deliver a stellar terminal UX.

## Linux Features

* Customized version of the Sweet-theme that supports both GNOME and KDE named [Betelgeuse](https://gitlab.com/megabyte-labs/misc/betelgeuse)
* Custom Plymouth boot screen that displays the Linux distro logo along with a smooth animation that is compatible with all operating systems including Qubes
* Custom GRUB2 theme along with custom Plymouth theme settings with aim of having a smoothly animated boot process (without any unimportant, unstyled text logs)
* Configurations for automatically configuring system and application settings stored in the Install Doctor repository or your own custom fork (e.g. `gsettings`, `dconf`, etc.)
* Sleek yet functional implementation of Rofi that matches Betelgeuse
* Imports both OpenVPN and WireGuard VPN profiles into NetworkManager (details on the [Integrating Secrets](/docs/customization/secrets) page)
* Automatic AppImage updates and management via [Zap](https://github.com/srevinsaju/zap)
* Incorporates the wildly popular [.tmux](https://github.com/gpakosz/.tmux) project which is an extensible, pretty, versatile tmux configuration
* Malicious users that try to SSH into your device are met with a script-breaking, never-ending SSH welcome banner via [Endlessh](https://github.com/skeeto/endlessh)
* Installs and configures YAML-defined GNOME / KDE extensions


### Qubes

**Qubes support is coming soon. The [Gas Station](https://github.com/megabyte-labs/gas-station) project was verified on Qubes. Transitioning the logic to Install Doctor is a WIP and may still leverage Ansible.**

## macOS Features

* Many system application default settings are housed in the default configurations (e.g. a `.plist` file that configures the default settings of the built-in Terminal along with many other configurations)
* Integration of developer oriented macOS system settings via the `home/.chezmoiscripts/darwin/run_onchange_after_10-configure-macos.tmpl`. Includes hundreds of system tweaks ranging from decreasing the cursor movement delay when you hold down an arrow key to enabling Safari's debug menu.

## Windows Features

**Windows support is coming soon. We are currently investigating ways of being able to re-use our Bash scripts by installing various GNU compatibility tools so that we can run scripts with Bash shebangs without having to utilize WSL. This way, we can leverage the Windows features we need (i.e. `chocolatey`) while being able to run the majority of our scripts in a PowerShell terminal.**

## More Features

There are many, many more features that have not been listed in this high-level overview. We encourage you to browse through the [Install Doctor repository](https://github.com/megabyte-labs/install.doctor) codebase to browse through additional features not listed here. If you cannot find a feature that you are looking for, then please engage with our [Community](https://install.doctor/community) and let us know how to make Install Doctor accomodate your needs.