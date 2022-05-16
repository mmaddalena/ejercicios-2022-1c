!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'MAM 5/12/2022 15:09:14'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'anEmptyOOStack anOOStackWithOneElement anOOStackWithManyElements aFinderWithAnEmptyOOStack aFinderWithAnOOStackWithOneElement aFinderWithAnOOStackWithManyElements resultsForAnEmptyOOStack resultsForAnOOStackWithOneElement resultsForAnOOStackWithManyElements resultsForAnOOStackWithNoElementsFound anOOStackWithManyElementsCopy resultsForLowerCaseOOStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'sL 5/16/2022 18:32:46'!
test01oneElementCorrectlyFoundFromAnOOStackWithOneElement

	self assert: (aFinderWithAnOOStackWithOneElement find: 'Messi') equals: resultsForAnOOStackWithOneElement! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'sL 5/16/2022 18:32:52'!
test02someElementsCorrectlyFoundFromAnOOStackWithManyElements

	self assert: (aFinderWithAnOOStackWithManyElements find: 'Messi') equals: resultsForAnOOStackWithManyElements! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'sL 5/16/2022 18:32:56'!
test03zeroElementsCorrectlyFoundFromAnOOStackWithManyElements

	self assert: (aFinderWithAnOOStackWithManyElements find: 'Nada') equals: resultsForAnOOStackWithNoElementsFound ! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'sL 5/16/2022 18:33:24'!
test04originalStackRemainsInOrder

	| anElementFromOriginalStack anElementFromCopyStack firstAuxiliaryOOStack secondAuxiliaryOOStack |
	firstAuxiliaryOOStack := OOStack new.
	secondAuxiliaryOOStack := OOStack new.

	self assert: (aFinderWithAnOOStackWithManyElements find: 'Messi') equals: resultsForAnOOStackWithManyElements.
	
	(anOOStackWithManyElementsCopy size) timesRepeat: [
		anElementFromOriginalStack := anOOStackWithManyElements pop.
		anElementFromCopyStack := anOOStackWithManyElementsCopy pop.
		self assert: (anElementFromOriginalStack) equals: anElementFromCopyStack.
		firstAuxiliaryOOStack push: anElementFromOriginalStack.
		secondAuxiliaryOOStack push: anElementFromCopyStack.
		].
	
	(firstAuxiliaryOOStack size) timesRepeat: [
		anElementFromOriginalStack := firstAuxiliaryOOStack pop.
		anElementFromCopyStack := secondAuxiliaryOOStack pop.
		anOOStackWithManyElements push: anElementFromOriginalStack.
		anOOStackWithManyElementsCopy push: anElementFromCopyStack.
		]! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'sL 5/16/2022 18:33:38'!
test05prefixCantHaveSpaces

	self
		should: [ aFinderWithAnOOStackWithManyElements find: 'Hansel y Gretel' ]
		raise: Error
		withExceptionDo: [ :anError | self assert: SentenceFinderByPrefix prefixCantHaveSpacesErrorDescription equals: anError messageText ]! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'MAM 5/16/2022 18:19:07'!
test06finderIsCaseSensitive
	| emptyCollection |
	
	emptyCollection := OrderedCollection new.
	self assert: (aFinderWithAnOOStackWithOneElement find: 'messi') equals: emptyCollection! !


