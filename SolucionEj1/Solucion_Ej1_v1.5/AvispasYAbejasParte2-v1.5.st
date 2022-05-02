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

!Habitat class methodsFor: 'obtenerCantidades' stamp: 'MAM 4/24/2022 10:11:52'!
cantidadDeHuevosDeAvispas
	^cantidadDeHuevosDeAvispas! !

!Habitat class methodsFor: 'obtenerCantidades' stamp: 'MAM 4/24/2022 12:15:09'!
cantidadDeHuevosDeLaLineaGeneticaDeAvispas: UnaLineaGeneticaDeAvispas
	^firmasGeneticasDeAvispas at: UnaLineaGeneticaDeAvispas ifAbsent: ['no se ha encontrado la clave']! !

!Habitat class methodsFor: 'obtenerCantidades' stamp: 'MAM 4/24/2022 10:12:15'!
cantidadDeOrugas
	^cantidadDeOrugas! !

!Habitat class methodsFor: 'obtenerCantidades' stamp: 'MAM 4/24/2022 10:12:19'!
cantidadDePolillas
	^cantidadDePolillas! !


!Habitat class methodsFor: 'privado - modificarCantidades' stamp: 'MAM 4/24/2022 12:22:15'!
agregarUnHuevoALaLineaGeneticaDeAvispas: UnaLineaGenetica
	| numeroDeHuevosActual |
	numeroDeHuevosActual := firmasGeneticasDeAvispas at: UnaLineaGenetica.
	firmasGeneticasDeAvispas at: UnaLineaGenetica put: numeroDeHuevosActual + 1! !

!Habitat class methodsFor: 'privado - modificarCantidades' stamp: 'MAM 4/24/2022 10:12:26'!
nuevaCantidadDeHuevosDeAvispas: unaNuevaCantidadDeHuevos
	cantidadDeHuevosDeAvispas := unaNuevaCantidadDeHuevos! !

!Habitat class methodsFor: 'privado - modificarCantidades' stamp: 'MAM 4/24/2022 10:12:33'!
nuevaCantidadDeOrugas: unaNuevaCantidadDeOrugas
	cantidadDeOrugas := unaNuevaCantidadDeOrugas! !

!Habitat class methodsFor: 'privado - modificarCantidades' stamp: 'MAM 4/24/2022 10:12:37'!
nuevaCantidadDePolillas: unaNuevaCantidadDePolillas
	cantidadDePolillas := unaNuevaCantidadDePolillas! !

!Habitat class methodsFor: 'privado - modificarCantidades' stamp: 'MAM 4/24/2022 12:27:28'!
quitarUnHuevoALaLineaGeneticaDeAvispas: UnaLineaGenetica
	| numeroDeHuevosActual |
	numeroDeHuevosActual := firmasGeneticasDeAvispas at: UnaLineaGenetica.
	firmasGeneticasDeAvispas at: UnaLineaGenetica put: numeroDeHuevosActual - 1! !

!Habitat class methodsFor: 'privado - modificarCantidades' stamp: 'SL 4/24/2022 19:40:08'!
reestablecerLineasGeneticas
	firmasGeneticasDeAvispas := Dictionary new.
	firmasGeneticasDeAvispas at: 'firmaGeneticaDeOrianaYOrnella' put: 0.
	firmasGeneticasDeAvispas at: 'firmaGeneticaDePolly' put: 0.
	firmasGeneticasDeAvispas at: 'firmaGeneticaDeLara' put: 0.! !


!Habitat class methodsFor: 'public' stamp: 'SL 4/24/2022 19:39:09'!
retrocederTodoElHabitatAlInicio
	self nuevaCantidadDeHuevosDeAvispas: 0.
	self nuevaCantidadDeOrugas: 0.
	self nuevaCantidadDePolillas: 0.
	self reestablecerLineasGeneticas.! !


!Habitat class methodsFor: '--** private fileout/in **--' stamp: 'MAM 4/25/2022 15:25:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	cantidadDeHuevosDeAvispas := 0.
	cantidadDeOrugas := 0.
	cantidadDePolillas := 0.
	firmasGeneticasDeAvispas := ((Dictionary new) add: ('firmaGeneticaDeLara'->0); add: ('firmaGeneticaDeOrianaYOrnella'->0); add: ('firmaGeneticaDePolly'->0); yourself).! !


!classDefinition: #LaAvispaLara category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #LaAvispaLara
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LaAvispaLara class' category: 'AvispasYAbejasParte2'!
LaAvispaLara class
	instanceVariableNames: 'habitat'!

