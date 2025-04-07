# 🧙‍♂️ necromancer's Dotfiles

![Terminal Preview](https://via.placeholder.com/800x400?text=Terminal+Preview)

> Personal dotfiles for customizing my Linux environment (CachyOS), it can work on  any other linux Distro . A clean, consistent, and portable setup that can be easily reproduced across machines.

## ✨ Features

- **Bash Configuration**
  - Powerful `.bashrc` with organized sections and comments
  - Contextual `.bash_profile` for login shell configuration
  - Integration with Oh My Bash for themes and plugins

- **Custom Aliases & Functions**
  - 📦 System package management 
  - 🔧 System utilities and navigation (`ll`, `clr`, `..`)
  - 🐙 Git workflow shortcuts (`gs`, `ga`, `gc`, `gp`)
  - 🐍 Programming helpers (`py`, `venv`, `rust-repl`)
  - 📱 Bluetooth management (`bton`, `btoff`, `btcon`)
  - 🔎 Web searches from terminal (`duck`)
  - 📂 Archive extraction (`extract`)
  - 🖥️ Local media server (`playlocal`)
  - 👀 Enhanced watch command

- **Beautiful CLI Experience**
  - 🎨 Colorful prompts and output using Oh My Bash themes
  - 🎭 Fun welcome messages with `figlet`, `lolcat`, `cowsay` and `fortune`
  - 💻 Clean terminal aesthetics with helpful status information

- **Development Environment**
  - 🦀 Rust support via automatic Cargo environment loading
  - 🐍 Python virtual environment shortcuts
  - 📁 XDG specification compliance for config directories

## 📸 Screenshots

<details>
<summary>Click to expand screenshots</summary>

![Terminal Welcome](https://via.placeholder.com/800x200?text=Terminal+Welcome)
*Welcome screen with MOTD*

![Command Examples](https://via.placeholder.com/800x400?text=Command+Examples)
*Various command examples*

</details>

## 🛠️ Installation

### Prerequisites

- Git
- Bash (version 4.0+)
- Package manager (pacman for Arch-based distros)

> ⚠️ Before starting, **make sure no `.bashrc` or `.bash_profile` exists in `~`**, or back them up manually.

### Quick Install

```bash
# Clone the repository
git clone https://github.com/necromancer/dotfiles.git ~/dotfiles

# Navigate to the repo
cd ~/dotfiles

# Make the installer executable
chmod +x install.sh

# Run the installer
./install.sh
```

### What the Installer Does

1. Backs up any existing dotfiles (`.bashrc`, `.bash_profile`) to `~/.dotfiles_backup_<date>`
2. Installs required packages if missing (`figlet`, `lolcat`, `cowsay`, `fortune`)
3. Sets up Oh My Bash if not already installed
4. Creates symbolic links from the repository to your home directory
5. Sets appropriate permissions

### Manual Installation

If you prefer to install manually:

```bash
# Backup existing files
mkdir -p ~/.dotfiles_backup
[ -f ~/.bashrc ] && mv ~/.bashrc ~/.dotfiles_backup/
[ -f ~/.bash_profile ] && mv ~/.bash_profile ~/.dotfiles_backup/

# Create symbolic links
ln -sf ~/dotfiles/bash/.bashrc ~/.bashrc
ln -sf ~/dotfiles/bash/.bash_profile ~/.bash_profile

# Install Oh My Bash (optional)
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
```

## 📁 Repository Structure

```
dotfiles/
├── bash/
│   ├── .bashrc          # Main bash configuration
│   └── .bash_profile    # Login shell configuration
├── install.sh           # Installation script
└── README.md            # This documentation
```

## 🛠️ Customization

### Changing the Theme

Edit the `OSH_THEME` variable in `.bashrc`:

```bash
# Change from
OSH_THEME="powerline"

# To any theme from Oh My Bash
OSH_THEME="agnoster"  # or "minimal", "pure", etc.
```

### Adding Your Own Aliases

Add new aliases to the appropriate section in `.bashrc`:

```bash
# --- Custom Aliases ---
alias myalias='command'
```

## 🤝 Contributing

Feel free to fork this repository and customize it for your own use. If you have improvements that might benefit others, pull requests are welcome!

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 🧛 About

Maintained by necromancer (a.k.a. Vaibhav).  
Built on top of CachyOS, powered by terminal vibes and open source spirit.

---

<p align="center">
Created with 💜 by <b>necromancer(Vaibhav)</b>
</p>
