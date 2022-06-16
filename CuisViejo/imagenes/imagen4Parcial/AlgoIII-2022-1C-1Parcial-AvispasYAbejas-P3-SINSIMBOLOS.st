!classDefinition: #CicloReproductivoDeAvispasTest category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!
TestCase subclass: #CicloReproductivoDeAvispasTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!

!CicloReproductivoDeAvispasTest methodsFor: 'tests' stamp: 'JMB 5/20/2022 19:43:18'!
test01EnElInicioDeLosTiemposHayUnaCantidadDeAvispasVivas

	| unHabitat |
	unHabitat := Habitat conAvispasComeOrugas: 2.	
	self assert: 2 equals: unHabitat cantidadDeAvispasVivas.
	! !

!CicloReproductivoDeAvispasTest methodsFor: 'tests' stamp: 'JMB 5/20/2022 19:43:26'!
test02EnElInicioDeLosTiemposNoHayHuevosDeAvispas

	| unHabitat |
	unHabitat := Habitat conAvispasComeOrugas: 2.	
	self assert: 0 equals: unHabitat cantidadDeHuevosDeAvispas.! !

!CicloReproductivoDeAvispasTest methodsFor: 'tests' stamp: 'JMB 5/20/2022 19:43:39'!
test03LasAvispasMuerenAlCambiarDeAño
	| unHabitat |
	unHabitat := Habitat conAvispasComeOrugas: 2.	
	
	unHabitat avanzarUnAño.
	
	self assert: 0 equals: unHabitat cantidadDeAvispasVivas.
	! !

!CicloReproductivoDeAvispasTest methodsFor: 'tests' stamp: 'JMB 5/20/2022 19:44:52'!
test04AlReproducirseUnaAvispaAlSiguienteAñoGestanUnaAvispaDescendiente
	| unHabitat avispaQueDejaUnHuevo |
	unHabitat := Habitat conAvispasComeOrugas: 2.	
	unHabitat gestarCantidadDeOrugas: 1.
	avispaQueDejaUnHuevo := unHabitat avispas first.
	avispaQueDejaUnHuevo intentarReproducirse.
	
	unHabitat avanzarUnAño.
	
	self assert: 1 equals: unHabitat cantidadDeAvispasVivas.
	! !

!CicloReproductivoDeAvispasTest methodsFor: 'tests' stamp: 'JMB 5/20/2022 19:47:23'!
test05ReproducirseUnaAvispaAlSiguienteAñoGestanUnaAvispaDescendientePeroNoPuedeGestarNingunaAlOtroAño
	| habitat avispaQueDejaUnaCria |
	habitat := Habitat conAvispasComeOrugas: 2.	
	habitat gestarCantidadDeOrugas: 1.
	avispaQueDejaUnaCria := habitat avispas first.
	avispaQueDejaUnaCria intentarReproducirse.
	
	habitat avanzarUnAño.
	habitat avanzarUnAño.
	
	self assert: 0 equals: habitat cantidadDeAvispasVivas.
	! !

!CicloReproductivoDeAvispasTest methodsFor: 'tests' stamp: 'JMB 5/20/2022 19:35:59'!
test06AlReproducirseUnaAvispaComeOrugasAlSiguienteAñoGestanUnaDescendienteDeSuFirmaGenetica
	| habitat avispaQueDejaUnHuevo |
	habitat := Habitat conAvispasComeOrugas: 2.	
	habitat gestarCantidadDeOrugas: 1.
	avispaQueDejaUnHuevo := habitat avispas first.
	avispaQueDejaUnHuevo intentarReproducirse.
	
	habitat avanzarUnAño.
	
	self assert: 1 equals: (habitat cantidadDeAvispasVivasCumplanCon: [ : unaAvispa | unaAvispa firmaGenetica = avispaQueDejaUnHuevo firmaGenetica ]).
	! !

!CicloReproductivoDeAvispasTest methodsFor: 'tests' stamp: 'JMB 5/20/2022 19:37:40'!
test07AlReproducirseUnaAvispaComePolillasAlSiguienteAñoGestanUnaDescendienteDeSuFirmaGenetica
	| habitat avispaQueDejaUnHuevo |
	habitat := Habitat conAvispasComePolillas: 2.	
	habitat gestarCantidadDePolillas: 1.
	avispaQueDejaUnHuevo := habitat avispas first.
	avispaQueDejaUnHuevo intentarReproducirse.
	
	habitat avanzarUnAño.
	
	self assert: 1 equals: (habitat cantidadDeAvispasVivasCumplanCon: [ : unaAvispa | unaAvispa firmaGenetica = avispaQueDejaUnHuevo firmaGenetica ]).
	! !

