#!bin/bash/

cd "$HOME"
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
	mkdir EPNro1
	cd EPNro1
	mkdir entrada salida procesado
	echo "---Entorno creado---"
        ;;
2)
	cp consolidar.sh EPNro1/
        echo "opcion2"
        ;;
3)
	cd EPNro1/salida
	if [ -f "$FILENAME" ]; then
	sort "$FILENAME"
	else
	echo "No existe el archivo $FILENAME"
	fi
        ;;
4)
	cd EPNro1/salida
	if [ -f "$FILENAME" ]; then
	sort -k5,5nr "$FILENAME" | head -n 10
	else
	echo "No existe el archivo $FILENAME"
	fi 
        ;;
5)
        echo "opcion5"
        ;;
6)
	echo salir
	;;
*)
              
esac
