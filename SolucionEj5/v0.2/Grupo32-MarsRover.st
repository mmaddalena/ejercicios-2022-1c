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

!MarsRoverTests methodsFor: 'test' stamp: 'sL 5/31/2022 17:53:09'!
test04turnRightOnce

	| marsRover |
	
	marsRover := MarsRover new.
	
	marsRover receiveStringOfCommands: 'r'.
	
	self assert: (marsRover direction = #East).! !

!MarsRoverTests methodsFor: 'test' stamp: 'sL 5/31/2022 17:53:05'!
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

!MarsRoverTests methodsFor: 'test' stamp: 'sL 5/31/2022 17:05:13'!
test12turnLeftTwice

	| marsRover |
	
	marsRover := MarsRover new.
	
	marsRover receiveStringOfCommands: 'll'.
	
	self assert: (marsRover direction = #South).! !

!MarsRoverTests methodsFor: 'test' stamp: 'sL 5/31/2022 17:09:49'!
test13moveForwardTwice

	| marsRover |
	
	marsRover := MarsRover new.
	
	marsRover receiveStringOfCommands: 'ff'.
	
	self assert: (marsRover position = (0@2)).! !

!MarsRoverTests methodsFor: 'test' stamp: 'sL 5/31/2022 17:11:36'!
test14moveForwardTwiceAfterTurning

	| marsRover |
	
	marsRover := MarsRover new.
	
	marsRover receiveStringOfCommands: 'rff'.
	
	self assert: (marsRover position = (2@0)).! !

!MarsRoverTests methodsFor: 'test' stamp: 'sL 5/31/2022 17:14:12'!
test15moveBackwardsTwice

	| marsRover |
	
	marsRover := MarsRover new.
	
	marsRover receiveStringOfCommands: 'bb'.
	
	self assert: (marsRover position = (0@-2)).! !

!MarsRoverTests methodsFor: 'test' stamp: 'sL 5/31/2022 18:12:08'!
test16moveBackwardsTwiceAfterTurning

	| marsRover |
	
	marsRover := MarsRover new.
	
	marsRover receiveStringOfCommands: 'rbb'.
	
	self assert: (marsRover position = (-2@0)).! !


!classDefinition: #MarsRover category: 'Grupo32-MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position direction'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Grupo32-MarsRover'!

!MarsRover methodsFor: 'commandReception' stamp: 'sL 5/31/2022 18:15:41'!
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
		]
	! !


!MarsRover methodsFor: 'movement - private' stamp: 'sL 5/31/2022 18:02:36'!
moveEast

	position _ position + (1@0).! !

!MarsRover methodsFor: 'movement - private' stamp: 'sL 5/31/2022 18:02:32'!
moveNorth

	position _ position + (0@1).! !

!MarsRover methodsFor: 'movement - private' stamp: 'sL 5/31/2022 18:02:27'!
moveSouth

	position _ position + (0@-1).! !

!MarsRover methodsFor: 'movement - private' stamp: 'sL 5/31/2022 18:02:24'!
moveWest

	position _ position + (-1@0).! !

!MarsRover methodsFor: 'movement - private' stamp: 'sL 5/31/2022 17:35:59'!
newDirection: aDirection

	direction _ aDirection ! !


!MarsRover methodsFor: 'initialization' stamp: 'sL 5/31/2022 17:40:28'!
initialize

	position := 0@0.
	
	"direction := #North"
	
	"direction := North."
	
	direction := North new.
	! !


!MarsRover methodsFor: 'information' stamp: 'sL 5/31/2022 17:49:32'!
direction

	^direction direction! !

!MarsRover methodsFor: 'information' stamp: 'sL 5/30/2022 08:49:29'!
position

	^position! !


!MarsRover methodsFor: 'movement' stamp: 'sL 5/31/2022 18:04:35'!
moveBackwards
	
	(MarsRoverDirection getCurrentDirection: self) moveBackwardsAccordingToDirection: self.! !

!MarsRover methodsFor: 'movement' stamp: 'sL 5/31/2022 18:04:41'!
moveForward
	
	(MarsRoverDirection getCurrentDirection: self) moveForwardAccordingToDirection: self.! !

!MarsRover methodsFor: 'movement' stamp: 'sL 5/31/2022 17:57:15'!
turnLeft

	(MarsRoverDirection getCurrentDirection: self) turnLeftAccordingToDirection: self.

	
! !

!MarsRover methodsFor: 'movement' stamp: 'sL 5/31/2022 17:57:11'!
turnRight
	
	(MarsRoverDirection getCurrentDirection: self) turnRightAccordingToDirection: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'Grupo32-MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'sL 5/31/2022 11:25:57'!
unknownCharacterErrorDescription

	^'Unknown character received.'! !


!classDefinition: #MarsRoverDirection category: 'Grupo32-MarsRover'!
Object subclass: #MarsRoverDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Grupo32-MarsRover'!

!MarsRoverDirection methodsFor: 'as yet unclassified' stamp: 'sL 5/31/2022 17:22:36'!
direction

	self subclassResponsibility ! !

!MarsRoverDirection methodsFor: 'as yet unclassified' stamp: 'sL 5/31/2022 17:33:42'!
isDirection: aRover

	self subclassResponsibility ! !

!MarsRoverDirection methodsFor: 'as yet unclassified' stamp: 'sL 5/31/2022 17:56:28'!
turnLeftAccordingToDirection: aRover

	self subclassResponsibility ! !

!MarsRoverDirection methodsFor: 'as yet unclassified' stamp: 'sL 5/31/2022 17:56:32'!
turnRightAccordingToDirection: aRover

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverDirection class' category: 'Grupo32-MarsRover'!
MarsRoverDirection class
	instanceVariableNames: ''!

!MarsRoverDirection class methodsFor: 'as yet unclassified' stamp: 'sL 5/31/2022 17:39:27'!
getCurrentDirection: aRover
	
	| currentDirection |
	currentDirection := self subclasses detect: [ : aSubclass | aSubclass isDirection: aRover].
	
	^currentDirection new! !

!MarsRoverDirection class methodsFor: 'as yet unclassified' stamp: 'sL 5/31/2022 18:10:59'!
isDirection: aRover

	self subclassResponsibility ! !


!classDefinition: #East category: 'Grupo32-MarsRover'!
MarsRoverDirection subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Grupo32-MarsRover'!

!East methodsFor: 'as yet unclassified' stamp: 'sL 5/31/2022 17:22:59'!
direction

	^#East! !

!East methodsFor: 'as yet unclassified' stamp: 'sL 5/31/2022 18:03:24'!
moveBackwardsAccordingToDirection: aRover

	aRover moveWest.! !

!East methodsFor: 'as yet unclassified' stamp: 'sL 5/31/2022 17:59:26'!
moveForwardAccordingToDirection: aRover

	aRover moveEast.! !

!East methodsFor: 'as yet unclassified' stamp: 'sL 5/31/2022 17:55:25'!
turnLeftAccordingToDirection: aRover

	aRover newDirection: North new.! !

!East methodsFor: 'as yet unclassified' stamp: 'sL 5/31/2022 17:51:15'!
turnRightAccordingToDirection: aRover

	aRover newDirection: South new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'East class' category: 'Grupo32-MarsRover'!
East class
	instanceVariableNames: ''!

!East class methodsFor: 'as yet unclassified' stamp: 'sL 5/31/2022 17:42:37'!
isDirection: aRover

	^aRover direction  = #East! !


!classDefinition: #North category: 'Grupo32-MarsRover'!
MarsRoverDirection subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Grupo32-MarsRover'!

!North methodsFor: 'as yet unclassified' stamp: 'sL 5/31/2022 17:23:07'!
direction

	^#North! !

!North methodsFor: 'as yet unclassified' stamp: 'sL 5/31/2022 18:03:42'!
moveBackwardsAccordingToDirection: aRover

	aRover moveSouth.! !

!North methodsFor: 'as yet unclassified' stamp: 'sL 5/31/2022 18:00:48'!
moveForwardAccordingToDirection: aRover

	aRover moveNorth.! !

!North methodsFor: 'as yet unclassified' stamp: 'sL 5/31/2022 17:55:36'!
turnLeftAccordingToDirection: aRover

	aRover newDirection: West new.! !

!North methodsFor: 'as yet unclassified' stamp: 'sL 5/31/2022 17:52:16'!
turnRightAccordingToDirection: aRover

	aRover newDirection: East new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'North class' category: 'Grupo32-MarsRover'!
North class
	instanceVariableNames: ''!

!North class methodsFor: 'as yet unclassified' stamp: 'sL 5/31/2022 17:42:43'!
isDirection: aRover

	^aRover direction  = #North! !


!classDefinition: #South category: 'Grupo32-MarsRover'!
MarsRoverDirection subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Grupo32-MarsRover'!

!South methodsFor: 'as yet unclassified' stamp: 'sL 5/31/2022 17:23:21'!
direction

	^#South! !

!South methodsFor: 'as yet unclassified' stamp: 'sL 5/31/2022 18:04:06'!
moveBackwardsAccordingToDirection: aRover

	aRover moveNorth.! !

!South methodsFor: 'as yet unclassified' stamp: 'sL 5/31/2022 18:01:00'!
moveForwardAccordingToDirection: aRover

	aRover moveSouth.! !

!South methodsFor: 'as yet unclassified' stamp: 'sL 5/31/2022 17:55:49'!
turnLeftAccordingToDirection: aRover

	aRover newDirection: East new.! !

!South methodsFor: 'as yet unclassified' stamp: 'sL 5/31/2022 17:52:26'!
turnRightAccordingToDirection: aRover

	aRover newDirection: West new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'South class' category: 'Grupo32-MarsRover'!
South class
	instanceVariableNames: ''!

!South class methodsFor: 'as yet unclassified' stamp: 'sL 5/31/2022 17:42:50'!
isDirection: aRover

	^aRover direction  = #South! !


!classDefinition: #West category: 'Grupo32-MarsRover'!
MarsRoverDirection subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Grupo32-MarsRover'!

!West methodsFor: 'as yet unclassified' stamp: 'sL 5/31/2022 17:23:28'!
direction

	^#West! !

!West methodsFor: 'as yet unclassified' stamp: 'sL 5/31/2022 18:04:16'!
moveBackwardsAccordingToDirection: aRover

	aRover moveEast.! !

!West methodsFor: 'as yet unclassified' stamp: 'sL 5/31/2022 18:01:11'!
moveForwardAccordingToDirection: aRover

	aRover moveWest.! !

!West methodsFor: 'as yet unclassified' stamp: 'sL 5/31/2022 17:56:04'!
turnLeftAccordingToDirection: aRover

	aRover newDirection: South new.! !

!West methodsFor: 'as yet unclassified' stamp: 'sL 5/31/2022 17:52:38'!
turnRightAccordingToDirection: aRover

	aRover newDirection: North new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'West class' category: 'Grupo32-MarsRover'!
West class
	instanceVariableNames: ''!

!West class methodsFor: 'as yet unclassified' stamp: 'sL 5/31/2022 17:42:58'!
isDirection: aRover

	^aRover direction  = #West! !
