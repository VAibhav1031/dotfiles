# Necromancer Dotfiles

![Terminal Preview](https://via.placeholder.com/800x400?text=Terminal+Preview)

> Personal dotfiles for customizing my Linux environment , it can work on  any other linux Distro . A clean, consistent, and portable setup that can be easily reproduced across machines.

##  Screenshots

<details>
<summary>Click to expand screenshots</summary>

![Terminal Welcome](https://via.placeholder.com/800x200?text=Terminal+Welcome)
*Welcome screen with MOTD*

![Command Examples](https://via.placeholder.com/800x400?text=Command+Examples)
*Various command examples*

</details>

## Installation

### Prerequisites

- Git
- Bash (version 4.0+)
- Package manager (pacman for Arch-based distros)

> Before starting, **make sure no `.bashrc` or `.bash_profile` exists in `~`**, or back them up manually.

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

##  Customization

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

