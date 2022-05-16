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
	instanceVariableNames: 'anEmptyOOStack anOOStackWithOneElement anOOStackWithManyElements notAnOOStack aFinderWithAnEmptyOOStack aFinderWithAnOOStackWithOneElement aFinderWithAnOOStackWithManyElements aFinderWithNotAnOOStack resultsForAnEmptyOOStack resultsForAnOOStackWithOneElement resultsForAnOOStackWithManyElements resultsForAnOOStackWithNoElementsFound anOOStackWithManyElementsCopy anOOStackWithNumbers aFinderWithAnOOStackWithNumbers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'sL 5/16/2022 09:02:09'!
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
	
	anOOStackWithManyElementsCopy := OOStack new.
	anOOStackWithManyElementsCopy push: 'RodrigoDePaul'.
	anOOStackWithManyElementsCopy push: 'LautaroMartinez'.
	anOOStackWithManyElementsCopy push: 'ElDibu'.
	anOOStackWithManyElementsCopy push: 'DiMaria'.
	anOOStackWithManyElementsCopy push: 'Messi'.
	anOOStackWithManyElementsCopy push: 'Messias'.
	anOOStackWithManyElementsCopy push: 'Messi es crack'.
	anOOStackWithManyElementsCopy push: 'Scaloni es crack'.
	
	anOOStackWithNumbers := OOStack new.
	anOOStackWithNumbers push: 1.
	anOOStackWithNumbers push: 10.
	anOOStackWithNumbers push: 100.
	
	"Finders"
	
	"aFinderWithNotAnOOStack := SentenceFinderByPrefix with: notAnOOStack." "<-- Eliminar"
	
	"aFinderWithAnEmptyOOStack := SentenceFinderByPrefix with: anEmptyOOStack." "<-- Crear en el lugar"
		
	"aFinderWithAnOOStackWithNumbers := SentenceFinderByPrefix with: anOOStackWithNumbers." "<-- Crear en el lugar"
	
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
	resultsForAnOOStackWithManyElements add: 'Messi es crack'.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MAM 5/15/2022 23:08:12'!
test01oneElementCorrectlyFoundFromAnOOStackWithOneElement

	self assert: (aFinderWithAnOOStackWithOneElement find: 'Messi') equals: resultsForAnOOStackWithOneElement! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MAM 5/15/2022 22:31:21'!
test02someElementsCorrectlyFoundFromAnOOStackWithManyElements

	self assert: (aFinderWithAnOOStackWithManyElements find: 'Messi') equals: resultsForAnOOStackWithManyElements! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'sL 5/16/2022 07:39:21'!
test03ceroElementsCorrectlyFoundFromAnOOStackWithManyElements

	self assert: (aFinderWithAnOOStackWithManyElements find: 'Nada') equals: resultsForAnOOStackWithNoElementsFound ! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'sL 5/16/2022 08:08:16'!
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

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'sL 5/16/2022 07:47:05'!
test05prefixMustBeString

	self 
		should: [ aFinderWithAnOOStackWithManyElements find: 501 ]
		raise: Error
		withExceptionDo: [ :anError | self assert: SentenceFinderByPrefix prefixIsNotStringErrorDescription equals: anError messageText ]! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'sL 5/16/2022 08:08:27'!
test06prefixCantHaveSpaces

	self 
		should: [ aFinderWithAnOOStackWithManyElements find: 'Hansel y Gretel' ]
		raise: Error
		withExceptionDo: [ :anError | self assert: SentenceFinderByPrefix prefixCantHaveSpacesErrorDescription equals: anError messageText ]! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'sL 5/16/2022 09:02:58'!
test07stackCantBeEmpty
	
	| Test07Finder |

	self 
		should: [ Test07Finder := SentenceFinderByPrefix with: anEmptyOOStack. ]
		raise: Error
		withExceptionDo: [ :anError | self assert: SentenceFinderByPrefix associatedOOStackIsEmptyErrorDescription equals: anError messageText ]! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'sL 5/16/2022 09:13:11'!
test08stackElementsMustBeStrings

	| Test08Finder |

	self 
		should: [ Test08Finder := SentenceFinderByPrefix with: anOOStackWithNumbers . ]
		raise: Error
		withExceptionDo: [ :anError | self assert: SentenceFinderByPrefix associatedOOStackContainsNotStringsErrorDescription equals: anError messageText ]! !

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


!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'sL 5/16/2022 10:31:29'!
find: aPrefix

	^(self detectPrefixState: aPrefix) find: aPrefix in: OOStackAsociated.
! !


