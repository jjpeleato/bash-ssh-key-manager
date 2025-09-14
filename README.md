# SSH Key Manager

Manage multiple SSH keys and switch between them easily.

### The problem

Tools like GitHub, GitLab, and Bitbucket use SSH keys to authenticate users and do not allow the same key to be used for different accounts.

If you use your computer for work and also for personal projects, you probably need multiple SSH keys for different accounts (for example, one for work, one for a client, and another for personal projects). Managing these keys manually can be tedious.

This script simplifies the process, allowing you to quickly create and switch between different SSH keys.

### Requirements

- Unix-based operating system (Linux, macOS)
- Basic knowledge of bash scripting and command-line usage
- Git installed for cloning the repository

### Installation

1. Clone the repository:
   ```bash
   cd ~
   git clone https://github.com/jjpeleato/bash-ssh-key-manager.git ssh-key-manager
   ```
2. Copy the scripts (`initialize.sh` and `environment.sh`) into `.ssh` directory:
   ```bash
   cd ~/ssh-key-manager
   cp *.sh ~/.ssh/
   ```
3. Give execution permissions to the scripts:
   ```bash
   cd ~
   chmod +x .ssh/initialize.sh
   chmod +x .ssh/environment.sh
   ```
4. Remove the cloned repository:
   ```bash
   cd ~
   rm -rf ssh-key-manager
   ```
5. End and happy use!

### Usage

1. Run the `initialize.sh` script to create the SSH keys you need. Follow the on-screen instructions, it is very easy. Remember to set a secure `passphrase` for each key.
   ```bash
   cd ~/.ssh
   sh initialize.sh
   ```
2. Whenever you need to switch SSH keys, run the `environment.sh` script and select the desired key.
   ```bash
   cd ~/.ssh
   sh environment.sh
   ```
3. Done! Now you can easily switch between your SSH keys.

**Note:** Don’t forget to add the generated public keys to the corresponding platforms (GitHub, GitLab, Bitbucket, etc).

### Clarifications

- The `initialize.sh` script creates a file called `loki.txt` in the `~/.ssh` directory, which contains a summary of the keys created. It is important not to delete this file unless you want to restart the process.
- SSH keys are stored in the `~/.ssh` directory inside subdirectories named after the account (for example, `work`, `personal`).
- The keys created use the `ed25519` format, which is more secure and efficient than the traditional RSA format.
- If you create a `.ppk` file for FileZilla from your key, name the file `id_rsa_filezilla.ppk` and save it in the same subdirectory as the original key. The `environment.sh` script will detect it automatically.

### Migration from an existing SSH key

If you already have an existing SSH key and want to integrate it into this system, follow these steps:

1. Move your SSH key in `~/.ssh` into a subdirectory (for example, `~/.ssh/work`, `~/.ssh/personal`).
2. If it exists, delete the file `~/.ssh/loki.txt`.
3. Run the `initialize.sh` script and during the key creation process, use the same name as the subdirectory where you moved your key. The script will detect it and handle it automatically.
4. Follow the on-screen instructions to complete the process.

### Native method (alternative)

Use the `initialize.sh` script to generate your SSH keys and then create or edit the `~/.ssh/config` file with the necessary configurations.

Below is an example configuration for two GitHub accounts (work and personal):

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

**Nota:** Make sure to replace `github.com` in your remote repository URL with `github-work` or `github-personal`, as appropriate.

```bash
git remote -v
git remote set-url origin git@github-personal:jjpeleato/bash-ssh-key-manager.git
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
├── environment.sh # Main script to switch between SSH keys
├── initialize.sh # Main script to create SSH keys
├── LICENSE
├── package.json
└── README.md
```

### Contributing

Contributions are welcome! Please fork the repository and submit a pull request with your changes.

### Support

For issues or feature requests, please open an issue in the repository or contact with me directly.

### Finally

More information on the following commits. If required.

Grettings **@jjpeleato**.
