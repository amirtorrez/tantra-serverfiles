@echo off
title Encender servidor v0.2
color 2F
echo -------------------------------------------------
echo ----        Encender servidor Tantra         ----
echo ----         Amir Torrez   -  Torzap         ----
echo -------------------------------------------------
@rem Tiempo en segundos entre cada ejecucion:
set optm=10
@rem Tiempo en segundos para cerrar al finalizar:
set cstm=5

@echo.
echo Creando particiones...
SUBST Q: C:\Share
subst G: C:\DBSRV\guild
subst R: C:\current_user
SUBST K: C:\SQLDAEMON\Rank
@echo.
timeout>nul /t 5
@echo.
echo Encendiendo motores...
start DBSRV\DBSRV.exe
timeout>nul /t 5
start MSGSRV\MSGSRV.exe
timeout>nul /t 5
start Itemserver\Itmsrv.exe
@echo.
echo Encendiendo todas las zonas...
for /L %%i in (1,1,50) do ( timeout>nul /t 5 && if exist Zone%%i\Zone%%i.exe start Zone%%i\Zone%%i.exe )
timeout>nul /t 5
start SQLDAEMON\SQLDAEMON.exe
@echo.
echo Servidor listo, esta ventana se cerrara en %cstm% segundos
timeout>nul /t 5
