!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'MAM 6/2/2022 21:56:10'!
test08TransactionWorks

	| account deposit anotherAccount |
	
	account := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
	
	
	account transfer: 50 * peso to: anotherAccount.
		
	self assert: account  balance equals: 0 * peso.
	self assert: anotherAccount balance equals: 50 * peso.
! !


!classDefinition: #TransferenceTests category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferenceTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceTests methodsFor: 'tests' stamp: 'sL 6/7/2022 18:17:53'!
aaatest04TransferenceKnowsItsSender

	| originAccount destinationAccount firstTransference |
	
	originAccount _ ReceptiveAccount new.
	
	destinationAccount _ ReceptiveAccount new.
	
	firstTransference _ Transference send: 50*peso from: originAccount to: destinationAccount.
	
	self assert: (firstTransference sender) equals: originAccount .
	! !

!TransferenceTests methodsFor: 'tests' stamp: 'sL 6/7/2022 18:18:01'!
aaatest05TransferenceKnowsItsReceiver

	| originAccount destinationAccount firstTransference |
	
	originAccount _ ReceptiveAccount new.
	
	destinationAccount _ ReceptiveAccount new.
	
	firstTransference _ Transference send: 50*peso from: originAccount to: destinationAccount.
	
	self assert: (firstTransference receiver) equals: destinationAccount .
	! !

!TransferenceTests methodsFor: 'tests' stamp: 'sL 6/7/2022 17:52:32'!
test01TransferenceTakesMoneyFromOriginAccount

	| originAccount destinationAccount |
	
	originAccount _ ReceptiveAccount new.
	
	destinationAccount _ ReceptiveAccount new.
	
	Transference send: 50*peso from: originAccount  to: destinationAccount.
	
	self assert: originAccount  balance equals: -50 * peso.
	! !

!TransferenceTests methodsFor: 'tests' stamp: 'sL 6/7/2022 17:53:08'!
test02TransferenceSendsMoneyToDestinationAccount

	| originAccount destinationAccount |
	
	originAccount _ ReceptiveAccount new.
	
	destinationAccount _ ReceptiveAccount new.
	
	Transference send: 50*peso from: originAccount  to: destinationAccount.
	
	self assert: destinationAccount  balance equals: 50 * peso.
	! !

!TransferenceTests methodsFor: 'tests' stamp: 'sL 6/7/2022 18:39:01'!
test03TransferenceContainsCorrectAmount

	| originAccount destinationAccount firstTransference |
	
	originAccount _ ReceptiveAccount new.
	
	destinationAccount _ ReceptiveAccount new.
	
	firstTransference _ Transference send: 50*peso from: originAccount to: destinationAccount.
	
	self assert: (firstTransference value) equals: 50 * peso.
	! !

!TransferenceTests methodsFor: 'tests' stamp: 'sL 6/7/2022 18:39:06'!
test04DepositAndWithdrawOfTransferKnowsTheirCounterparts

	| originAccount destinationAccount firstTransference |
	
	originAccount _ ReceptiveAccount new.
	
	destinationAccount _ ReceptiveAccount new.
	
	firstTransference _ Transference send: 50*peso from: originAccount to: destinationAccount.
	
	self assert: ((firstTransference deposit) counterpart) equals: ((firstTransference withdraw) counterpart).
	! !

!TransferenceTests methodsFor: 'tests' stamp: 'sL 6/7/2022 18:45:22'!
test05accountCantTransferToItself

	| originAccount |
	
	originAccount _ ReceptiveAccount new.
	
	self 
		should: [ Transference send: 50*peso from: originAccount to: originAccount.]
		raise: Error
		withExceptionDo: [ :anError | self assert: Transference cantSendToItselfErrorDescription equals: anError messageText ].
	
	
	! !

!TransferenceTests methodsFor: 'tests' stamp: 'sL 6/7/2022 18:54:44'!
test06cantTransferANegativeValue

	| originAccount destinationAccount |
	
	originAccount _ ReceptiveAccount new.
	
	destinationAccount _ ReceptiveAccount new.
	
	self 
		should: [Transference send: -50*peso from: originAccount to: destinationAccount.]
		raise: Error
		withExceptionDo: [:anError | self assert: Transference cantTransferNegativeAmountErrorDescription equals: anError messageText ]
	! !

!TransferenceTests methodsFor: 'tests' stamp: 'sL 6/7/2022 18:58:05'!
test07cantTransferAZeroValue

	| originAccount destinationAccount |
	
	originAccount _ ReceptiveAccount new.
	
	destinationAccount _ ReceptiveAccount new.
	
	self 
		should: [Transference send: 0*peso from: originAccount to: destinationAccount.]
		raise: Error
		withExceptionDo: [:anError | self assert: Transference cantTransferZeroAmountErrorDescription equals: anError messageText ]
	! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'sL 6/7/2022 17:48:25'!
arithmeticValue

	^ self value.! !

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'sL 6/7/2022 17:47:05'!
arithmeticValue

	^ self value.! !

!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferDeposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferDeposit
	instanceVariableNames: 'value counterpart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'sL 6/7/2022 17:47:09'!
arithmeticValue

	^ self value.! !

