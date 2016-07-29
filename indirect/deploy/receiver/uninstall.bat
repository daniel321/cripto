SET recieveDir=C:\ProgramData\recieve
SET usedStartupFolder=%HOMEDRIVE%%HOMEPATH%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup

REM >xp:  SET usedStartupFolder=%HOMEDRIVE%%HOMEPATH%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
REM <=xp: SET usedStartupFolder=%HOMEDRIVE%%HOMEPATH%\Start Menu\Programs\Startup

taskkill.exe /F /IM javaw.exe
DEL "%usedStartupFolder%\program.lnk"

FOR /D %%p IN ("%recieveDir%\AutoIt3\*.*") DO rmdir "%%p" /s /q
del /q "%recieveDir%\AutoIt3\*"
RMDIR "%recieveDir%\AutoIt3" \S \Q

del /q %recieveDir%\*
RMDIR %recieveDir% \S \Q