!CicloReproductivoDeAvispasTest methodsFor: 'tests' stamp: 'sL 5/21/2022 15:02:48'!
test08AlReproducirseUnaAvispaLadronaAlSiguienteAñoGestanUnaDescendienteDeSuFirmaGenetica
	| habitat avispaQueDejaUnHuevo avispaQueRoba |
	habitat := Habitat conAvispasComeOrugas: 1 ladronas: 	1.
	habitat gestarCantidadDeOrugas: 1.
	avispaQueDejaUnHuevo := (habitat elegirAvispasQueCumplanCon: [: cadaAvispa | cadaAvispa class = ComeOrugas]) first.
	avispaQueRoba := (habitat elegirAvispasQueCumplanCon: [: cadaAvispa | cadaAvispa class = Ladrona]) first.
	avispaQueDejaUnHuevo intentarReproducirse.
	avispaQueRoba intentarReproducirse.
	
	habitat avanzarUnAño.
	
	self assert: 1 equals: (habitat cantidadDeAvispasVivasCumplanCon: [ : unaAvispa | unaAvispa firmaGenetica = avispaQueRoba firmaGenetica ]).
	! !


!classDefinition: #ReproduccionAvispasTests category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!
TestCase subclass: #ReproduccionAvispasTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!

!ReproduccionAvispasTests methodsFor: 'avispas come orugas' stamp: 'sL 5/21/2022 16:05:56'!
test01CuandoUnAvispaComeOrugasSeReproducePorPrimeraVezDejaUnHuevo
	
	self assertQueUnaAvispaComeOrugasCon: 1 OrugasEnElHabitatQueIntentaReproducirse: 1 VecesPoneElNumeroDeHuevos: 1 ! !

!ReproduccionAvispasTests methodsFor: 'avispas come orugas' stamp: 'sL 5/21/2022 16:05:56'!
test02CadaVezQueUnaAvispaComeOrugasSeReproduceDejaUnHuevoMas

	self assertQueUnaAvispaComeOrugasCon: 2 OrugasEnElHabitatQueIntentaReproducirse: 2 VecesPoneElNumeroDeHuevos: 2! !

!ReproduccionAvispasTests methodsFor: 'avispas come orugas' stamp: 'sL 5/21/2022 16:05:38'!
test03ParaDejarUnHuevoUnaAvispaComeOrugasReduceLaPoblacionDeUnaOrugaANinguna
	
	self assertQueUnaAvispaComeOrugasCon: 1 OrugasEnElHabitatQueIntentaReproducirse: 1 VecesDejaEnElHabitatElNumeroDeOrugas: 0.! !

!ReproduccionAvispasTests methodsFor: 'avispas come orugas' stamp: 'sL 5/21/2022 16:07:43'!
test04ParaDejarUnHuevoUnaAvispaComeOrugasDecrementaEnUnoLaPoblacionDeOrugasDelHabitat
	
	| primerNumeroDeHuevos |
	
	primerNumeroDeHuevos := 2.
	
	self assertQueUnaAvispaComeOrugasCon: primerNumeroDeHuevos OrugasEnElHabitatQueIntentaReproducirse: 1 VecesDejaEnElHabitatElNumeroDeOrugas: primerNumeroDeHuevos - 1.! !

!ReproduccionAvispasTests methodsFor: 'avispas come orugas' stamp: 'sL 5/21/2022 16:05:56'!
test05CuandoNoHayOrugasUnaAvispaComeOrugasNoPuedeDejarHuevos
	
	self assertQueUnaAvispaComeOrugasCon: 0 OrugasEnElHabitatQueIntentaReproducirse: 1 VecesPoneElNumeroDeHuevos: 0! !


!ReproduccionAvispasTests methodsFor: 'avispas come polillas' stamp: 'sL 5/21/2022 16:06:19'!
test06CuandoUnaAvispaComePolillasSeReproduceDejaUnHuevo
	
	self assertQueUnaAvispaComePolillasCon: 1 PolillasEnElHabitatQueIntentaReproducirse: 1 VecesPoneElNumeroDeHuevos: 1! !

!ReproduccionAvispasTests methodsFor: 'avispas come polillas' stamp: 'sL 5/21/2022 16:06:08'!
test07ParaDejarUnHuevoUnaAvispaComePolillasReduceLaPoblacionDeUnaPolillaANinguna
	
	self assertQueUnaAvispaComePolillasCon: 1 PolillasEnElHabitatQueIntentaReproducirse: 1 VecesDejaEnElHabitatElNumeroDePolillas: 0.! !

!ReproduccionAvispasTests methodsFor: 'avispas come polillas' stamp: 'sL 5/21/2022 16:08:45'!
test08ParaDejarUnHuevoUnaAvispaComePolillasDecrementaEnUnoLaPoblacionDePolillasDelHabitat

	| primerNumeroDeHuevos |
	
	primerNumeroDeHuevos := 2.
	
	self assertQueUnaAvispaComePolillasCon: primerNumeroDeHuevos PolillasEnElHabitatQueIntentaReproducirse: 1 VecesDejaEnElHabitatElNumeroDePolillas: primerNumeroDeHuevos - 1.! !

