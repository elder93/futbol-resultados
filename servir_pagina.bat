@echo off
chcp 65001 >nul
title Servidor: futbol.html (desde el celular)
cd /d "%~dp0"
cls
echo =====================================================================
echo   Para ver la pagina desde el CELULAR (mismo WiFi):
echo.
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /i "IPv4"') do (
  set "ip=%%a"
  if not "%%a"=="" echo   En el movil abre:  http://%%a:9876/index.html
)
echo.
echo   En el PC tambien puedes probar:  http://127.0.0.1:9876/index.html
echo.
echo   Si el movil no carga, el firewall puede bloquear. Solucion:
echo   (ejecutar una vez como administrador)
echo     netsh advfirewall firewall add rule name="futbol9876" dir=in ^
action=allow protocol=TCP localport=9876
echo.
echo   Pulsa Ctrl+C para detener el servidor.
echo =====================================================================
echo.
python -m http.server 9876 --bind 0.0.0.0