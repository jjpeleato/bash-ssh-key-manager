# SSH Key Manager

Crea y cambia entre múltiples claves SSH fácilmente.

### El problema

Herramientas como GitHub, GitLab y Bitbucket utilizan claves SSH para autenticar a los usuarios y no permiten el uso de la misma clave para diferentes cuentas.

Si utilizas tu ordenador para trabajar y también para proyectos personales, es probable que necesites múltiples claves SSH para diferentes cuentas (por ejemplo, una para el trabajo, otra para un cliente, otra para proyectos personales). Manejar estas claves manualmente puede ser tedioso.

Este script simplifica el proceso, permitiendo crear y cambiar rápidamente entre diferentes claves SSH.

### Requisitos

- Sistema operativo Unix (Linux, macOS)
- Conocimientos básicos de scripting y uso de la línea de comandos (opcional)
- Git instalado para clonar el repositorio

### Instalación

1. Clonar el repositorio:
   ```bash
   cd ~
   git clone https://github.com/jjpeleato/bash-ssh-key-manager.git ssh-key-manager
   ```
2. Copia los scripts (`initialize.sh` y `environment.sh`) en el directorio `.ssh`:
   ```bash
   cd ~/ssh-key-manager
   cp *.sh ~/.ssh/
   ```
3. Dar permisos de ejecución a los scripts:
   ```bash
   cd ~
   chmod +x .ssh/initialize.sh
   chmod +x .ssh/environment.sh
   ```
4. Eliminar el repositorio clonado:
   ```bash
   cd ~
   rm -rf ssh-key-manager
   ```
5. ¡Fin y feliz uso!

### Uso

1. Ejecuta el script `initialize.sh` para crear las claves SSH que necesites. Sigue las instrucciones en pantalla, es muy fácil. Recuerda añadir una `passphrase` segura para cada clave.
   ```bash
   cd ~/.ssh
   sh initialize.sh
   ```
2. Cada vez que necesites cambiar de clave SSH, ejecuta el script `environment.sh` y selecciona la clave deseada.
   ```bash
   cd ~/.ssh
   sh environment.sh
   ```
3. ¡Listo! Ahora cambia entre tus claves SSH fácilmente.

**Nota:** No olvides añadir las claves públicas generadas a las plataformas correspondientes (GitHub, GitLab, Bitbucket, etc.).

### Aclaraciones

- El script `initialize.sh` crea un archivo llamado `loki.txt` en el directorio `~/.ssh` que contiene un resumen de las claves creadas. Es importante no borrar este archivo a menos que desees reiniciar el proceso.
- Las claves SSH se almacenan en el directorio `~/.ssh` dentro de subdirectorios nombrados según la cuenta (por ejemplo, `work`, `personal`).
- Las claves creadas usan el formato `ed25519`, que es más seguro y eficiente que el formato RSA tradicional.
- Si creas para FileZilla un archivo `.ppk` a partir de tu clave, llama al archivo de la siguiente forma `id_rsa_filezilla.ppk` y guárdalo en el mismo subdirectorio que la clave original. El script `environment.sh` lo detectará automáticamente.

### Migración desde clave SSH existente

Si ya tienes una clave SSH existente y deseas integrarla en este sistema, sigue estos pasos:

1. Mueve tu clave SSH en `~/.ssh` dentro de un subdirectorio (por ejemplo, `~/.ssh/work`, `~/.ssh/personal`).
2. Si existe. Elimina el archivo `~/.ssh/loki.txt`.
3. Ejecuta el script `initialize.sh` y en el proceso de creación de claves, utiliza el mismo nombre que el nombre del subdirectorio donde has movido tu clave. El script lo detectará y lo tendrá en cuenta automáticamente.
4. Sigue las instrucciones en pantalla para completar el proceso.

### Método nativo (alternativa)

Usa el script `initialize.sh` para generar tus claves SSH y, a continuación, crea o edita el archivo `~/.ssh/config` con las configuraciones necesarias.

A continuación, un ejemplo de configuración para dos cuentas de GitHub (trabajo y personal):

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

**Nota:** Asegúrate de reemplazar en la URL de tu repositorio remoto `github.com` por `github-work` o `github-personal` según corresponda.

```bash
git remote -v
git remote set-url origin git@github-personal:jjpeleato/bash-ssh-key-manager.git
```

### Estructura del proyecto

```
ssh-key-manager/
├── .husky/
│   ├── commit-msg
│   ├── post-merge
│   └── post-rewrite
├── .editorconfig
├── .gitignore
├── commitlint.config.cjs
├── environment.sh # Archivo principal para cambiar entre claves SSH
├── initialize.sh # Archivo principal para crear claves SSH
├── LICENSE
├── package.json
└── README.md
```

### Contribución

¡Las contribuciones son bienvenidas! Por favor, haz un `fork` del repositorio y envía un `pull request` con tus cambios.

### Soporte

Para errores o funcionalidades nuevas, por favor, abre un `issue` en el repositorio o contacta conmigo directamente.

### Fin

Más información en los siguientes commits. Si es necesario.

Saludos, **@jjpeleato**.