!ReproduccionAvispasTests methodsFor: 'avispas come polillas' stamp: 'sL 5/21/2022 16:06:19'!
test09CuandoNoHayPolillasUnaAvispaComePolillasNoPuedeDejarHuevos
	
	self assertQueUnaAvispaComePolillasCon: 0 PolillasEnElHabitatQueIntentaReproducirse: 1 VecesPoneElNumeroDeHuevos: 0! !


!ReproduccionAvispasTests methodsFor: 'firma genetica' stamp: 'JMB 5/20/2022 01:12:57'!
test10CuandoUnaAvispaComeOrugasSeReproduceDejaUnHuevoConSuFirmaGenetica
	| unHabitat unaAvispaAReproducirse |
	unHabitat := Habitat conAvispasComeOrugas: 1.
	unHabitat gestarCantidadDeOrugas: 1.
	unaAvispaAReproducirse := (self elegirAvispasComeOrugasDe: unHabitat) first.
	
	unaAvispaAReproducirse intentarReproducirse.
	
	self assert: 1 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaAReproducirse firmaGenetica).! !

!ReproduccionAvispasTests methodsFor: 'firma genetica' stamp: 'JMB 5/20/2022 01:12:57'!
test11CuandoUnaAvispaComeOrugasAunNoSeReprodujoNoTieneHuevosConSuFirmaGenetica
	| unHabitat unaAvispaAReproducirse |
	unHabitat := Habitat conAvispasComeOrugas: 1.
	unaAvispaAReproducirse := (self elegirAvispasComeOrugasDe: unHabitat) first.
	
	unaAvispaAReproducirse intentarReproducirse.
	
	self assert: 0 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaAReproducirse firmaGenetica).! !

!ReproduccionAvispasTests methodsFor: 'firma genetica' stamp: 'JMB 5/20/2022 21:36:24'!
test12CuandoUnaAvispaComePolillasSeReproduceDejaUnHuevoConSuFirmaGenetica
	| unHabitat unaAvispaComePolillas unaAvispaComeOrugas |
	unHabitat := Habitat conAvispasComeOrugas: 1 comePolillas: 1.
	unHabitat gestarCantidadDePolillas: 1.
	unaAvispaComePolillas := (self elegirAvispasComePolillasDe: unHabitat) first.
	unaAvispaComeOrugas := (self elegirAvispasComeOrugasDe: unHabitat) first.
	
	unaAvispaComePolillas intentarReproducirse.
	
	self assert: 1 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaComePolillas firmaGenetica).
	self assert: 0 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaComeOrugas firmaGenetica).! !

!ReproduccionAvispasTests methodsFor: 'firma genetica' stamp: 'JMB 5/20/2022 01:12:57'!
test13DosAvispasDelMismoTipoDejanHuevosDeLaMismaLineaGenetica
	| unHabitat unaAvispaComeOrugas otraAvispaComeOrugas |
	unHabitat := Habitat conAvispasComeOrugas: 2.
	unHabitat gestarCantidadDeOrugas: 1.
	unaAvispaComeOrugas := (self elegirAvispasComeOrugasDe: unHabitat) first.
	otraAvispaComeOrugas := (self elegirAvispasComeOrugasDe: unHabitat) last.
	
	unaAvispaComeOrugas intentarReproducirse.
	
	self assert: 1 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaComeOrugas firmaGenetica).
	self assert: 1 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: otraAvispaComeOrugas firmaGenetica).! !


!ReproduccionAvispasTests methodsFor: 'avispas ladronas' stamp: 'JMB 5/20/2022 01:14:14'!
test14CuandoUnaAvispaLadronaSeReproduceDejaUnHuevoConSuFirmaGenetica
	| unHabitat unaAvispaASerRobada unaAvispaLadrona |
	unHabitat := Habitat conAvispasComeOrugas: 1 ladronas: 1.
	unHabitat gestarCantidadDeOrugas: 1.
	unaAvispaASerRobada := (self elegirAvispasComeOrugasDe: unHabitat) first.
	unaAvispaLadrona := (self elegirAvispasLadronasDe: unHabitat) first.
	unaAvispaASerRobada intentarReproducirse.
	 
	unaAvispaLadrona intentarReproducirse.
	
	self assert: 1 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaLadrona firmaGenetica).! !

!ReproduccionAvispasTests methodsFor: 'avispas ladronas' stamp: 'JMB 5/20/2022 01:14:14'!
test15CuandoUnaAvispaLadronaSeReproduceLeSacaUnHuevoAOtraAvispa
	| unHabitat unaAvispaASerRobada unaAvispaLadrona |
	unHabitat := Habitat conAvispasComeOrugas: 1 ladronas: 1.
	unHabitat gestarCantidadDeOrugas: 1.
	unaAvispaASerRobada := (self elegirAvispasComeOrugasDe: unHabitat) first.
	unaAvispaLadrona := (self elegirAvispasLadronasDe: unHabitat) first.
	unaAvispaASerRobada intentarReproducirse.
	 
	unaAvispaLadrona intentarReproducirse.
	
	self assert: 0 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaASerRobada firmaGenetica).! !

