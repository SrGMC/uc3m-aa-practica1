# Práctica 1

Repositorio para la práctica 1 realizado por Álvaro Galisteo ([@SrGMC](https://github.com/SrGMC)) y Alejandro Massotti ([@alex19malop](https://github.com/alex19malop))

## Modelos

Los modelos se podrán encontrar en el directorio `models`. Están ordenados por fase, conjunto de atributos y agente.

## Datos en bruto

Los datos en bruto se encuentran en los dos archivos de Excel en el directorio `excel`

## Herramientas

Las herramientas usadas en la práctica son las siguientes:

- `generateData.sh`: Permite generar instancias automáticamente. Es necesario que este _script_ se ejecute desde el mismo directorio que `busters.py`. Cuando se ejecute, aparecerán ventanas de PacMan con control por teclado que se deberán jugar hasta que el script considere que las instancias generadas son las suficientes. La salida de los test aparecerán en el directorio `weka_data`
- `fase3_extract_data.js`: Genera medias, modas y desviaciones estándar a partir de los datos provistos en JSON. Estos datos generados en JSON han sido exportados directamente desde Excel. Los datos generados se pueden observar en el documento `Fase3.xlsx`
