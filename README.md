# Zsh Configuration

A clean, cross-platform Zsh configuration optimized for macOS and Ubuntu/Linux. Free to use, modify, and adapt for your environment.

---

## Table of Contents

- [Features](#features)
- [Prerequisites](#prerequisites)
- [Plugin installation](#plugin-installation)
- [Usage](#usage)

---

## Features

- Cross-platform support
    - macOS (Intel & Apple Silicon with Homebrew)
    - Ubuntu / Linux
- Enhanced tab completion (fzf-based)
    - Git, Homebrew (macOS), AWS CLI, Terraform, Ansible, kubectl, Docker, Helm, GitHub CLI
- Productivity enhancements
    - Syntax highlighting
    - Autosuggestions
    - Colorized output
    - Handy aliases and a clean prompt powered by oh-my-posh
- OS detection (macOS vs Linux)

---

## Prerequisites

Install the following tools for the full experience.

### Prompt & shell
- oh-my-zsh — https://ohmyz.sh
- oh-my-posh — https://github.com/JanDeDobbeleer/oh-my-posh

### Tab completion & enhancements
- fzf — https://github.com/junegunn/fzf
- fzf-tab — https://github.com/Aloxaf/fzf-tab
- zsh-autosuggestions — https://github.com/zsh-users/zsh-autosuggestions
- zsh-syntax-highlighting — https://github.com/zsh-users/zsh-syntax-highlighting

### Optional visual utilities
- LSD (modern ls) — https://github.com/Peltoche/lsd
- ccat (colorful cat) — https://github.com/owenthereal/ccat
- Nerd Fonts — https://www.nerdfonts.com

---

## Plugin installation

Clone plugins into your oh-my-zsh custom plugins folder (example):

```bash
# Set ZSH_CUSTOM if not set
ZSH_CUSTOM=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}

# fzf-tab
git clone https://github.com/Aloxaf/fzf-tab.git "$ZSH_CUSTOM/plugins/fzf-tab"

# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions.git "$ZSH_CUSTOM/plugins/zsh-autosuggestions"

# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
```

For fzf itself, use your OS package manager or follow the project install instructions: https://github.com/junegunn/fzf

---

## Usage

- Copy the `.zshrc` file to your home directory: `cp path/to/this/repo/.zshrc ~/.zshrc`
- Add the installed plugins to your .zshrc `plugins=(... fzf-tab zsh-autosuggestions zsh-syntax-highlighting ...)`
- Configure oh-my-posh as your prompt per its documentation: https://github.com/JanDeDobbeleer/oh-my-posh
- Reload your shell: `exec zsh` or `source ~/.zshrc`

---
