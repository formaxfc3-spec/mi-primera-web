@echo off
title Instalador Formax FC
color 0A

echo =========================================
echo   INSTALADOR FORMAX FC
echo =========================================
echo.

REM --- Verifica que XAMPP este instalado en la ruta por defecto ---
set XAMPP=C:\xampp
set MYSQL=%XAMPP%\mysql\bin\mysql.exe
set HTDOCS=%XAMPP%\htdocs\formaxfc

if not exist "%MYSQL%" (
    echo [ERROR] No se encontro XAMPP en C:\xampp
    echo Primero debes instalar XAMPP desde https://www.apachefriends.org
    echo y luego volver a ejecutar este instalador.
    pause
    exit /b
)

echo [1/4] Copiando archivos del proyecto a htdocs...
if not exist "%HTDOCS%" mkdir "%HTDOCS%"
xcopy /E /Y /I "%~dp0*" "%HTDOCS%" >nul
echo       Listo.

echo.
echo [2/4] Verificando que MySQL este encendido...
"%XAMPP%\mysql_start.bat" >nul 2>&1
timeout /t 3 >nul

echo.
echo [3/4] Creando base de datos e importando tablas...
"%MYSQL%" -u root < "%HTDOCS%\base_datos_formax.sql"
if %errorlevel%==0 (
    echo       Base de datos creada correctamente.
) else (
    echo       [AVISO] Revisa que MySQL este encendido en el Panel de XAMPP e intenta de nuevo.
)

echo.
echo [4/4] Abriendo la pagina en tu navegador...
start http://localhost/formaxfc/index.html

echo.
echo =========================================
echo   INSTALACION TERMINADA
echo =========================================
echo Recuerda: Apache y MySQL deben estar en verde
echo en el Panel de Control de XAMPP para que
echo la pagina y el formulario funcionen.
echo.
pause
