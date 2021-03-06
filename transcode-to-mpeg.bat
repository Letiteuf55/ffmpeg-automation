@ECHO OFF
CLS
TITLE Rewrap
SETLOCAL
ECHO *******************************************************
ECHO *    		   Transcode to Mpeg					   *
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

SET REP_IN=X:\TV\pivot\IN
SET REP_OUT=X:\V\pivot\OUT
SET REP_SAVE=X:\TV\pivot\Done

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

ffmpeg -y -i %REP_IN%\%%?.mp4 -vcodec mpeg2video -vb 10000k -vf scale=1920:1080 -acodec mp2 -ab 256k %REP_OUT%\%%?.mpg    

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