!ReproduccionAvispasTests methodsFor: 'avispas ladronas' stamp: 'JMB 5/20/2022 01:14:14'!
test16CuandoUnaAvispaLadronaSeReproduceSoloRobaUnHuevo
	| unHabitat unaAvispaASerRobada unaAvispaLadrona |
	unHabitat := Habitat conAvispasComeOrugas: 1 ladronas: 1.
	unHabitat gestarCantidadDeOrugas: 2.
	unaAvispaASerRobada := (self elegirAvispasComeOrugasDe: unHabitat) first.
	unaAvispaLadrona := (self elegirAvispasLadronasDe: unHabitat) first.
	unaAvispaASerRobada intentarReproducirse.
	unaAvispaASerRobada intentarReproducirse.
	 
	unaAvispaLadrona intentarReproducirse.
	
	self assert: 1 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaASerRobada firmaGenetica).! !

!ReproduccionAvispasTests methodsFor: 'avispas ladronas' stamp: 'JMB 5/20/2022 01:14:14'!
test17CuandoUnaAvispaLadronaNoTieneRecursosNoDejaUnHuevo
	| unHabitat unaAvispaLadrona |
	unHabitat := Habitat conAvispasComeOrugas: 1 ladronas: 1.
	unaAvispaLadrona := (self elegirAvispasLadronasDe: unHabitat) first.
	 
	unaAvispaLadrona intentarReproducirse.
	
	self assert: 0 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaLadrona firmaGenetica).! !


!ReproduccionAvispasTests methodsFor: 'avispas ladronas - selectivas' stamp: 'JMB 5/20/2022 01:14:14'!
test18CuandoUnaAvispaLadronaSeReproduceRobaHuevosDeVariasAvispas
	| unHabitat unaAvispaASerRobada unaAvispaLadrona otraAvispaASerRobada |
	unHabitat := Habitat conAvispasComeOrugas: 1 comePolillas: 1 ladronas: 1.
	unHabitat gestarCantidadDeOrugas: 1.
	unHabitat gestarCantidadDePolillas: 1.
	unaAvispaASerRobada := (self elegirAvispasComeOrugasDe: unHabitat) first.
	otraAvispaASerRobada := (self elegirAvispasComePolillasDe: unHabitat) first.
	unaAvispaLadrona := (self elegirAvispasLadronasDe: unHabitat) first.
	unaAvispaASerRobada intentarReproducirse.
	otraAvispaASerRobada intentarReproducirse.
	unaAvispaLadrona intentarReproducirse.
	
	unaAvispaLadrona intentarReproducirse.
	
	self assert: 0 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaASerRobada firmaGenetica).
	self assert: 0 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: otraAvispaASerRobada firmaGenetica).
	self assert: 2 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaLadrona firmaGenetica).
	! !

!ReproduccionAvispasTests methodsFor: 'avispas ladronas - selectivas' stamp: 'JMB 5/20/2022 01:14:14'!
test19CuandoUnaAvispaLadronaSeReproduceNoVuelveARobarDeLaUltimaLineaGeneticaQueYaHaRobado
	| unHabitat unaAvispaASerRobada unaAvispaLadrona |
	unHabitat := Habitat conAvispasComeOrugas: 1 comePolillas: 0 ladronas: 1.
	unHabitat gestarCantidadDeOrugas: 2.
	unaAvispaASerRobada := (self elegirAvispasComeOrugasDe: unHabitat) first.
	unaAvispaLadrona := (self elegirAvispasLadronasDe: unHabitat) first.
	unaAvispaASerRobada intentarReproducirse.
	unaAvispaASerRobada intentarReproducirse.
	unaAvispaLadrona intentarReproducirse. 
	
	unaAvispaLadrona intentarReproducirse.
	
	self assert: 1 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaLadrona firmaGenetica).
	self assert: 1 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaASerRobada firmaGenetica).! !

