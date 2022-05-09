## Aporte de los mensajes de DD
En double dispatch, el primer llamado nos envía a la subclase correspondiente al primer parametro, y el segundo llamado (que sale desde el primero) nos envía a la subclase correpondiente al segundo parametro.

## Lógica de instanciado
Interpretamos que lo mejor es crear la instancia del objeto desde su misma subclase. Esto nos parece lo mejor para delegar a esa misma clase la creación de las instancias de sus objetos. 
Este es el caso en la parte 2 del ejercicio, donde el método with: está en "Entero" y with:over: está en "Fracción".
Si se crea ese objeto en otro lugar, su superclase por ejemplo, funcionaría pero sería desordenado. Se estaría permitiendo que clases que no corresponden a la propia creen instancias de ella (por ejemplo que "Numero" cree instancias de "Fracción" cuando eso ya sucede desde "Fracción").
Para resolverlo y mantenerlo ordenado siempre deberían instanciarse objetos desde su clase correspondiente.

## Nombres de las categorías de métodos
Tenemos dos grandes categorías, públicos y privados. En ambas, luego, clasificamos específicamente según a qué corresponden (y asumimos que aquellos que no están declarados como privados son públicos).
En este ejercicio por ejemplo, todos los métodos auxiliares que creamos para hacer Double Dispatch los marcamos como "auxiliariesDoubleDispatch-private" ya que no es nuestra intención que sean accesibles al exterior de la clase (son private) y ordenamos qué hacen (son auxiliares para DoubleDispatch "auxiliariesDoubleDispatch")

## Subclass Responsability
Estamos siendo declarativos. En la superclase sólo declaramos que algo se hace, mientras se delega a cada subclase cómo se implementa. 
Además, al dejar en claro las responsabilidades en SmallTalk, si alguna vez nos olvidamos de declarar la implementación del cómo en una subclase, en Smalltalk la superclase nos marcará el error. Encontrará que es responsabilidad de la subclase, pero que la misma no tiene una implementación del mensaje.

## No rompas
Romper el encapsulamiento nos forzaría a modificar todas las partes del código en las que hayamos dejado expuesto el comportamiento de nuestro objeto.
Mantener el encapsulamiento facilita el mantenimiento y escalabilidad del código y el programa.