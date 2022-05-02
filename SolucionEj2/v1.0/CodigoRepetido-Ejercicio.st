!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'MAM 5/2/2022 12:49:11'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	
	customerBook := CustomerBook new.
	
	self assertEjecutarLaOperacion: [customerBook addCustomerNamed: 'John Lennon'.] enMenosDe: 50.
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'MAM 5/2/2022 12:49:41'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney |
	
	customerBook := CustomerBook new.
	
	paulMcCartney := 'Paul McCartney'.
	customerBook addCustomerNamed: paulMcCartney.
	
	self assertEjecutarLaOperacion: [customerBook removeCustomerNamed: paulMcCartney.] enMenosDe: 100.

! !

!CustomerBookTest methodsFor: 'testing' stamp: 'MAM 5/2/2022 12:09:49'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.
	
	self AssertQueSiLaOperacion: [customerBook addCustomerNamed: ''.] TieneElTipoDeError: Error Hacer: [
		:anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty
		]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'SL 5/2/2022 15:46:45'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self AssertQueSiLaOperacion: [customerBook removeCustomerNamed: 'Paul McCartney'] TieneElTipoDeError: NotFound Hacer: [
		self assertQue: johnLennon esUnicoClienteEn: customerBook.]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'MAM 5/2/2022 12:51:36'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	self AgregarYSuspenderA: paulMcCartney En: customerBook.
	self assertQueEn: customerBook clientesTotalesSon: 1 clientesActivosSon: 0 clientesSuspendidosSon: 1.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'MAM 5/2/2022 12:51:45'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	self AgregarYSuspenderA: paulMcCartney En: customerBook.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assertQueEn: customerBook clientesTotalesSon: 0 clientesActivosSon: 0 clientesSuspendidosSon: 0.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'SL 5/2/2022 15:46:55'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self AssertQueSiLaOperacion: [customerBook suspendCustomerNamed: 'Ringo Starr'.] TieneElTipoDeError: CantSuspend Hacer: [
		self assertQue: johnLennon esUnicoClienteEn: customerBook.]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'SL 5/2/2022 15:47:01'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	self AgregarYSuspenderA: johnLennon En: customerBook.

	self AssertQueSiLaOperacion: [ customerBook suspendCustomerNamed: johnLennon. ] TieneElTipoDeError: CantSuspend Hacer: [
		self assertQue: johnLennon esUnicoClienteEn: customerBook.]! !


!CustomerBookTest methodsFor: 'aux-privado' stamp: 'MAM 5/2/2022 12:50:20'!
AgregarYSuspenderA: unCliente En: customerBook
	customerBook addCustomerNamed: unCliente.
	customerBook suspendCustomerNamed: unCliente.! !

!CustomerBookTest methodsFor: 'aux-privado' stamp: 'MAM 5/2/2022 12:50:37'!
AssertQueSiLaOperacion: unBloque TieneElTipoDeError: error Hacer: otroBloque
	[ unBloque value.
	self fail ]
		on: error
		do: [otroBloque]! !

!CustomerBookTest methodsFor: 'aux-privado' stamp: 'MAM 5/2/2022 12:49:22'!
assertEjecutarLaOperacion: unBloqueDeOperaciones enMenosDe: cantidadDeMilisegundos
	| millisecondsBeforeRunning millisecondsAfterRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	unBloqueDeOperaciones value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
    	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < (cantidadDeMilisegundos * millisecond)! !

!CustomerBookTest methodsFor: 'aux-privado' stamp: 'SL 5/2/2022 15:46:16'!
assertQue: unCliente esUnicoClienteEn: customerBook
	^ [
		self assert: customerBook numberOfCustomers = 1.
		self assert: (customerBook includesCustomerNamed: unCliente)
	]! !

!CustomerBookTest methodsFor: 'aux-privado' stamp: 'MAM 5/2/2022 12:51:16'!
assertQueEn: customerBook clientesTotalesSon: totales clientesActivosSon: activos clientesSuspendidosSon: suspendidos
	self assert: totales equals: customerBook numberOfCustomers.
	self assert: activos equals: customerBook numberOfActiveCustomers.
	self assert: suspendidos equals: customerBook numberOfSuspendedCustomers.! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 4/3/2019 10:14:26'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'SL 5/1/2022 23:59:23'!
removeCustomerNamed: aName 

	active remove: aName 
		ifAbsent: [suspended remove: aName 
			ifAbsent: [^NotFound signal].].
! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
