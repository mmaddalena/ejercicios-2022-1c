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

!MarsRoverTests methodsFor: 'test' stamp: 'sL 5/31/2022 11:00:39'!
test03moveForwardOnce

	| marsRover |
	
	marsRover := MarsRover new.
	
	marsRover receiveStringOfCommands: 'f'.
	
	self deny: (marsRover position = (0@0)).! !

!MarsRoverTests methodsFor: 'test' stamp: 'sL 5/31/2022 10:59:16'!
test04turnRightOnce

	| marsRover |
	
	marsRover := MarsRover new.
	
	marsRover receiveStringOfCommands: 'r'.
	
	self assert: (marsRover direction = #East).! !

!MarsRoverTests methodsFor: 'test' stamp: 'sL 5/31/2022 11:05:08'!
test05turnLeftOnce

	| marsRover |
	
	marsRover := MarsRover new.
	
	marsRover receiveStringOfCommands: 'l'.
	
	self assert: (marsRover direction = #West).! !

!MarsRoverTests methodsFor: 'test' stamp: 'sL 5/31/2022 11:12:05'!
test06moveBackwardsOnce

	| marsRover |
	
	marsRover := MarsRover new.
	
	marsRover receiveStringOfCommands: 'b'.
	
	self assert: (marsRover position = (0@-1)).! !

!MarsRoverTests methodsFor: 'test' stamp: 'sL 5/31/2022 11:11:41'!
test07turnRightTwice

	| marsRover |
	
	marsRover := MarsRover new.
	
	marsRover receiveStringOfCommands: 'rr'.
	
	self assert: (marsRover direction = #South).! !

!MarsRoverTests methodsFor: 'test' stamp: 'sL 5/31/2022 11:20:32'!
test08turnRightThrice

	| marsRover |
	
	marsRover := MarsRover new.
	
	marsRover receiveStringOfCommands: 'rrr'.
	
	self assert: (marsRover direction = #West).! !

!MarsRoverTests methodsFor: 'test' stamp: 'sL 5/31/2022 11:20:36'!
test09turnRightFourTimes

	| marsRover |
	
	marsRover := MarsRover new.
	
	marsRover receiveStringOfCommands: 'rrrr'.
	
	self assert: (marsRover direction = #North).! !

!MarsRoverTests methodsFor: 'test' stamp: 'sL 5/31/2022 11:31:11'!
test10unknownCharacterReceived

	| marsRover |
	
	marsRover := MarsRover new.
	
	self 
		should: [ marsRover receiveStringOfCommands: 'x'. ]
		raise: Error
		withExceptionDo: [ :anError | self assert: MarsRover unknownCharacterErrorDescription equals: anError messageText ]
	! !

!MarsRoverTests methodsFor: 'test' stamp: 'sL 5/31/2022 11:30:43'!
test11unknownCharacterReceivedAlongSideCorrectCharacters

	| marsRover |
	
	marsRover := MarsRover new.
	
	self 
		should: [ marsRover receiveStringOfCommands: 'fbxbr'. ]
		raise: Error
		withExceptionDo: [ :anError | self assert: MarsRover unknownCharacterErrorDescription equals: anError messageText ]
	! !


!classDefinition: #MarsRover category: 'Grupo32-MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position direction'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Grupo32-MarsRover'!

!MarsRover methodsFor: 'commandReception' stamp: 'sL 5/31/2022 11:29:55'!
receiveStringOfCommands: commands

	| index character |
	index _ 0.

	(commands size) timesRepeat: [
		index _ index + 1.
		character _ (commands at: index).
		(character = $f) ifTrue: [self moveForward].
		
		(character = $b) ifTrue: [self moveBackwards].
		
		(character = $r) ifTrue: [self turnRight].
		
		(character = $l) ifTrue: [self turnLeft].
		
		((character = $f) or: (character = $b) or: (character = $r) or: (character = $l)) ifFalse: [self error: MarsRover unknownCharacterErrorDescription.]
		]! !


!MarsRover methodsFor: 'movement - private' stamp: 'sL 5/31/2022 11:04:50'!
moveBackwards

	position _ 0@-1.! !

!MarsRover methodsFor: 'movement - private' stamp: 'sL 5/31/2022 11:04:22'!
moveForward

	position _ 0@1.! !

!MarsRover methodsFor: 'movement - private' stamp: 'sL 5/31/2022 11:04:36'!
turnLeft

	direction _ #West! !

!MarsRover methodsFor: 'movement - private' stamp: 'sL 5/31/2022 11:15:45'!
turnRight

	(self direction = #North) ifTrue: [direction _ #East] ifFalse: [
		(self direction = #East) ifTrue: [direction _ #South] ifFalse: [
			(self direction = #South) ifTrue: [direction _ #West] ifFalse: [
				(self direction = #West) ifTrue: [direction _ #North] 
			]
		]
	]
	! !


!MarsRover methodsFor: 'initialization' stamp: 'sL 5/31/2022 10:40:46'!
initialize

	position := 0@0.
	
	direction := #North! !


!MarsRover methodsFor: 'information' stamp: 'sL 5/30/2022 09:02:57'!
direction

	^direction! !

!MarsRover methodsFor: 'information' stamp: 'sL 5/30/2022 08:49:29'!
position

	^position! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'Grupo32-MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'sL 5/31/2022 11:25:57'!
unknownCharacterErrorDescription

	^'Unknown character received.'! !