!SentenceFinderByPrefixTest methodsFor: 'setup' stamp: 'sL 5/16/2022 18:32:28'!
setUp

	"Stacks"
	
	anEmptyOOStack := OOStack new.
	
	anOOStackWithOneElement := OOStack new.
	anOOStackWithOneElement push: 'Messi'.
	
	anOOStackWithManyElements := OOStack new.
	anOOStackWithManyElements push: 'RodrigoDePaul'.
	anOOStackWithManyElements push: 'LautaroMartinez'.
	anOOStackWithManyElements push: 'ElDibu'.
	anOOStackWithManyElements push: 'DiMaria'.
	anOOStackWithManyElements push: 'Messi'.
	anOOStackWithManyElements push: 'Messias'.
	anOOStackWithManyElements push: 'Messi es crack'.
	anOOStackWithManyElements push: 'Scaloni es crack'.
	
	anOOStackWithManyElementsCopy := OOStack new.
	anOOStackWithManyElementsCopy push: 'RodrigoDePaul'.
	anOOStackWithManyElementsCopy push: 'LautaroMartinez'.
	anOOStackWithManyElementsCopy push: 'ElDibu'.
	anOOStackWithManyElementsCopy push: 'DiMaria'.
	anOOStackWithManyElementsCopy push: 'Messi'.
	anOOStackWithManyElementsCopy push: 'Messias'.
	anOOStackWithManyElementsCopy push: 'Messi es crack'.
	anOOStackWithManyElementsCopy push: 'Scaloni es crack'.
	
	"Finders"
	
	aFinderWithAnOOStackWithOneElement := SentenceFinderByPrefix with: anOOStackWithOneElement.
	
	aFinderWithAnOOStackWithManyElements := SentenceFinderByPrefix with: anOOStackWithManyElements.
	
	"Results"
	
	resultsForAnEmptyOOStack := OrderedCollection new.
		
	resultsForAnOOStackWithNoElementsFound := OrderedCollection new.
	
	resultsForAnOOStackWithOneElement := OrderedCollection new.
	resultsForAnOOStackWithOneElement add: 'Messi'.
	
	resultsForAnOOStackWithManyElements := OrderedCollection new.
	resultsForAnOOStackWithManyElements add: 'Messi'.
	resultsForAnOOStackWithManyElements add: 'Messias'.
	resultsForAnOOStackWithManyElements add: 'Messi es crack'.
	
	resultsForLowerCaseOOStack := OrderedCollection new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefixTest class' category: 'Stack-Exercise'!
SentenceFinderByPrefixTest class
	instanceVariableNames: 'anEmptyStack'!


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'stackedElements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'initialization' stamp: 'sL 5/16/2022 18:29:24'!
initialize

	super initialize.
	
	stackedElements := OrderedCollection new.! !


!OOStack methodsFor: 'operations' stamp: 'sL 5/16/2022 18:29:32'!
isEmpty

	^stackedElements isEmpty! !

!OOStack methodsFor: 'operations' stamp: 'sL 5/16/2022 18:29:45'!
pop

	"Esto no es optimo: recibimos el estado desde StateOfOOStack para despues volver a enviarlo a StateOfOOStack.
	Intentamos encapsular todo allí, pero fallaba."
	^(StateOfOOStack getStatusOf: self) sendMessagePopAccordingToActualState: self! !

!OOStack methodsFor: 'operations' stamp: 'sL 5/16/2022 18:29:53'!
push: elementToAdd

	stackedElements add: elementToAdd.! !

!OOStack methodsFor: 'operations' stamp: 'sL 5/16/2022 18:29:59'!
size

	^stackedElements size.! !

!OOStack methodsFor: 'operations' stamp: 'sL 5/16/2022 18:30:09'!
top

	"Esto no es optimo: recibimos el estado desde StateOfOOStack para despues volver a enviarlo a StateOfOOStack.
	Intentamos encapsular todo allí, pero fallaba."
	^(StateOfOOStack getStatusOf: self) sendMessageTopAccordingToActualState: self! !


!OOStack methodsFor: 'operations - private' stamp: 'sL 5/16/2022 18:30:31'!
popAuxiliary
	
	| unstackedElement |
	
	unstackedElement := stackedElements last.
	
	stackedElements removeLast.
	
	^unstackedElement! !

!OOStack methodsFor: 'operations - private' stamp: 'sL 5/16/2022 18:30:36'!
raiseErrorDueToEmptyStack

	^self error: OOStack stackEmptyErrorDescription! !

!OOStack methodsFor: 'operations - private' stamp: 'sL 5/16/2022 18:30:40'!
topAuxiliary

	^stackedElements last.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'OOStackAsociated'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'sL 5/16/2022 18:30:58'!
initializeWith: AnOOStack

	OOStackAsociated := AnOOStack 
! !


!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'MAM 5/16/2022 17:24:41'!
find: aPrefix
	
	(aPrefix includesSubString: ' ') ifTrue: [self raiseErrorDueToPrefixCantHaveSpaces].
	
	^(self orderedCollectionOfElementsIn: OOStackAsociated) select: [: Element | Element beginsWith: aPrefix].
	
	! !


