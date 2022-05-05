# Respuestas a las preguntas para después de hacer el ejercicio
Aquí las respuestas de Martin Maddalena y Santiago Langer (grupo 32) sobre el ejercicio número 1 para entregar.

## Sobre implementar funcionalidad
> Pregunta: Los tests 01, 02 y 03 demuestran la funcionalidad de cómo se incrementa la cantidad de huevos de avispas a medida que los van dejando. Cuando los implementaste, ¿esos tests pasaron (los tres) de una? ¿podrías haber implementado esta funcionalidad de a partes, haciendo que pase el 01, luego el 01 y el 02 y por último el 01, 02 y 03? ¿se te ocurre cómo? Y si lograste hacerlo, ¿qué pensas de implementar esa funcionalidad de esa forma?

No, lo implementamos para que pasase primero una, luego la otra y por último la tercera. 
Por ejemplo, en el test 2 tuvimos que implementar "intentarReproducirse", que no había sido necesario en la prueba 1; o entre el test 2 y el 3 cambiamos cuantas orugas eran _suficientes_, primero una y luego dos.

## Sobre código repetido
> Pregunta: ¿les quedó código repetido? ¿dónde? ¿Se animan a adivinar qué cosa del dominio les faltó representar (y por eso tienen código repetido)? Responsabilidad de dejar un huevo consumiendo otro insecto ¿Quién les quedó, en su modelo, que es el responsable de ver si hay suficientes polillas u orugas y entonces dejar un huevo? ¿el insecto (Polly, Oriana, etc) o el hábitat? ¿por qué? ¿por qué tendría sentido que fuera de la otra forma? ¿con cuál nos quedamos?

Si, se repitió el contenido de "intentarReproducirse" para Oriana, Ornella y Polly, que se reproducen de la misma forma. 
Pero logramos, por ejemplo, en _agregarHuevoALaLineaGeneticaDeAvispas_ evitar repetir codigo recibiendo en la keyword qué codigo genético queríamos agregar, en vez de hacer 3 métodos distintos llamados _agregarHuevoGeneticoDeOrianaYOrnella_, _agregarHuevoGeneticoDePolly_ y _agregarHuevoGeneticoDeLara_.
En nuestro modelo, el chequeo de revisar si hay comida suficiente sucede en los objetos de las avispas, en los "intentarReproducirse". Creemos que es lo correcto porque son estas avispas en la realidad las que logran dejar un huevo o no según si hay suficiente alimento en el habitat.

## Sobre código repetido 2. 
> Pregunta: Con lo que vimos en la clase del Jueves (en la parte teórica, prototipos vs clases) ¿cómo sacarían este código? Sobre la implementación ¿cómo resolvieron guardar los huevos? ¿Usaron colecciones? ¿Diccionarios? ¿Uno, varios? ¿con qué indexaban? Pero la pregunta más importante: ¿es lo más sencillo que hacía falta? ¿o se podía hacer menos y todo andaba?

Para guardar los huevos usamos un diccionario, que tenía como indices el nombre de la linea genética. Podríamos haber utilizado varios colaboradores internos (para cada linea genética) pero un diccionario nos pareció más sencillo y ordenado. 
Prueba Santiago Github