!ReproduccionAvispasTests methodsFor: 'avispas ladronas - selectivas' stamp: 'JMB 5/20/2022 01:14:14'!
test20CuandoUnaAvispaLadronaSeReproduceNoRobaHuevosDeNingunaFirmaGeneticaALaQueLeHayaRobadoPreviamente
	| unHabitat unaAvispaASerRobada unaAvispaLadrona otraAvispaASerRobada |
	unHabitat := Habitat conAvispasComeOrugas: 1 comePolillas: 1 ladronas: 1.
	unHabitat gestarCantidadDeOrugas: 2.
	unHabitat gestarCantidadDePolillas: 2.
	unaAvispaASerRobada := (self elegirAvispasComeOrugasDe: unHabitat) first.
	otraAvispaASerRobada := (self elegirAvispasComePolillasDe: unHabitat) first.
	unaAvispaLadrona := (self elegirAvispasLadronasDe: unHabitat) first.
	unaAvispaASerRobada intentarReproducirse.
	unaAvispaASerRobada intentarReproducirse.
	otraAvispaASerRobada intentarReproducirse.
	unaAvispaLadrona intentarReproducirse.
	unaAvispaLadrona intentarReproducirse.
	
	unaAvispaLadrona intentarReproducirse.
	
	self assert: 1 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaASerRobada firmaGenetica).
	self assert: 0 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: otraAvispaASerRobada firmaGenetica).
	self assert: 2 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaLadrona firmaGenetica).
	! !


!ReproduccionAvispasTests methodsFor: 'avispas' stamp: 'sL 5/21/2022 15:24:51'!
elegirAvispasComeOrugasDe: unHabitat

	^ unHabitat elegirAvispasQueCumplanCon: [: cadaAvispa | cadaAvispa class = ComeOrugas]! !

!ReproduccionAvispasTests methodsFor: 'avispas' stamp: 'sL 5/21/2022 15:24:31'!
elegirAvispasComePolillasDe: unHabitat

	^ unHabitat elegirAvispasQueCumplanCon: [: cadaAvispa | cadaAvispa class = ComePolillas]! !

!ReproduccionAvispasTests methodsFor: 'avispas' stamp: 'sL 5/21/2022 15:24:54'!
elegirAvispasLadronasDe: unHabitat

	^ unHabitat elegirAvispasQueCumplanCon: [: cadaAvispa | cadaAvispa class = Ladrona]! !


!ReproduccionAvispasTests methodsFor: 'auxiliares - privado' stamp: 'sL 5/21/2022 16:05:38'!
assertQueUnaAvispaComeOrugasCon: numeroDePresas OrugasEnElHabitatQueIntentaReproducirse: intentosDeReproducirse VecesDejaEnElHabitatElNumeroDeOrugas: orugasRestantes

	| unHabitat unaAvispaAReproducirse |
	unHabitat := Habitat conAvispasComeOrugas: 1.
	unHabitat gestarCantidadDeOrugas: numeroDePresas.
	unaAvispaAReproducirse := (self elegirAvispasComeOrugasDe: unHabitat) first.
	
	intentosDeReproducirse timesRepeat: [unaAvispaAReproducirse intentarReproducirse.].
	
	self assert: orugasRestantes equals: unHabitat cantidadDeOrugas.! !

!ReproduccionAvispasTests methodsFor: 'auxiliares - privado' stamp: 'sL 5/21/2022 16:05:56'!
assertQueUnaAvispaComeOrugasCon: numeroDePresas OrugasEnElHabitatQueIntentaReproducirse: intentosDeReproduccion VecesPoneElNumeroDeHuevos: numeroDeHuevos 

	| unHabitat unaAvispaAReproducirse |
	unHabitat := Habitat conAvispasComeOrugas: 1.
	unHabitat gestarCantidadDeOrugas: numeroDePresas.
	unaAvispaAReproducirse := (self elegirAvispasComeOrugasDe: unHabitat) first.
	
	intentosDeReproduccion timesRepeat: [unaAvispaAReproducirse intentarReproducirse.].
	
	self assert: numeroDeHuevos equals: unHabitat cantidadDeHuevosDeAvispas.! !

!ReproduccionAvispasTests methodsFor: 'auxiliares - privado' stamp: 'sL 5/21/2022 16:06:08'!
assertQueUnaAvispaComePolillasCon: numeroDePresas PolillasEnElHabitatQueIntentaReproducirse: intentosDeReproducirse VecesDejaEnElHabitatElNumeroDePolillas: orugasRestantes

	| unHabitat unaAvispaAReproducirse |
	unHabitat := Habitat conAvispasComePolillas: 1.
	unHabitat gestarCantidadDePolillas: numeroDePresas.
	unaAvispaAReproducirse := (self elegirAvispasComePolillasDe: unHabitat) first.
	
	intentosDeReproducirse timesRepeat: [unaAvispaAReproducirse intentarReproducirse.].
	
	self assert: orugasRestantes equals: unHabitat cantidadDePolillas.! !

!ReproduccionAvispasTests methodsFor: 'auxiliares - privado' stamp: 'sL 5/21/2022 16:06:19'!
assertQueUnaAvispaComePolillasCon: numeroDePresas PolillasEnElHabitatQueIntentaReproducirse: intentosDeReproduccion VecesPoneElNumeroDeHuevos: numeroDeHuevos 

	| unHabitat unaAvispaAReproducirse |
	unHabitat := Habitat conAvispasComePolillas: 1.
	unHabitat gestarCantidadDePolillas: numeroDePresas.
	unaAvispaAReproducirse := (self elegirAvispasComePolillasDe: unHabitat) first.
	
	intentosDeReproduccion timesRepeat: [unaAvispaAReproducirse intentarReproducirse.].
	
	self assert: numeroDeHuevos equals: unHabitat cantidadDeHuevosDeAvispas.! !


