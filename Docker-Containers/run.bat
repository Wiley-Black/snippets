@Echo off 

if exist set-login.bat (
	call set-login.bat 
) else (	
	set "USER=developer"
	set "PASS=yourpwd"	
)
echo Building container with user account '%USER%' and password '%PASS%'.
echo To connect after container starts, use Remote Desktop to localhost:3900.

docker compose build --build-arg USER=%USER% --build-arg PASS=%PASS%
if %ERRORLEVEL% neq 0 goto Done
docker compose up
docker compose down

:Done