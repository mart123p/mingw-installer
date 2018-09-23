# MinGW Windows Installer
This is an automated installer that will install the MinGW compiler without administrator privileges. The installer was tested on Windows 10.

It installs the MinGW in the %appData% directory, and updates the user path to include the compiler tools.

## Installation
Double click the `install.bat` file. It will start the installation process. To validate if the MinGW compiler was installed properly open a new cmd window and type the following command `gcc`.

You should see the following in the console. If you see gcc cannot be found or something similar, then the MinGW compiler is not installed.
```
gcc: fatal error: no input files
compilation terminated.

```

## Uninstallation
Double click the `uninstall.bat` file. It will start the uninstallation process.