!classDefinition: #Avispa category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!
Object subclass: #Avispa
	instanceVariableNames: 'habitat coleccionDeFirmas'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!

!Avispa methodsFor: 'initialization' stamp: 'sL 5/21/2022 16:12:45'!
initializeEn: unHabitat
	
	self subclassResponsibility ! !


!Avispa methodsFor: 'acciones' stamp: 'sL 5/21/2022 15:26:02'!
intentarReproducirse

	self subclassResponsibility ! !


!Avispa methodsFor: 'info' stamp: 'sL 5/21/2022 16:23:32'!
firmaGenetica

	^ self class! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Avispa class' category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!
Avispa class
	instanceVariableNames: ''!

!Avispa class methodsFor: 'instance creation' stamp: 'sL 5/21/2022 15:12:54'!
enHabitat: unHabitat
	^self new initializeEn: unHabitat! !


!classDefinition: #ComeOrugas category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!
Avispa subclass: #ComeOrugas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!

!ComeOrugas methodsFor: 'acciones' stamp: 'sL 5/21/2022 14:39:12'!
intentarReproducirse
	
	(habitat tieneOrugas) ifTrue: [
		habitat tomarUnaOruga.
		habitat dejarUnHuevoDeAvispa: self.
	]! !



!ComeOrugas methodsFor: 'initialization' stamp: 'sL 5/21/2022 16:17:45'!
initializeEn: unHabitat
	habitat := unHabitat.
	coleccionDeFirmas := OrderedCollection with: self firmaGenetica.! !


!classDefinition: #ComePolillas category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!
Avispa subclass: #ComePolillas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!


!ComePolillas methodsFor: 'initialization' stamp: 'sL 5/21/2022 16:17:45'!
initializeEn: unHabitat
	habitat := unHabitat.
	coleccionDeFirmas := OrderedCollection with: self firmaGenetica.! !


!ComePolillas methodsFor: 'acciones' stamp: 'sL 5/21/2022 14:38:35'!
intentarReproducirse

	(habitat tienePolillas) ifTrue: [
		habitat tomarUnaPolilla.
		habitat dejarUnHuevoDeAvispa: self.	
	]
! !


!classDefinition: #Ladrona category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!
Avispa subclass: #Ladrona
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!


!Ladrona methodsFor: 'initialization' stamp: 'sL 5/21/2022 16:17:45'!
initializeEn: unHabitat
	habitat := unHabitat.
	coleccionDeFirmas := OrderedCollection with: self firmaGenetica.! !


!Ladrona methodsFor: 'acciones' stamp: 'sL 5/21/2022 16:17:45'!
intentarReproducirse

	| firmaRobada |

	(habitat tieneHuevosDeAvispasQueNoSeanDe: coleccionDeFirmas) ifTrue: [
		firmaRobada := habitat robarUnHuevoQueNoSeaDe: coleccionDeFirmas.
		habitat dejarUnHuevoDeAvispa: self.
		coleccionDeFirmas add: firmaRobada.
	].! !


!classDefinition: #Habitat category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!
Object subclass: #Habitat
	instanceVariableNames: 'avispas cantidadDeOrugas cantidadDePolillas cantidadDeHuevosDeAvispasYSuAlimentoPorLineaGenetica'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!

!Habitat methodsFor: 'initialization' stamp: 'sL 5/21/2022 14:56:34'!
initializeConAvispas: unasAvispasIniciales
	cantidadDeHuevosDeAvispasYSuAlimentoPorLineaGenetica := Dictionary new.
	cantidadDeOrugas := 0.
	cantidadDePolillas := 0.
	avispas := unasAvispasIniciales! !


!Habitat methodsFor: 'avispas' stamp: 'JMB 5/20/2022 01:09:25'!
avispas
	^ avispas! !

!Habitat methodsFor: 'avispas' stamp: 'JMB 5/17/2022 21:13:53'!
cantidadDeAvispasVivas
	^ avispas size! !

!Habitat methodsFor: 'avispas' stamp: 'JMB 5/20/2022 19:32:35'!
cantidadDeAvispasVivasCumplanCon: bloque 
	^ (self elegirAvispasQueCumplanCon: bloque) size! !

!Habitat methodsFor: 'avispas' stamp: 'JMB 5/20/2022 01:09:01'!
elegirAvispasQueCumplanCon: bloque 
	| indice seleccion avispa |
	seleccion := OrderedCollection new.
	indice := 1.
	[ indice <= avispas size] whileTrue: [
		avispa := avispas at: indice.
		(bloque value: avispa) ifTrue: [
			seleccion add: avispa.
		].
		indice := indice + 1.		
	].
	^ seleccion	! !


