# Code Snippets / Docker Containers

- run.bat: example Windows batch file for building a container and launching it via docker compose.
	- Optional: write a set-login.bat file that looks like:
```cmd
		SET "USER=developer"
		SET "PASS=pwd"
```
	
- ubuntu24-xfce4-nvm24-rdp: A Dockerfile (and other files) for setting up Ubuntu 24.04 LTS with XFCE4 and xrdp such that it can be accessed via Remote Desktop.
	- Also installs Python 3, nvm 24 (JS Node), and VS Code.
	- Also installs Firefox.
	- Optional: add a system-configuration/background.png image to be used as the desktop background.
