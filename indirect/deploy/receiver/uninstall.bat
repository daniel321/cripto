SET recieveDir=C:\ProgramData\recieve
SET usedProgramFiles=C:\Program Files (x86)
SET usedStartupFolder=%HOMEDRIVE%%HOMEPATH%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup

REM >xp:  SET usedStartupFolder=%HOMEDRIVE%%HOMEPATH%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
REM <=xp: SET usedStartupFolder=%HOMEDRIVE%%HOMEPATH%\Start Menu\Programs\Startup

taskkill.exe /F /IM javaw.exe
DEL "%usedStartupFolder%\program.lnk"

del /q %recieveDir%\*
RMDIR %recieveDir% \S \Q

FOR /D %%p IN ("%usedProgramFiles%\AutoIt3\*.*") DO rmdir "%%p" /s /q
del /q "%usedProgramFiles%\AutoIt3\*"
RMDIR "%usedProgramFiles%\AutoIt3" \S \Q