!LaAvispaLara class methodsFor: 'public' stamp: 'SL 4/24/2022 19:34:56'!
intentarReproducirse
	| cantidadDeHuevosDeOrianaYOrnella cantidadDeHuevosDePolly cantidadDeHuevosTotalesParaRobar |
	
	cantidadDeHuevosDeOrianaYOrnella := habitat cantidadDeHuevosDeLaLineaGeneticaDeAvispas: 'firmaGeneticaDeOrianaYOrnella'.
	cantidadDeHuevosDePolly := habitat cantidadDeHuevosDeLaLineaGeneticaDeAvispas: 'firmaGeneticaDePolly'.
	cantidadDeHuevosTotalesParaRobar := cantidadDeHuevosDeOrianaYOrnella + cantidadDeHuevosDePolly.
	
	(cantidadDeHuevosTotalesParaRobar > 0) ifTrue:
	[
		"Según esta implementación, Lara intenta robar un huevo de la línea genética de Oriana y Ornella; solo en el caso que no haya huevos de esta linea, roba a la de Polly"
		(cantidadDeHuevosDeOrianaYOrnella > 0) 
		ifTrue: 
			[habitat quitarUnHuevoALaLineaGeneticaDeAvispas: 'firmaGeneticaDeOrianaYOrnella'] 
		ifFalse: 
			[habitat quitarUnHuevoALaLineaGeneticaDeAvispas: 'firmaGeneticaDePolly'].
		habitat agregarUnHuevoALaLineaGeneticaDeAvispas: 'firmaGeneticaDeLara'.
	]! !


!LaAvispaLara class methodsFor: '--** private fileout/in **--' stamp: 'MAM 4/25/2022 15:25:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	habitat := Habitat.! !


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

!LaAvispaOriana class methodsFor: 'public' stamp: 'MAM 4/24/2022 12:22:15'!
intentarReproducirse
	(habitat cantidadDeOrugas > 0) ifTrue:
	[
		habitat nuevaCantidadDeHuevosDeAvispas: habitat cantidadDeHuevosDeAvispas + 1.
		habitat nuevaCantidadDeOrugas: habitat cantidadDeOrugas - 1.
		habitat agregarUnHuevoALaLineaGeneticaDeAvispas: 'firmaGeneticaDeOrianaYOrnella'.
	]! !


!LaAvispaOriana class methodsFor: '--** private fileout/in **--' stamp: 'MAM 4/25/2022 15:25:44'!
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

!LaAvispaOrnella class methodsFor: 'public' stamp: 'MAM 4/24/2022 12:24:45'!
intentarReproducirse
	(habitat cantidadDeOrugas > 0) ifTrue:
	[
		habitat nuevaCantidadDeHuevosDeAvispas: habitat cantidadDeHuevosDeAvispas + 1.
		habitat nuevaCantidadDeOrugas: habitat cantidadDeOrugas - 1.
		habitat agregarUnHuevoALaLineaGeneticaDeAvispas: 'firmaGeneticaDeOrianaYOrnella'.
	]! !


!LaAvispaOrnella class methodsFor: '--** private fileout/in **--' stamp: 'MAM 4/25/2022 15:25:44'!
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

!LaAvispaPolly class methodsFor: 'public' stamp: 'MAM 4/24/2022 12:22:15'!
intentarReproducirse
	(habitat cantidadDePolillas > 0) ifTrue:
	[
		habitat nuevaCantidadDeHuevosDeAvispas: habitat cantidadDeHuevosDeAvispas + 1.
		habitat nuevaCantidadDePolillas: habitat cantidadDePolillas - 1.
		habitat agregarUnHuevoALaLineaGeneticaDeAvispas: 'firmaGeneticaDePolly'.
	]! !