!Habitat methodsFor: 'huevos de avispas' stamp: 'sL 5/21/2022 14:56:34'!
cantidadDeHuevosConLaFirmaGenetica: unaFirmaGenetica
	^ cantidadDeHuevosDeAvispasYSuAlimentoPorLineaGenetica at: unaFirmaGenetica ifAbsent: [ 0 ]! !

!Habitat methodsFor: 'huevos de avispas' stamp: 'sL 5/21/2022 14:56:34'!
cantidadDeHuevosDeAvispas
	^ cantidadDeHuevosDeAvispasYSuAlimentoPorLineaGenetica values sum: [ : unaCantidadDeHuevos | unaCantidadDeHuevos ] ifEmpty: [ 0 ]! !

!Habitat methodsFor: 'huevos de avispas' stamp: 'JMB 5/18/2022 16:40:25'!
dejarUnHuevoDeAvispa: unaAvispaAAovar
	| cantidadDeHuevos |
	cantidadDeHuevos := self cantidadDeHuevosConLaFirmaGenetica: unaAvispaAAovar firmaGenetica.
	self contabilizar: cantidadDeHuevos + 1 a: unaAvispaAAovar firmaGenetica.! !

!Habitat methodsFor: 'huevos de avispas' stamp: 'JMB 5/18/2022 22:33:05'!
robarUnHuevoQueNoSeaDe: firmasGeneticasExcluidas
	| cantidadDeHuevos unaFirmaGeneticaARobar |
	unaFirmaGeneticaARobar := self firmaGeneticaARobarQueNoSea: firmasGeneticasExcluidas.
	cantidadDeHuevos := self cantidadDeHuevosConLaFirmaGenetica: unaFirmaGeneticaARobar.
	self contabilizar: cantidadDeHuevos - 1 a: unaFirmaGeneticaARobar.
	^ unaFirmaGeneticaARobar! !

!Habitat methodsFor: 'huevos de avispas' stamp: 'JMB 5/18/2022 22:40:38'!
tieneHuevosDeAvispasQueNoSeanDe: unasFirmasGeneticas

	| cantidad firmaGenetica indice |
	cantidad := 0.
	indice := 1.
	[ indice <= unasFirmasGeneticas size] whileTrue: [
		firmaGenetica := unasFirmasGeneticas at: indice.
		cantidad := cantidad + (self cantidadDeHuevosConLaFirmaGenetica: firmaGenetica).
		indice := indice + 1.		
	].
	
	^ self cantidadDeHuevosDeAvispas > cantidad! !


!Habitat methodsFor: 'alimentos de las avispas' stamp: 'JMB 5/18/2022 16:41:14'!
cantidadDeOrugas
	^ cantidadDeOrugas! !

!Habitat methodsFor: 'alimentos de las avispas' stamp: 'JMB 5/18/2022 11:07:25'!
cantidadDePolillas
	^ cantidadDePolillas! !

!Habitat methodsFor: 'alimentos de las avispas' stamp: 'JMB 5/18/2022 09:57:44'!
gestarCantidadDeOrugas: unaCantidadDeOrugasAGestar 
	cantidadDeOrugas := cantidadDeOrugas + unaCantidadDeOrugasAGestar ! !

!Habitat methodsFor: 'alimentos de las avispas' stamp: 'JMB 5/18/2022 11:07:45'!
gestarCantidadDePolillas: unaCantidadDePolillasAGestar 
	cantidadDePolillas := cantidadDePolillas + unaCantidadDePolillasAGestar! !

!Habitat methodsFor: 'alimentos de las avispas' stamp: 'JMB 5/18/2022 10:06:37'!
tieneOrugas
	^ cantidadDeOrugas > 0! !

!Habitat methodsFor: 'alimentos de las avispas' stamp: 'JMB 5/18/2022 11:18:20'!
tienePolillas
	^ cantidadDePolillas > 0! !

!Habitat methodsFor: 'alimentos de las avispas' stamp: 'JMB 5/18/2022 09:59:06'!
tomarUnaOruga
	cantidadDeOrugas := cantidadDeOrugas - 1! !

!Habitat methodsFor: 'alimentos de las avispas' stamp: 'JMB 5/18/2022 11:09:15'!
tomarUnaPolilla
	cantidadDePolillas := cantidadDePolillas - 1! !


!Habitat methodsFor: 'ciclo' stamp: 'sL 5/21/2022 14:56:34'!
avanzarUnAño
	| avispasNuevas cantidad |
	avispasNuevas := OrderedCollection new.
	cantidadDeHuevosDeAvispasYSuAlimentoPorLineaGenetica keys do: [ : unaFirmaGenetica |
		cantidad := 		cantidadDeHuevosDeAvispasYSuAlimentoPorLineaGenetica at: unaFirmaGenetica.
		cantidad timesRepeat: [
			avispasNuevas add: (self nuevaAvispaConFirma: unaFirmaGenetica).
		].
	].
	avispas := avispasNuevas.
	cantidadDeHuevosDeAvispasYSuAlimentoPorLineaGenetica := Dictionary new.! !


