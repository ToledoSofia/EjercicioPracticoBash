#!bin/bash/
if [ "$1" = "-d" ]; then
  rm -rf "$HOME/EPNro1"
  pkill -f consolidar.sh
fi
while true; do
cd "$HOME"
echo "----------------------------------------"
echo "Elije una opcion"
echo "1) Crear entorno"
echo "2) Correr proceso"
echo "3) Mostrar listado de alumnos"
echo "4) Mostrar top 10 notas"
echo "5) Mostrar datos por nro de padron"
echo "6) Salir"

read opcion

case "$opcion" in
1)
	mkdir -p EPNro1
	cd EPNro1
	mkdir -p entrada salida procesado
	echo "---Entorno creado---"
        ;;
2)
	if [ -d "EPNro1" ]; then
 	 cp consolidar.sh EPNro1/
	 cd EPNro1
	 chmod +x consolidar.sh
	 bash consolidar.sh &
         echo "---Corriendo Proceso---"
	else
	 echo "Todavia no existe el entorno"
	fi
        ;;
3)
	cd EPNro1/salida
	if [ -f "$FILENAME" ]; then
	echo "---Listado de Alumnos---"
	sort "$FILENAME"
	else
	echo "No existe el archivo $FILENAME"
	fi
        ;;
4)
	cd EPNro1/salida
	if [ -f "$FILENAME" ]; then
	echo "---Top 10 Notas---"
	sort -k5,5nr "$FILENAME" | head -n 10
	else
	echo "No existe el archivo $FILENAME"
	fi 
        ;;
5)
	echo "Ingrese un nro de padrón"
	read padron
	echo "---Datos del alumno---"
	if grep "^$padron" "EPNro1/salida/$FILENAME"; then
	:
	else
	echo  "No se encontro un alumno con ese nro"
        fi
	;;
6)
	echo "---Saliendo---"
	break
	;;
*)
              
esac
done