!SentenceFinderByPrefix methodsFor: 'operationsAuxiliaries-private' stamp: 'sL 5/16/2022 10:31:45'!
detectPrefixState: aPrefix

	| prefixState |
	
	prefixState := StateOfPrefix subclasses detect: [ : aSubclass | aSubclass isState: aPrefix].
	
	^prefixState new! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: 'OOStackAsociado'!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'sL 5/16/2022 08:07:08'!
associatedOOStackContainsNotStringsErrorDescription

	^ 'Associated stack must only contain strings'! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'sL 5/16/2022 00:25:24'!
associatedOOStackIsEmptyErrorDescription

	^ 'Associated stack must not be empty'! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'sL 5/16/2022 00:21:07'!
emptyPrefixErrorDescription

	^ 'Prefixes can not be empty'! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'sL 5/16/2022 00:22:22'!
prefixCantHaveSpacesErrorDescription

	^ 'Prefixes can not have spaces'! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'sL 5/16/2022 00:21:57'!
prefixIsNotStringErrorDescription

	^ 'Prefixes must be strings'! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'sL 5/16/2022 10:08:24'!
with: AnOOStack

	| newFinder anElement anAuxiliaryOOStack |
	anAuxiliaryOOStack := OOStack new.
	
	((AnOOStack size) = 0) ifTrue: [
		self error: SentenceFinderByPrefix associatedOOStackIsEmptyErrorDescription 
		].
	
	(AnOOStack size) timesRepeat: [
		anElement := AnOOStack pop.
		(anElement isString) ifFalse: [self error: SentenceFinderByPrefix associatedOOStackContainsNotStringsErrorDescription].
		anAuxiliaryOOStack push: anElement.
		].
	(anAuxiliaryOOStack size) timesRepeat: [
	anElement := anAuxiliaryOOStack pop.
	AnOOStack push: anElement.
	].
	
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

!StateOfOOStack class methodsFor: 'as yet unclassified' stamp: 'sL 5/16/2022 09:46:14'!
IsState: aOOStack
	
	self subclassResponsibility! !


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


!classDefinition: #StateOfPrefix category: 'Stack-Exercise'!
Object subclass: #StateOfPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StateOfPrefix methodsFor: 'operations' stamp: 'sL 5/16/2022 10:24:59'!
find: aPrefix in: anOOStack
	
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StateOfPrefix class' category: 'Stack-Exercise'!
StateOfPrefix class
	instanceVariableNames: ''!

!StateOfPrefix class methodsFor: 'as yet unclassified' stamp: 'sL 5/16/2022 09:47:07'!
isState: aString

	self subclassResponsibility ! !


!classDefinition: #HasSpaces category: 'Stack-Exercise'!
StateOfPrefix subclass: #HasSpaces
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!HasSpaces methodsFor: 'operations' stamp: 'sL 5/16/2022 10:24:56'!
find: aPrefix in: anOOStack

	self error: SentenceFinderByPrefix prefixCantHaveSpacesErrorDescription
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'HasSpaces class' category: 'Stack-Exercise'!
HasSpaces class
	instanceVariableNames: ''!

!HasSpaces class methodsFor: 'as yet unclassified' stamp: 'sL 5/16/2022 09:48:21'!
isState: aString

	^aString includesSubString: ' '.
! !


!classDefinition: #IsNotString category: 'Stack-Exercise'!
StateOfPrefix subclass: #IsNotString
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!IsNotString methodsFor: 'operations' stamp: 'sL 5/16/2022 10:24:53'!
find: aPrefix in: anOOStack

	self error: SentenceFinderByPrefix prefixIsNotStringErrorDescription ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IsNotString class' category: 'Stack-Exercise'!
IsNotString class
	instanceVariableNames: ''!

!IsNotString class methodsFor: 'as yet unclassified' stamp: 'sL 5/16/2022 10:17:22'!
isState: aString

	^aString isString not.! !


!classDefinition: #IsValid category: 'Stack-Exercise'!
StateOfPrefix subclass: #IsValid
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!IsValid methodsFor: 'operations' stamp: 'sL 5/16/2022 10:24:46'!
find: aPrefix in: anOOStack

	| result anAuxiliaryOrderedCollection anElement anAuxiliaryOOStack |
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

	result := anAuxiliaryOrderedCollection select: [: Element | Element beginsWith: aPrefix].
	^result! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IsValid class' category: 'Stack-Exercise'!
IsValid class
	instanceVariableNames: ''!

!IsValid class methodsFor: 'as yet unclassified' stamp: 'sL 5/16/2022 10:23:36'!
isState: aString

	| isItString |
	
	isItString := aString isString.
	^(aString includesSubString: ' ') not & aString isString.! !
