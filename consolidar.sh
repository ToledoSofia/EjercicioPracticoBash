#!bin/bash
cd "$HOME"/EPNro1
for archivo in entrada/*; do
	cat  "$archivo" >> salida/"$FILENAME"
	mv "$archivo" procesado/
done
