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
	instanceVariableNames: 'anEmptyOOStack anOOStackWithOneElement anOOStackWithManyElements notAnOOStack aFinderWithAnEmptyOOStack aFinderWithAnOOStackWithOneElement aFinderWithAnOOStackWithManyElements aFinderWithNotAnOOStack resultsForAnEmptyOOStack resultsForAnOOStackWithOneElement resultsForAnOOStackWithManyElements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'MAM 5/15/2022 22:32:33'!
setUp
	
	"Stacks"
	notAnOOStack := Dictionary new.

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
	
	"Finders"
	
	aFinderWithNotAnOOStack := SentenceFinderByPrefix with: notAnOOStack.
	
	aFinderWithAnEmptyOOStack := SentenceFinderByPrefix with: anEmptyOOStack.
	
	aFinderWithAnOOStackWithOneElement := SentenceFinderByPrefix with: anOOStackWithOneElement.
	
	aFinderWithAnOOStackWithManyElements := SentenceFinderByPrefix with: anOOStackWithManyElements.
	
	"Results"
	
	resultsForAnEmptyOOStack := OrderedCollection new.
	
	resultsForAnOOStackWithOneElement := OrderedCollection new.
	resultsForAnOOStackWithOneElement add: 'Messi'.
	
	resultsForAnOOStackWithManyElements := OrderedCollection new.
	resultsForAnOOStackWithManyElements add: 'Messi'.
	resultsForAnOOStackWithManyElements add: 'Messias'.
	resultsForAnOOStackWithManyElements add: 'Messi es crack'.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'MAM 5/15/2022 23:08:12'!
test01oneElementCorrectlyFoundFromAnOOStackWithOneElement

	self assert: (aFinderWithAnOOStackWithOneElement find: 'Messi') equals: resultsForAnOOStackWithOneElement! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'MAM 5/15/2022 22:31:21'!
test02someElementsCorrectlyFoundFromAnOOStackWithManyElements

	self assert: (aFinderWithAnOOStackWithManyElements find: 'Messi') equals: resultsForAnOOStackWithManyElements! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefixTest class' category: 'Stack-Exercise'!
SentenceFinderByPrefixTest class
	instanceVariableNames: 'anEmptyStack'!


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'elementosApilados'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'initialization' stamp: 'MAM 5/15/2022 10:37:15'!
initialize
	
	super initialize.
	elementosApilados := OrderedCollection new.! !


!OOStack methodsFor: 'operations' stamp: 'MAM 5/15/2022 10:37:32'!
isEmpty

	^elementosApilados isEmpty! !

!OOStack methodsFor: 'operations' stamp: 'MAM 5/15/2022 21:35:14'!
pop

	^self sendToTheActualStateTheOperation esValidoHacerPop: self! !

!OOStack methodsFor: 'operations' stamp: 'MAM 5/15/2022 10:37:48'!
push: elementoParaAgregar

	elementosApilados add: elementoParaAgregar.! !

!OOStack methodsFor: 'operations' stamp: 'MAM 5/12/2022 14:39:51'!
size
	^elementosApilados size.! !

!OOStack methodsFor: 'operations' stamp: 'MAM 5/15/2022 21:35:45'!
top

	^self sendToTheActualStateTheOperation esValidoHacerTop: self! !


!OOStack methodsFor: 'operations - private' stamp: 'MAM 5/15/2022 11:03:32'!
popValidado
	
	| elementoDesapilado |
	
	elementoDesapilado := elementosApilados last.
	elementosApilados removeLast.
	^elementoDesapilado! !

!OOStack methodsFor: 'operations - private' stamp: 'MAM 5/15/2022 10:48:17'!
raiseErrorEmptyStack
	
	^self error: OOStack stackEmptyErrorDescription! !

!OOStack methodsFor: 'operations - private' stamp: 'MAM 5/15/2022 21:34:42'!
sendToTheActualStateTheOperation

	| estadoActual |
	estadoActual := StateOfOOStack subclasses detect: [ : aSubclass | aSubclass isState: self].
	"^(anOperation asMessageWith: self) sendTo: estadoActual new."
	^estadoActual new! !

!OOStack methodsFor: 'operations - private' stamp: 'MAM 5/15/2022 11:03:54'!
topValidado

	^elementosApilados last.! !

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

