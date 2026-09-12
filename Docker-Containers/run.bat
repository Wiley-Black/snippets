@Echo off 

rem The .gitignore excludes set-login.bat, so credential setup can be there...
if exist set-login.bat (
	call set-login.bat 
) else (	
	set "USER=developer"
	set "PASS=yourpwd"	
)
echo Building container with user account '%USER%' and password '%PASS%'.
echo To connect after container starts, use Remote Desktop to localhost:3900.

rem The .gitignore excludes the "mine" directory, so you can customize...
if not exist "mine\dockerfile" (
	echo Directory/dockerfile 'mine' not found.  Creating a default example.
	if not exist "mine" mkdir "mine"	
	(
		echo # syntax=docker/dockerfile:1
		echo FROM ubuntu24-xfce4-nvm24-rdp:latest
		echo #### Customization ####
		echo.
		echo # Switch to making changes under user's account.
		echo USER $USER
		echo.
		echo #### Launch Supervisor Process  ####
		echo.		
		echo CMD [ "/usr/bin/supervisord", "-n" ]
	) > "mine\dockerfile"
)

rem All setup, launch...
docker compose build --build-arg USER=%USER% --build-arg PASS=%PASS%
if %ERRORLEVEL% neq 0 goto Done
docker compose up
docker compose down

:Done