!SentenceFinderByPrefix methodsFor: 'operationsAuxiliaries-private' stamp: 'MAM 5/16/2022 16:53:25'!
orderedCollectionOfElementsIn: anOOStack

	| anAuxiliaryOrderedCollection anElement anAuxiliaryOOStack |
	anAuxiliaryOOStack := OOStack new.
	anAuxiliaryOrderedCollection := OrderedCollection new.
	
	(anOOStack size) timesRepeat: [
		anElement := anOOStack pop.
		anAuxiliaryOrderedCollection addFirst: anElement.
		anAuxiliaryOOStack push: anElement.
		].

	(anAuxiliaryOOStack size) timesRepeat: [
		anElement := anAuxiliaryOOStack pop.
		anOOStack push: anElement.
		].

	^anAuxiliaryOrderedCollection! !

!SentenceFinderByPrefix methodsFor: 'operationsAuxiliaries-private' stamp: 'MAM 5/16/2022 16:12:57'!
raiseErrorDueToPrefixCantHaveSpaces

	self error: SentenceFinderByPrefix prefixCantHaveSpacesErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: 'OOStackAsociado'!

!SentenceFinderByPrefix class methodsFor: 'instance creation' stamp: 'MAM 5/16/2022 17:48:54'!
with: AnOOStack

	^SentenceFinderByPrefix new initializeWith: AnOOStack! !


!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'sL 5/16/2022 18:31:11'!
prefixCantHaveSpacesErrorDescription

	^ 'Prefixes can not have spaces'! !


!classDefinition: #StateOfOOStack category: 'Stack-Exercise'!
Object subclass: #StateOfOOStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StateOfOOStack methodsFor: 'operationsAccordingToState' stamp: 'sL 5/16/2022 18:33:50'!
sendMessagePopAccordingToActualState: aOOStack

	self subclassResponsibility ! !

!StateOfOOStack methodsFor: 'operationsAccordingToState' stamp: 'sL 5/16/2022 18:33:56'!
sendMessageTopAccordingToActualState: aOOStack

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StateOfOOStack class' category: 'Stack-Exercise'!
StateOfOOStack class
	instanceVariableNames: ''!

!StateOfOOStack class methodsFor: 'operations' stamp: 'MAM 5/16/2022 16:29:49'!
getStatusOf: anOOStack
	
	| currentStatus |
	currentStatus := StateOfOOStack subclasses detect: [ : aSubclass | aSubclass isState: anOOStack].
	
	^currentStatus new! !


!StateOfOOStack class methodsFor: 'testing' stamp: 'MAM 5/16/2022 17:39:08'!
isState: anOOStack

	self subclassResponsibility ! !


!classDefinition: #EmptyState category: 'Stack-Exercise'!
StateOfOOStack subclass: #EmptyState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyState methodsFor: 'operationsAccordingToState' stamp: 'sL 5/16/2022 18:35:04'!
sendMessagePopAccordingToActualState: aOOStack
	
	^aOOStack raiseErrorDueToEmptyStack! !

!EmptyState methodsFor: 'operationsAccordingToState' stamp: 'sL 5/16/2022 18:34:47'!
sendMessageTopAccordingToActualState: aOOStack
	
	^aOOStack raiseErrorDueToEmptyStack! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EmptyState class' category: 'Stack-Exercise'!
EmptyState class
	instanceVariableNames: ''!

!EmptyState class methodsFor: 'testing' stamp: 'MAM 5/16/2022 17:39:50'!
isState: anOOStack

	^anOOStack isEmpty! !


!classDefinition: #NotEmptyState category: 'Stack-Exercise'!
StateOfOOStack subclass: #NotEmptyState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NotEmptyState methodsFor: 'operationsAccordingToState' stamp: 'sL 5/16/2022 18:34:53'!
sendMessagePopAccordingToActualState: aOOStack

	^aOOStack popAuxiliary! !

!NotEmptyState methodsFor: 'operationsAccordingToState' stamp: 'sL 5/16/2022 18:34:58'!
sendMessageTopAccordingToActualState: aOOStack

	^aOOStack topAuxiliary! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NotEmptyState class' category: 'Stack-Exercise'!
NotEmptyState class
	instanceVariableNames: ''!

!NotEmptyState class methodsFor: 'testing' stamp: 'MAM 5/16/2022 17:40:01'!
isState: anOOStack

	^anOOStack isEmpty not! !
