# Respuestas a las preguntas para después de hacer el ejercicio 2
Aquí las respuestas de Martin Maddalena y Santiago Langer (grupo 32) sobre el ejercicio número 2 para entregar.

## Abstracción de los tests 01 y 02
> Pregunta: En los test 01 y 02 hay código repetido. Cuando lo extrajeron crearon algo nuevo. Eso es algo que estaba en la realidad y no estaba representado en nuestro código, por eso teníamos código repetido. ¿Cuál es esa entidad de la realidad que crearon?

Creamos un mensaje que generalice una verificación de que una operación _X_ se corra en menos de _Y_ tiempo. Tanto la implementación original como la nuestra cumplían la función de _cronometros_, pero la actual permite introducir tanto una operación cualquiera sobre el _customerBook_ como así tambien una cantidad de milisegundos.
Facilita que la intención de medir el máximo tiempo de ejecución se logre y lea claramente, no con una implementación de por medio.


## Cómo representar en Smalltalk
> Pregunta: ¿Cuáles son las formas en que podemos representar entes de la realidad en Smalltalk que conocés? Es decir, ¿qué cosas del lenguaje Smalltalk puedo usar para representar entidades de la realidad?

Actualmente, para representar entidades de la realidad conocemos tanto a las clases como a los objetos (instancias de clases). Con estos podemos modelar entes de la realidad en relación 1:1.

## Teoría de Naur
> Pregunta: ¿Qué relación hay entre sacar código repetido (creando abstracciones) y la teoría del modelo/sistema (del paper de Naur)?

Limpiar codigo repetido abstrae la implementación del mismo, mejorando la legibilidad y permitiendo leer casi literalmente la teoría del modelo diseñada por los programadores. 
Si el rol de los programadores es diseñar un sistema, el codigo repetido se pone en sus caminos de producir un modelo legible que no se pierda en las minucias e implementaciones de cada lenguaje de programación.