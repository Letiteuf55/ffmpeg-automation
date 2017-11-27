@ECHO OFF
CLS
TITLE Rewrap
SETLOCAL
ECHO *******************************************************
ECHO *    		   Rewrap mp4 files						   *
ECHO *                                                     *
ECHO *******************************************************
ECHO.
:boucle
ECHO.
ECHO.
ECHO.
ECHO EN ATTENTE DE TRAITEMENT
ECHO.
ECHO.
ECHO.
rem ///////////////////////////////////////////////////////////////////
rem //
rem //                   Definition des variables   
rem //
rem ///////////////////////////////////////////////////////////////////

SET REP_IN=X:\Edgy_TV\pivot\IN
SET REP_OUT=X:\Edgy_TV\pivot\OUT
SET REP_SAVE=X:\Edgy_TV\pivot\Done

:encodage
ECHO.
ECHO.
ECHO.
ECHO.
echo DEBUT DU PROCESS
ECHO.
ECHO.

FOR /f "delims=." %%? IN ('DIR/b %REP_IN%\*.mp4') DO (
ECHO Fichier %%? detecte dans %REP_IN% : test disponibilite...
rem //On teste si on le fichier est fini

ffmpeg -y -i %REP_IN%\%%?.mp4 -vcodec copy -s 1920x1080 -acodec copy %REP_OUT%\%%?.mp4    

ECHO.
ECHO.
echo Le transcodage est termine
ECHO.
ECHO.


"E:\sleep.exe" 10

move %REP_IN%\%%?.mp4 %REP_SAVE%\%%?.mp4

goto :end
)

:encours
ECHO.
ECHO.
ECHO.
ECHO.
ECHO En Attente de fichier à rewrapper
ECHO.
ECHO.

:end
ENDLOCAL

"E:\sleep.exe" 5

goto boucle
