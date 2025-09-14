# SSH Key Manager

A simple bash script to manage and switch between multiple SSH keys with ease.

### The problem

Managing multiple SSH keys for different services or environments can be cumbersome. This script simplifies the process by allowing you to create and switch between different SSH key configurations quickly.

## Prerequisites

- Unix-based operating system (Linux, macOS)
- Basic knowledge of bash scripting and command-line usage
- Git installed for cloning the repository

## Installation

1. Clone the repository:
   ```bash
   cd ~
   git clone https://github.com/jjpeleato/bash-ssh-key-manager.git ssh-key-manager
   ```
2. Copy the scripts into .ssh directory:
   ```bash
   cd ~/ssh-key-manager
   cp *.sh ~/.ssh/
   ```
3. Remove the cloned repository:
   ```bash
   cd ~
   rm -rf ssh-key-manager
   ```
4. End and happy use!

### Native method (alternative)

You can run the initialize script and then manually create and manage your SSH keys without using the provided scripts.

You can have a configuration like this in your `~/.ssh/config` file:

```text
# Work account
Host github-work
    HostName github.com
    User git
    IdentityFile ~/.ssh/work/id_rsa
    IdentitiesOnly yes

# Personal account
Host github-personal
    HostName github.com
    User git
    IdentityFile ~/.ssh/personal/id_rsa
    IdentitiesOnly yes
```

### Project structure

```
ssh-key-manager/
├── .husky/
│   ├── commit-msg
│   ├── post-merge
│   └── post-rewrite
├── .editorconfig
├── .gitignore
├── commitlint.config.cjs
├── environment.sh
├── initialize.sh
├── LICENSE
├── package.json
└── README.md
```

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request with your changes.

## Support

For issues or feature requests, please open an issue in the repository or contact with me directly.

## Finally

More information on the following commits. If required.

Grettings **@jjpeleato**.