!LaAvispaPolly class methodsFor: '--** private fileout/in **--' stamp: 'MAM 4/25/2022 15:25:44'!
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

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'MAM 4/24/2022 09:38:07'!
test01EnElInicioDeLosTiemposNoHayHuevos	
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'MAM 4/24/2022 09:39:02'!
test02CuandoOrianaLaAvispaSeReproducePorPrimeraVezDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'MAM 4/24/2022 09:41:13'!
test03CadaVezQueOrianaSeReproduceDejaUnHuevoMas
	self retrocederElHabitatAlInicioDeLosTiempos.
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 2.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'MAM 4/24/2022 09:42:11'!
test04ParaDejarUnHuevoOrianaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'MAM 4/24/2022 09:42:29'!
test05ParaDejarUnHuevoOrianaLaAvispaDecrementaEnUnoLaPoblacionDeOrugasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosOrugasMas.
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'MAM 4/24/2022 09:42:43'!
test06CuandoNoHayOrugasOrianaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'MAM 4/24/2022 09:43:14'!
test07CuandoOrnellaLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos.
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'MAM 4/24/2022 09:43:37'!
test08ParaDejarUnHuevoOrnellaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'MAM 4/24/2022 09:43:53'!
test09CuandoNoHayOrugasOrnellaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'MAM 4/24/2022 09:44:34'!
test10CuandoPollyLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'MAM 4/24/2022 09:45:02'!
test11ParaDejarUnHuevoPollyLaAvispaReduceLaPoblacionDeUnaPolillaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaPolillaMas.
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'MAM 4/24/2022 09:45:15'!
test12ParaDejarUnHuevoPollyLaAvispaDecrementaEnUnoLaPoblacionDePolillasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosPolillasMas.
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'MAM 4/24/2022 09:45:25'!
test13CuandoNoHayPolillasPollyLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'MAM 4/24/2022 09:45:50'!
test14CuandoOrianaLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'MAM 4/24/2022 10:00:00'!
test15CuandoOrianaLaAvispaAunNoSeReprodujoNoTieneHuevosConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'MAM 4/24/2022 10:00:25'!
test16CuandoPollyLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos.
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 1.
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'MAM 4/24/2022 10:02:16'!
test17CuandoOrnellaLaAvispaSeReproduceDejaUnHuevoConLaMismaFirmaGeneticaQueOriana
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOrnella intentarReproducirse.
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella isEqualTo: 1.
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella  isEqualTo: self cantidadDeHuevosConLaFirmaGeneticaDeOriana! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'MAM 4/24/2022 10:05:13'!
test18CuandoLaraLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOrnella intentarReproducirse.
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'MAM 4/24/2022 10:25:35'!
test19CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAOtraAvispa
	self retrocederElHabitatAlInicioDeLosTiempos.
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'MAM 4/24/2022 10:25:59'!
test20CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAPolly
	self retrocederElHabitatAlInicioDeLosTiempos.
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaPolly intentarReproducirse.
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'MAM 4/24/2022 10:26:31'!
test21CuandoLaraLaAvispaNoTieneRecursosNoDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos.
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MAM 4/24/2022 12:15:45'!
cantidadDeHuevosConLaFirmaGeneticaDeLara
	^self habitat cantidadDeHuevosDeLaLineaGeneticaDeAvispas: 'firmaGeneticaDeLara'! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MAM 4/24/2022 12:15:49'!
cantidadDeHuevosConLaFirmaGeneticaDeOriana
	^self habitat cantidadDeHuevosDeLaLineaGeneticaDeAvispas: 'firmaGeneticaDeOrianaYOrnella'! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MAM 4/24/2022 12:15:54'!
cantidadDeHuevosConLaFirmaGeneticaDeOrnella
	^self habitat cantidadDeHuevosDeLaLineaGeneticaDeAvispas: 'firmaGeneticaDeOrianaYOrnella'! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MAM 4/24/2022 12:15:59'!
cantidadDeHuevosConLaFirmaGeneticaDePolly
	^self habitat cantidadDeHuevosDeLaLineaGeneticaDeAvispas: 'firmaGeneticaDePolly'! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MAM 4/24/2022 10:03:03'!
habitat
	^Habitat! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MAM 4/24/2022 09:39:39'!
hacerQueElHabitatTengaLosRecursosSuficientes
	self habitat nuevaCantidadDeOrugas: 2.
	self habitat nuevaCantidadDePolillas: 2.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MAM 4/24/2022 10:04:57'!
laAvispaLara
	^LaAvispaLara! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MAM 4/24/2022 10:03:12'!
laAvispaOriana
	^LaAvispaOriana! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MAM 4/24/2022 10:03:15'!
laAvispaOrnella
	^LaAvispaOrnella! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MAM 4/24/2022 10:03:18'!
laAvispaPolly
	^LaAvispaPolly! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MAM 4/24/2022 10:03:21'!
queElHabitatTengaDosOrugasMas
	self habitat nuevaCantidadDeOrugas: self habitat cantidadDeOrugas + 2! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MAM 4/24/2022 10:03:24'!
queElHabitatTengaDosPolillasMas
	self habitat nuevaCantidadDePolillas: self habitat cantidadDePolillas + 2! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MAM 4/24/2022 10:03:29'!
queElHabitatTengaUnaOrugaMas
	self habitat nuevaCantidadDeOrugas: self habitat cantidadDeOrugas + 1! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MAM 4/24/2022 10:03:33'!
queElHabitatTengaUnaPolillaMas
	self habitat nuevaCantidadDePolillas: self habitat cantidadDePolillas + 1! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'SL 4/24/2022 19:37:33'!
retrocederElHabitatAlInicioDeLosTiempos
	self habitat retrocederTodoElHabitatAlInicio.! !

Habitat initializeAfterFileIn!
LaAvispaLara initializeAfterFileIn!
LaAvispaOriana initializeAfterFileIn!
LaAvispaOrnella initializeAfterFileIn!
LaAvispaPolly initializeAfterFileIn!