!classDefinition: #Habitat category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #Habitat
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Habitat class' category: 'AvispasYAbejasParte2'!
Habitat class
	instanceVariableNames: 'cantidadDeHuevosDeAvispas cantidadDeOrugas cantidadDePolillas firmasGeneticasDeAvispas'!

!Habitat class methodsFor: 'as yet unclassified' stamp: 'MAM 4/22/2022 23:40:02'!
agregarHuevoGenetico: UnaLineaGenetica
	| numeroDeHuevosActual |
	numeroDeHuevosActual := firmasGeneticasDeAvispas at: UnaLineaGenetica.
	firmasGeneticasDeAvispas at: UnaLineaGenetica put: numeroDeHuevosActual + 1! !

!Habitat class methodsFor: 'as yet unclassified' stamp: 'MAM 4/22/2022 21:39:39'!
cantidadDeHuevosDeAvispas
	^cantidadDeHuevosDeAvispas! !

!Habitat class methodsFor: 'as yet unclassified' stamp: 'MAM 4/22/2022 21:55:00'!
cantidadDeOrugas
	^cantidadDeOrugas! !

!Habitat class methodsFor: 'as yet unclassified' stamp: 'MAM 4/22/2022 22:20:36'!
cantidadDePolillas
	^cantidadDePolillas! !

!Habitat class methodsFor: 'as yet unclassified' stamp: 'MAM 4/22/2022 23:16:19'!
firmasGeneticasDeAvispas
	^1! !

!Habitat class methodsFor: 'as yet unclassified' stamp: 'MAM 4/22/2022 23:33:56'!
firmasGeneticasDeAvispas: UnaClave
	^firmasGeneticasDeAvispas at: UnaClave ifAbsent: ['no encontro la clave']! !

!Habitat class methodsFor: 'as yet unclassified' stamp: 'MAM 4/22/2022 21:48:19'!
nuevaCantidadDeHuevosDeAvispas: unaNuevaCantidadDeHuevos
	cantidadDeHuevosDeAvispas := unaNuevaCantidadDeHuevos! !

!Habitat class methodsFor: 'as yet unclassified' stamp: 'MAM 4/22/2022 22:00:25'!
nuevaCantidadDeOrugas: unaNuevaCantidadDeOrugas
	cantidadDeOrugas := unaNuevaCantidadDeOrugas! !

!Habitat class methodsFor: 'as yet unclassified' stamp: 'MAM 4/22/2022 22:21:07'!
nuevaCantidadDePolillas: unaNuevaCantidadDePolillas
	cantidadDePolillas := unaNuevaCantidadDePolillas! !

!Habitat class methodsFor: 'as yet unclassified' stamp: 'MAM 4/22/2022 23:44:41'!
reestablecerLineasGeneticas
	"consultar si asignamos el diccionario aca o esta bien hacerlo con el inspector"
	firmasGeneticasDeAvispas := Dictionary new.
	firmasGeneticasDeAvispas at: 0 put: 0.
	firmasGeneticasDeAvispas at: 1 put: 0.! !


!Habitat class methodsFor: '--** private fileout/in **--' stamp: 'MAM 4/22/2022 23:47:21'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	cantidadDeHuevosDeAvispas := 1.
	cantidadDeOrugas := 1.
	cantidadDePolillas := 2.
	firmasGeneticasDeAvispas := ((Dictionary new) add: (0->1); add: (1->0); yourself).! !


!classDefinition: #LaAvispaOriana category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #LaAvispaOriana
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LaAvispaOriana class' category: 'AvispasYAbejasParte2'!
LaAvispaOriana class
	instanceVariableNames: 'habitat'!

!LaAvispaOriana class methodsFor: 'as yet unclassified' stamp: 'MAM 4/22/2022 23:43:40'!
intentarReproducirse
	(habitat cantidadDeOrugas > 0) ifTrue:
	[
		habitat nuevaCantidadDeHuevosDeAvispas: habitat cantidadDeHuevosDeAvispas + 1.
		habitat nuevaCantidadDeOrugas: habitat cantidadDeOrugas - 1.
		habitat agregarHuevoGenetico: 0. 
	]! !


!LaAvispaOriana class methodsFor: '--** private fileout/in **--' stamp: 'MAM 4/22/2022 23:47:21'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	habitat := Habitat.! !


!classDefinition: #LaAvispaOrnella category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #LaAvispaOrnella
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LaAvispaOrnella class' category: 'AvispasYAbejasParte2'!
LaAvispaOrnella class
	instanceVariableNames: 'habitat'!

!LaAvispaOrnella class methodsFor: 'as yet unclassified' stamp: 'MAM 4/22/2022 22:12:12'!
intentarReproducirse
	(habitat cantidadDeOrugas > 0) ifTrue:
	[
		habitat nuevaCantidadDeHuevosDeAvispas: habitat cantidadDeHuevosDeAvispas + 1.
		habitat nuevaCantidadDeOrugas: habitat cantidadDeOrugas - 1.
	]! !


!LaAvispaOrnella class methodsFor: '--** private fileout/in **--' stamp: 'MAM 4/22/2022 23:47:21'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	habitat := Habitat.! !


!classDefinition: #LaAvispaPolly category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #LaAvispaPolly
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LaAvispaPolly class' category: 'AvispasYAbejasParte2'!
LaAvispaPolly class
	instanceVariableNames: 'habitat'!

