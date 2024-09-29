# Ejercicio API

La página usada fue https://petstore.swagger.io/, sin embargo, la versión 1 respondió con 404, al hacer el ejercicio dentro de la 
página la URL actual indicada es https://petstore.swagger.io/v2/ así que se actualizó a dicha URL


Cada uno de los escenarios tiene un tag que los diferencia en caso de querer correrlos de manera independiente. 

El ejercicio está conformado por un feature, el cual contiene los 4 escenarios y un background para todos, en el cual se define 
la url y los diferentes paths.

Adicional contiene dos json, cada una de ellos es para un escenario distinto, el primero para crear y el segundo para actualizar.


Para el proyecto se utilizó en Maven 3.8.1
Version Java 17
IntelliJ IDEA 2022.3.3

Para correr el ejercicio se debe correr desde ExamplesTest
Clic derecho en ExamplesTest y run 

El reporte se puede obtener en 
\target\karate-reports\karate-summary.html