:: Actualizamos python3 a su ultima version
python -mpip install --upgrade pip

:: Instalamos pycryptodomex
python -mpip install pycryptodomex

:: Actualizamos seedminer
python seedminer_launcher3.py update-db


:: Pequeño codigo para hacer un menu
@echo off
title Extraer el movable.sed


:: Menu principal
:menu1
cls
echo ****************************************************
echo Selecciona el tipo de consola que tienes (OLD o NEW)
echo 1) Old
echo 2) New
echo 3) Salir
echo ****************************************************
echo.


:: Opcion seleccionada
set /p var=Seleccione una opcion:
if "%var%"=="1" goto opcion1
if "%var%"=="2" goto opcion2
if "%var%"=="3" goto opcion3


:: Mensaje de error por si se selecciona una opcion no valida
echo.
echo La opcion %var% no es valida. Intentalo de nuevo
echo.
pause
echo.
goto menu1


echo.


:: Segun la opcion que elegimos, se ejecuta un comando u otro
:opcion1
python seedminer_launcher3.py mii old
echo.
goto introducir_id

:opcion2
python seedminer_launcher3.py mii new
echo.
goto introducir_id

:opcion3
@cls&exit


:: Una vez extraido el movable_part1.sed, pedimos el id para añadirselo
:introducir_id
set /p id0=Introduzca el ID de su consola:

:: Añadimos el id0 al movable_part1.sed
python seedminer_launcher3.py id0 %id0%
goto :menu2


:menu2
cls
echo ****************************************************
echo Selecciona como extraer el movable.sed (CPU o GPU)
echo 1) CPU 
echo 2) GPU (Tarjeta grafica)
echo ****************************************************
echo.


:: Opcion seleccionada
set /p modo=Seleccione una opcion:
if "%modo%"=="1" goto cpu
if "%modo%"=="2" goto gpu


:: Mensaje de error por si se selecciona una opcion no valida
echo.
echo La opcion %var% no es valida. Intentalo de nuevo
echo.
pause
echo.
goto menu2


echo.


:cpu
python seedminer_launcher3.py cpu

:gpu
python seedminer_launcher3.py gpu


:: Comandos para que no se cierre la ventana al acabar
echo.
pause
