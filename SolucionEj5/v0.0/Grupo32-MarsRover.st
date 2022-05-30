!classDefinition: #MarsRoverTests category: 'Grupo32-MarsRover'!
TestCase subclass: #MarsRoverTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Grupo32-MarsRover'!

!MarsRoverTests methodsFor: 'test' stamp: 'sL 5/30/2022 09:24:09'!
test01startsAtX0Y0

	| marsRover |
	
	marsRover := MarsRover new.
	
	self assert: (marsRover position = (0@0)).! !

!MarsRoverTests methodsFor: 'test' stamp: 'sL 5/30/2022 09:12:57'!
test02startsLookingNorth

	| marsRover |
	
	marsRover := MarsRover new.

	self assert: (marsRover direction = #North)! !

!MarsRoverTests methodsFor: 'test' stamp: 'sL 5/30/2022 09:29:43'!
test03MoveOnce

	| marsRover |
	
	marsRover := MarsRover new.
	
	marsRover receiveCommandsString: 'f'.
	
	self assert: (marsRover position = (0@1)).! !


!classDefinition: #MarsRover category: 'Grupo32-MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position direction'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Grupo32-MarsRover'!

!MarsRover methodsFor: 'as yet unclassified' stamp: 'sL 5/30/2022 09:02:57'!
direction

	^direction! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'sL 5/30/2022 09:03:20'!
initialize
	
	"super initialize."
	
	position := 0@0.
	
	direction := #North! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'sL 5/30/2022 08:49:29'!
position

	^position! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'sL 5/30/2022 09:20:32'!
receiveCommandsString: commands

	! !