!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'sL 6/7/2022 18:35:38'!
counterpart

	^ counterpart! !

!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'sL 6/7/2022 17:46:22'!
initializeFor: aValue 
	
	value := aValue.! !

!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'sL 6/7/2022 18:34:31'!
initializeFor: aValue andCounterpart: withdrawCounterpart

	value _ aValue .
	
	counterpart _ withdrawCounterpart.! !

!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'sL 6/7/2022 17:49:28'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferDeposit class' category: 'ServiciosFinancieros-Ejercicio'!
TransferDeposit class
	instanceVariableNames: ''!

!TransferDeposit class methodsFor: 'as yet unclassified' stamp: 'sL 6/7/2022 17:46:13'!
for: aValue 

	^ self new initializeFor: aValue ! !

!TransferDeposit class methodsFor: 'as yet unclassified' stamp: 'sL 6/7/2022 18:33:20'!
for: aValue With: withdrawCounterpart

	^ self new initializeFor: aValue andCounterpart: withdrawCounterpart.! !


!classDefinition: #TransferWithdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferWithdraw
	instanceVariableNames: 'value counterpart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferWithdraw methodsFor: 'initialization' stamp: 'sL 6/7/2022 17:46:57'!
arithmeticValue

	^ self value negated! !

!TransferWithdraw methodsFor: 'initialization' stamp: 'sL 6/7/2022 18:35:42'!
counterpart

	^ counterpart! !

!TransferWithdraw methodsFor: 'initialization' stamp: 'sL 6/7/2022 17:44:21'!
initializeFor: aValue 
	
	value := aValue.! !

!TransferWithdraw methodsFor: 'initialization' stamp: 'sL 6/7/2022 18:35:20'!
initializeFor: aValue andCounterpart: depositCounterpart

	value _ aValue .
	
	counterpart _ depositCounterpart.! !

!TransferWithdraw methodsFor: 'initialization' stamp: 'sL 6/7/2022 17:49:31'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferWithdraw class' category: 'ServiciosFinancieros-Ejercicio'!
TransferWithdraw class
	instanceVariableNames: ''!

!TransferWithdraw class methodsFor: 'as yet unclassified' stamp: 'sL 6/7/2022 17:43:42'!
for: aValue 

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'sL 6/7/2022 17:46:51'!
arithmeticValue

	^ self value negated! !

!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'MAM 6/2/2022 21:48:29'!
balance

	^transactions sum: [ :aTransaction | aTransaction arithmeticValue ] ifEmpty: [ 0 ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'MAM 6/2/2022 21:57:30'!
transfer: anAmountOfMoney to: anotherAccount
	Deposit register: anAmountOfMoney on: anotherAccount.
	Withdraw register: anAmountOfMoney on: self.

! !


!classDefinition: #Transference category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transference
	instanceVariableNames: 'value withdraw deposit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transference methodsFor: 'as yet unclassified' stamp: 'sL 6/7/2022 18:31:57'!
deposit

	^deposit ! !

!Transference methodsFor: 'as yet unclassified' stamp: 'sL 6/7/2022 18:31:05'!
initializeWithWithdraw: aTransferWithdraw andDeposit: aTransferDeposit.

	value _ aTransferWithdraw value.
	
	withdraw _ aTransferWithdraw.
	
	deposit _ aTransferDeposit.
	! !

!Transference methodsFor: 'as yet unclassified' stamp: 'sL 6/7/2022 18:13:05'!
value

	^value! !

!Transference methodsFor: 'as yet unclassified' stamp: 'sL 6/7/2022 18:31:48'!
withdraw

	^withdraw ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transference class' category: 'ServiciosFinancieros-Ejercicio'!
Transference class
	instanceVariableNames: ''!

!Transference class methodsFor: 'as yet unclassified' stamp: 'sL 6/7/2022 18:46:00'!
cantSendToItselfErrorDescription

	^'Account cant make a transference to itself.'! !

!Transference class methodsFor: 'as yet unclassified' stamp: 'sL 6/7/2022 18:55:18'!
cantTransferNegativeAmountErrorDescription

	^'Cant make a negative amount transference.'! !

!Transference class methodsFor: 'as yet unclassified' stamp: 'sL 6/7/2022 18:59:40'!
cantTransferZeroAmountErrorDescription

	^'Cant make a zero amount transference.'! !

!Transference class methodsFor: 'as yet unclassified' stamp: 'sL 6/7/2022 18:59:28'!
send: anAmount from: aSenderAccount to: aReceivingAccount 

	| aTransferDeposit aTransferWithdraw |
	
	(aSenderAccount = aReceivingAccount) ifTrue: [
		self error: Transference cantSendToItselfErrorDescription.
		].
	
	(anAmount negative) ifTrue: [
		self error: Transference cantTransferNegativeAmountErrorDescription .
		].
	
	(anAmount isZero) ifTrue: [
		self error: Transference cantTransferZeroAmountErrorDescription .
		].
	
	aTransferWithdraw _ TransferWithdraw register: anAmount on: aSenderAccount .
	
	aTransferDeposit _ TransferDeposit register: anAmount on: aReceivingAccount .

	^self new initializeWithWithdraw: aTransferWithdraw andDeposit: aTransferDeposit.
	

	! !
