taskkill.exe /F /IM javaw.exe
DEL "%HOMEDRIVE%%HOMEPATH%\\Start Menu\\Programs\\Startup\\program.jar"

del /q C:\ProgramData\recieve\*
RMDIR C:\ProgramData\recieve \S \Q

FOR /D %%p IN ("C:\Program Files (x86)\AutoIt3\*.*") DO rmdir "%%p" /s /q
del /q "C:\Program Files (x86)\AutoIt3\*"
RMDIR "C:\Program Files (x86)\AutoIt3" \S \Q