!Habitat methodsFor: 'privados' stamp: 'sL 5/21/2022 14:56:34'!
contabilizar: unaCantidadDeHuevos a: unaFirmaGenetica
	cantidadDeHuevosDeAvispasYSuAlimentoPorLineaGenetica at: unaFirmaGenetica put: unaCantidadDeHuevos! !

!Habitat methodsFor: 'privados' stamp: 'sL 5/21/2022 14:56:34'!
firmaGeneticaARobarQueNoSea: firmasGeneticasExcluidas
	
	| firmasConHuevosQueNoSonFirmaGeneticaExcluida |
	firmasConHuevosQueNoSonFirmaGeneticaExcluida := cantidadDeHuevosDeAvispasYSuAlimentoPorLineaGenetica keys select: [:firma | 
		(firmasGeneticasExcluidas includes: firma) not and: [(self cantidadDeHuevosConLaFirmaGenetica: firma) > 0]].
	^ firmasConHuevosQueNoSonFirmaGeneticaExcluida first! !

!Habitat methodsFor: 'privados' stamp: 'sL 5/21/2022 15:27:18'!
nuevaAvispaConFirma: unaFirmaGenetica
	
	^unaFirmaGenetica enHabitat: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Habitat class' category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!
Habitat class
	instanceVariableNames: ''!

!Habitat class methodsFor: 'instance creation' stamp: 'sL 5/21/2022 14:46:23'!
conAvispasComeOrugas: unaCantidadDeAvispasComeOrugas
	| unasAvispas habitat |
	habitat := self new.
	unasAvispas := ((1 to: unaCantidadDeAvispasComeOrugas) collect: [ : each | ComeOrugas enHabitat: habitat ]) asOrderedCollection.
	^habitat initializeConAvispas: unasAvispas  ! !

!Habitat class methodsFor: 'instance creation' stamp: 'sL 5/21/2022 14:46:45'!
conAvispasComeOrugas: unaCantidadDeAvispasComeOrugas comePolillas: unaCantidadDeAvispasComePolillas 
	| unasAvispas habitat |
	habitat := self new.
	unasAvispas := ((1 to: unaCantidadDeAvispasComeOrugas) collect: [ : each | ComeOrugas enHabitat: habitat ]) asOrderedCollection.
	unasAvispas addAll: ((1 to: unaCantidadDeAvispasComePolillas) collect: [ : each | ComePolillas enHabitat: habitat ]).
	^habitat initializeConAvispas: unasAvispas ! !

!Habitat class methodsFor: 'instance creation' stamp: 'sL 5/21/2022 14:47:07'!
conAvispasComeOrugas: unaCantidadDeAvispasComeOrugas comePolillas: unaCantidadDeAvispasComePolillas ladronas: unaCantidadDeAvispasLadronas 
	| unasAvispas habitat |
	habitat := self new.
	unasAvispas := ((1 to: unaCantidadDeAvispasComeOrugas) collect: [ : each | ComeOrugas enHabitat: habitat ]) asOrderedCollection.
	unasAvispas addAll: ((1 to: unaCantidadDeAvispasComePolillas) collect: [ : each | ComePolillas enHabitat: habitat]).
	unasAvispas addAll: ((1 to: unaCantidadDeAvispasLadronas) collect: [ : each | Ladrona enHabitat: habitat ]).
	^habitat initializeConAvispas: unasAvispas ! !

!Habitat class methodsFor: 'instance creation' stamp: 'sL 5/21/2022 14:51:22'!
conAvispasComeOrugas: unaCantidadDeAvispasComeOrugas ladronas: unaCantidadDeAvispasLadronas 
	| unasAvispas habitat |
	habitat := self new.
	unasAvispas := ((1 to: unaCantidadDeAvispasComeOrugas) collect: [ : each | ComeOrugas enHabitat: habitat ]) asOrderedCollection.
	unasAvispas addAll: ((1 to: unaCantidadDeAvispasLadronas) collect: [ : each | Ladrona enHabitat: habitat ]).
	^habitat initializeConAvispas: unasAvispas! !

!Habitat class methodsFor: 'instance creation' stamp: 'sL 5/21/2022 14:51:31'!
conAvispasComePolillas: unaCantidadDeAvispasComePolillas
	| unasAvispas habitat |
	habitat := self new.
	unasAvispas := ((1 to: unaCantidadDeAvispasComePolillas) collect: [ : each | ComePolillas enHabitat: habitat ]) asOrderedCollection.
	^habitat initializeConAvispas: unasAvispas ! !
