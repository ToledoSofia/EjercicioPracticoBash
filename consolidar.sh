#!bin/bash
cd "$HOME/EPNro1"
if [ -n "$(ls entrada)" ]; then

for archivo in entrada/*; do
	cat  "$archivo" >> salida/"$FILENAME"
	mv "$archivo" procesado/
done
fi