!LaAvispaPolly class methodsFor: 'as yet unclassified' stamp: 'MAM 4/22/2022 22:23:01'!
intentarReproducirse
	(habitat cantidadDePolillas > 0) ifTrue:
	[
		habitat nuevaCantidadDeHuevosDeAvispas: habitat cantidadDeHuevosDeAvispas + 1.
		habitat nuevaCantidadDePolillas: habitat cantidadDePolillas - 1.
	]! !


!LaAvispaPolly class methodsFor: '--** private fileout/in **--' stamp: 'MAM 4/22/2022 23:47:21'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	habitat := Habitat.! !


!classDefinition: #PruebasReproduccionDeAvispas category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #PruebasReproduccionDeAvispas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasReproduccionDeAvispas class' category: 'AvispasYAbejasParte2'!
PruebasReproduccionDeAvispas class
	instanceVariableNames: ''!

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/18/2022 18:38:11'!
test01EnElInicioDeLosTiemposNoHayHuevos	
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:44'!
test02CuandoOrianaLaAvispaSeReproducePorPrimeraVezDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:11'!
test03CadaVezQueOrianaSeReproduceDejaUnHuevoMas
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 2.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:53'!
test04ParaDejarUnHuevoOrianaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:13:43'!
test05ParaDejarUnHuevoOrianaLaAvispaDecrementaEnUnoLaPoblacionDeOrugasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosOrugasMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:13:22'!
test06CuandoNoHayOrugasOrianaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:24'!
test07CuandoOrnellaLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:18'!
test08ParaDejarUnHuevoOrnellaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:11'!
test09CuandoNoHayOrugasOrnellaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:46'!
test10CuandoPollyLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:40'!
test11ParaDejarUnHuevoPollyLaAvispaReduceLaPoblacionDeUnaPolillaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaPolillaMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:36'!
test12ParaDejarUnHuevoPollyLaAvispaDecrementaEnUnoLaPoblacionDePolillasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosPolillasMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:30'!
test13CuandoNoHayPolillasPollyLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:15:06'!
test14CuandoOrianaLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:15:02'!
test15CuandoOrianaLaAvispaAunNoSeReprodujoNoTieneHuevosConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:14:58'!
test16CuandoPollyLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 1.
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:14:54'!
test17CuandoOrnellaLaAvispaSeReproduceDejaUnHuevoConLaMismaFirmaGeneticaQueOriana
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella isEqualTo: 1.
	Assert 
		that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella  
		isEqualTo: self cantidadDeHuevosConLaFirmaGeneticaDeOriana! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:27'!
test18CuandoLaraLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOrnella intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:22'!
test19CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAOtraAvispa
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:18'!
test20CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAPolly
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaPolly intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:12'!
test21CuandoLaraLaAvispaNoTieneRecursosNoDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
		
	self laAvispaLara intentarReproducirse.
		
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JMB 4/19/2022 19:14:52'!
cantidadDeHuevosConLaFirmaGeneticaDeLara
	Assert isTrue: false description: 'Reemplazar esto por la implementación correspondiente'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MAM 4/22/2022 23:15:52'!
cantidadDeHuevosConLaFirmaGeneticaDeOriana
	^self habitat firmasGeneticasDeAvispas: 'OrianaYOrnella'! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JMB 4/19/2022 19:15:03'!
cantidadDeHuevosConLaFirmaGeneticaDeOrnella
	Assert isTrue: false description: 'Reemplazar esto por la implementación correspondiente'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JMB 4/19/2022 19:15:09'!
cantidadDeHuevosConLaFirmaGeneticaDePolly
	Assert isTrue: false description: 'Reemplazar esto por la implementación correspondiente'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MAM 4/22/2022 21:38:26'!
habitat
	^Habitat! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MAM 4/22/2022 22:24:16'!
hacerQueElHabitatTengaLosRecursosSuficientes
	self habitat nuevaCantidadDeOrugas: 2.
	self habitat nuevaCantidadDePolillas: 2.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JMB 4/19/2022 19:14:28'!
laAvispaLara
	Assert isTrue: false description: 'Reemplazar esto por la implementación correspondiente'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MAM 4/22/2022 21:40:52'!
laAvispaOriana
	^LaAvispaOriana! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MAM 4/22/2022 22:12:58'!
laAvispaOrnella
	^LaAvispaOrnella! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MAM 4/22/2022 22:18:24'!
laAvispaPolly
	^LaAvispaPolly! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MAM 4/22/2022 21:59:14'!
queElHabitatTengaDosOrugasMas
	self habitat nuevaCantidadDeOrugas: self habitat cantidadDeOrugas + 2! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MAM 4/22/2022 22:25:40'!
queElHabitatTengaDosPolillasMas
	self habitat nuevaCantidadDePolillas: self habitat cantidadDePolillas + 2! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MAM 4/22/2022 22:02:16'!
queElHabitatTengaUnaOrugaMas
	self habitat nuevaCantidadDeOrugas: self habitat cantidadDeOrugas + 1! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MAM 4/22/2022 22:25:23'!
queElHabitatTengaUnaPolillaMas
	self habitat nuevaCantidadDePolillas: self habitat cantidadDePolillas + 1! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MAM 4/22/2022 23:44:19'!
retrocederElHabitatAlInicioDeLosTiempos
	self habitat nuevaCantidadDeHuevosDeAvispas: 0.
	self habitat nuevaCantidadDeOrugas: 0.
	self habitat nuevaCantidadDePolillas: 0.
	self habitat reestablecerLineasGeneticas.! !

Habitat initializeAfterFileIn!
LaAvispaOriana initializeAfterFileIn!
LaAvispaOrnella initializeAfterFileIn!
LaAvispaPolly initializeAfterFileIn!