!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'sL 5/16/2022 00:28:12'!
initializeWith: AnOOStack

	OOStackAsociated := AnOOStack 
! !


!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'sL 5/15/2022 23:25:05'!
find: aPrefix

	|anAuxiliaryOOStack anElement anAuxiliaryOrderedCollection result|
	
	anAuxiliaryOOStack := OOStack new.
	anAuxiliaryOrderedCollection := OrderedCollection new.
	(OOStackAsociated size) timesRepeat: [
		anElement := OOStackAsociated pop.
		anAuxiliaryOrderedCollection addFirst: anElement.
		anAuxiliaryOOStack push: anElement.
		].
	"falta regresar al stack a su estado anterior"
	
	result := anAuxiliaryOrderedCollection select: [: Element | Element beginsWith: aPrefix].
	^result! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: 'OOStackAsociado'!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'sL 5/16/2022 00:25:24'!
associatedOOStackIsEmptyErrorDescription

	^ 'Associated stack must not be empty'! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'sL 5/16/2022 00:25:30'!
associatedOOStackIsNotAOOStackErrorDescription

	^ 'Associated stack with Sentence Finder is must be a OOStack'! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'sL 5/16/2022 00:21:07'!
emptyPrefixErrorDescription

	^ 'Prefixes can not be empty'! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'sL 5/16/2022 00:22:22'!
prefixCantHaveSpacesErrorDescription

	^ 'Prefixes can not have spaces'! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'sL 5/16/2022 00:21:57'!
prefixIsNotStringErrorDescription

	^ 'Prefixes must be strings'! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'MAM 5/15/2022 15:59:54'!
with: AnOOStack

	| newFinder |
	newFinder := SentenceFinderByPrefix new initializeWith: AnOOStack.
	^newFinder! !


!classDefinition: #StateOfOOStack category: 'Stack-Exercise'!
Object subclass: #StateOfOOStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StateOfOOStack methodsFor: 'as yet unclassified' stamp: 'MAM 5/15/2022 11:00:37'!
esValidoHacerPop: aOOStack

	self subclassResponsibility ! !

!StateOfOOStack methodsFor: 'as yet unclassified' stamp: 'MAM 5/15/2022 11:00:41'!
esValidoHacerTop: aOOStack

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StateOfOOStack class' category: 'Stack-Exercise'!
StateOfOOStack class
	instanceVariableNames: ''!

!StateOfOOStack class methodsFor: 'as yet unclassified' stamp: 'MAM 5/15/2022 10:53:51'!
IsState: aOOStack
	
	^self subclassResponsibility! !


!classDefinition: #EmptyState category: 'Stack-Exercise'!
StateOfOOStack subclass: #EmptyState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyState methodsFor: 'as yet unclassified' stamp: 'MAM 5/15/2022 10:49:50'!
esValidoHacerPop: aOOStack
	
	^aOOStack raiseErrorEmptyStack! !

!EmptyState methodsFor: 'as yet unclassified' stamp: 'MAM 5/15/2022 10:49:58'!
esValidoHacerTop: aOOStack
	
	^aOOStack raiseErrorEmptyStack! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EmptyState class' category: 'Stack-Exercise'!
EmptyState class
	instanceVariableNames: ''!

!EmptyState class methodsFor: 'as yet unclassified' stamp: 'MAM 5/15/2022 10:59:51'!
isState: aOOStack
	
	^aOOStack isEmpty! !


!classDefinition: #NotEmptyState category: 'Stack-Exercise'!
StateOfOOStack subclass: #NotEmptyState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NotEmptyState methodsFor: 'as yet unclassified' stamp: 'MAM 5/15/2022 11:11:00'!
esValidoHacerPop: aOOStack

	^aOOStack popValidado! !

!NotEmptyState methodsFor: 'as yet unclassified' stamp: 'MAM 5/15/2022 11:11:06'!
esValidoHacerTop: aOOStack

	^aOOStack topValidado! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NotEmptyState class' category: 'Stack-Exercise'!
NotEmptyState class
	instanceVariableNames: ''!

!NotEmptyState class methodsFor: 'as yet unclassified' stamp: 'MAM 5/15/2022 10:59:57'!
isState: aOOStack
	
	^aOOStack isEmpty not.! !
