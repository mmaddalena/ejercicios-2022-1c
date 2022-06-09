!classDefinition: #PortfoliosTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfoliosTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfoliosTest methodsFor: 'tests-portfolioWithPortfolios' stamp: 'sL 6/8/2022 23:46:56'!
test05APortfolioWithPortfoliosBalanceIsTheSumOfAllItsAccountsBalances
	
	| originalPortfolio secondPortfolio anAccount anotherAccount anOverdraftingAccount |
	
	anAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: anAccount.
	Deposit register: 11 * peso on: anAccount.
	
	anotherAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: anotherAccount.
	
	anOverdraftingAccount := ReceptiveAccount new.
	Withdraw register: 5 * peso on: anOverdraftingAccount.
	
	originalPortfolio := Portfolio new.
	secondPortfolio := Portfolio new.
	originalPortfolio add: secondPortfolio.
	secondPortfolio add: anAccount.
	secondPortfolio add: anotherAccount.
	secondPortfolio add: anOverdraftingAccount.
	
	self assert: (originalPortfolio balance) equals: (26 * peso)! !

!PortfoliosTest methodsFor: 'tests-portfolioWithPortfolios' stamp: 'sL 6/8/2022 23:47:00'!
test06APortfolioWithPortfoliosFindsARegisteredTransaction

	| originalPortfolio secondPortfolio anAccount aTransaction|
	
	anAccount := ReceptiveAccount new.
	aTransaction := Deposit register: 10 * peso on: anAccount.
	
	originalPortfolio := Portfolio new.
	secondPortfolio := Portfolio new.
	
	originalPortfolio add: secondPortfolio.
	secondPortfolio add: anAccount.
	
	self assert: (originalPortfolio hasRegistered: aTransaction).! !

!PortfoliosTest methodsFor: 'tests-portfolioWithPortfolios' stamp: 'sL 6/8/2022 23:47:04'!
test07APortfolioWithPortfoliosDoesntFindAnUnregisterTransaction

	| originalPortfolio secondPortfolio anAccount aTransaction|
	
	anAccount := ReceptiveAccount new.
	aTransaction := Deposit register: 10 * peso on: anAccount.
	
	originalPortfolio := Portfolio new.
	secondPortfolio := Portfolio new.
	
	originalPortfolio add: secondPortfolio.
	
	self deny: (originalPortfolio hasRegistered: aTransaction).! !

!PortfoliosTest methodsFor: 'tests-portfolioWithPortfolios' stamp: 'sL 6/8/2022 23:47:07'!
test08APortfolioWithPortfoliosReturnsAllRegisteredTransactions

	| originalPortfolio secondPortfolio anAccount aTransaction collectionToCompare anotherTransaction |
	
	anAccount := ReceptiveAccount new.
	aTransaction := Deposit register: 10000 * peso on: anAccount.
	anotherTransaction := Deposit register: 5000 * peso on: anAccount.
	
	originalPortfolio := Portfolio new.
	secondPortfolio := Portfolio new.
	
	originalPortfolio add: secondPortfolio.
	secondPortfolio add: anAccount.
	
	collectionToCompare := OrderedCollection new.
	collectionToCompare add: aTransaction; add: anotherTransaction.
	self assert: (originalPortfolio transactions) equals: (collectionToCompare).! !


!PortfoliosTest methodsFor: 'tests-portfolioWithReceptiveAccountsAndPortfolios' stamp: 'sL 6/8/2022 23:47:16'!
test09APortfolioWithPortfoliosAndReceptiveAccountsBalanceIsTheSumOfAllItsAccountsBalances
	
	| anAccountInOriginalPortfolio originalPortfolio secondPortfolio anAccount anotherAccount anOverdraftingAccount |
	
	anAccountInOriginalPortfolio := ReceptiveAccount new.
	Deposit register: 10 * peso on: anAccountInOriginalPortfolio.
	
	anAccount := ReceptiveAccount new.
	Deposit register: 20 * peso on: anAccount.
	Deposit register: 30 * peso on: anAccount.
	
	anotherAccount := ReceptiveAccount new.
	Deposit register: 40 * peso on: anotherAccount.
	
	anOverdraftingAccount := ReceptiveAccount new.
	Withdraw register: 5 * peso on: anOverdraftingAccount.
	
	originalPortfolio := Portfolio new.
	secondPortfolio := Portfolio new.
	originalPortfolio add: secondPortfolio.
	originalPortfolio add: anAccountInOriginalPortfolio.
	secondPortfolio add: anAccount.
	secondPortfolio add: anotherAccount.
	secondPortfolio add: anOverdraftingAccount.
	
	self assert: (originalPortfolio balance) equals: (95 * peso)! !

!PortfoliosTest methodsFor: 'tests-portfolioWithReceptiveAccountsAndPortfolios' stamp: 'sL 6/8/2022 23:54:23'!
test10APortfolioWithPortfoliosAndReceptiveAccountsFindsARegisteredTransaction

	| originalPortfolio secondPortfolio anAccountInOriginalPortfolio anAccountInSecondPortfolio aTransactionInOriginalPortfolio aTransactionInSecondPortfolio|
	
	anAccountInOriginalPortfolio := ReceptiveAccount new.
	anAccountInSecondPortfolio := ReceptiveAccount new.
	
	aTransactionInOriginalPortfolio _ Deposit register: 5 * peso on: anAccountInOriginalPortfolio.
	aTransactionInSecondPortfolio := Deposit register: 10 * peso on: anAccountInSecondPortfolio.
	
	originalPortfolio := Portfolio new.
	secondPortfolio := Portfolio new.
	
	originalPortfolio add: anAccountInOriginalPortfolio.
	originalPortfolio add: secondPortfolio.
	secondPortfolio add: anAccountInSecondPortfolio.
	
	self assert: (originalPortfolio hasRegistered: aTransactionInOriginalPortfolio).
	self assert: (originalPortfolio hasRegistered: aTransactionInSecondPortfolio).! !

!PortfoliosTest methodsFor: 'tests-portfolioWithReceptiveAccountsAndPortfolios' stamp: 'sL 6/8/2022 23:59:56'!
test11APortfolioWithPortfoliosAndReceptiveAccountsDoesntFindAnUnregisterTransaction

	| originalPortfolio secondPortfolio anAccountInOriginalPortfolio anAccountInSecondPortfolio aTransaction anotherTransaction |
	
	anAccountInOriginalPortfolio := ReceptiveAccount new.
	anAccountInSecondPortfolio := ReceptiveAccount new.
	aTransaction := Deposit register: 10 * peso on: anAccountInOriginalPortfolio.
	anotherTransaction := Deposit register: 15 * peso on: anAccountInSecondPortfolio.
	
	originalPortfolio := Portfolio new.
	secondPortfolio := Portfolio new.
	
	originalPortfolio add: secondPortfolio.
	
	self deny: (originalPortfolio hasRegistered: aTransaction).
	self deny: (originalPortfolio hasRegistered: anotherTransaction).! !

!PortfoliosTest methodsFor: 'tests-portfolioWithReceptiveAccountsAndPortfolios' stamp: 'sL 6/9/2022 00:10:00'!
test12APortfolioWithPortfoliosAndReceptiveAccountsReturnsAllRegisteredTransactions
	
	| firstPortfolio secondPortfolio anAccountInFirstPortfolio anAccountInSecondPortfolio firstTransaction secondTransaction thirdTransaction collectionToCompare |
	
	anAccountInFirstPortfolio := ReceptiveAccount new.
	firstTransaction := Deposit register: 10000 * peso on: anAccountInFirstPortfolio.
	secondTransaction := Deposit register: 5000 * peso on: anAccountInFirstPortfolio.
	
	anAccountInSecondPortfolio := ReceptiveAccount new.
	thirdTransaction := Deposit register: 10 * peso on: anAccountInSecondPortfolio.
	
	firstPortfolio := Portfolio new.
	firstPortfolio add: anAccountInSecondPortfolio.
	
	secondPortfolio := Portfolio new.
	secondPortfolio add: anAccountInFirstPortfolio.
	
	firstPortfolio add: secondPortfolio.

	collectionToCompare := OrderedCollection new.
	collectionToCompare add: thirdTransaction; add: firstTransaction; add: secondTransaction.
	self assert: (firstPortfolio transactions) equals: (collectionToCompare)! !


!PortfoliosTest methodsFor: 'tests-portfolioWithReceptiveAccounts' stamp: 'sL 6/8/2022 23:46:34'!
test01APortfolioWithReceptiveAccountsBalanceIsTheSumOfAllItsAccountsBalances
	
	| aPortfolio anAccount anotherAccount anOverdraftingAccount |
	
	anAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: anAccount.
	
	anotherAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: anotherAccount.
	
	anOverdraftingAccount := ReceptiveAccount new.
	Withdraw register: 5 * peso on: anOverdraftingAccount.
	
	aPortfolio := Portfolio new.
	aPortfolio add: anAccount.
	aPortfolio add: anotherAccount.
	aPortfolio add: anOverdraftingAccount.
	
	self assert: (aPortfolio balance) equals: (15 * peso)! !

!PortfoliosTest methodsFor: 'tests-portfolioWithReceptiveAccounts' stamp: 'sL 6/8/2022 23:46:37'!
test02APortfolioWithReceptiveAccountsFindsARegisteredTransaction
	
	| aPortfolio anAccount aTransaction|
	
	anAccount := ReceptiveAccount new.
	aTransaction := Deposit register: 10 * peso on: anAccount.
	
	aPortfolio := Portfolio new.
	aPortfolio add: anAccount.
	
	self assert: (aPortfolio hasRegistered: aTransaction).! !

!PortfoliosTest methodsFor: 'tests-portfolioWithReceptiveAccounts' stamp: 'sL 6/8/2022 23:46:48'!
test03APortfolioWithReceptiveAccountsDoesntFindAnUnregisteredTransaction
	
	| aPortfolio anAccount aTransaction|
	
	anAccount := ReceptiveAccount new.
	aTransaction := Deposit register: 10 * peso on: anAccount.
	
	aPortfolio := Portfolio new.
	
	self deny: (aPortfolio hasRegistered: aTransaction).! !

!PortfoliosTest methodsFor: 'tests-portfolioWithReceptiveAccounts' stamp: 'sL 6/8/2022 23:46:52'!
test04APortfolioWithReceptiveAccountsReturnsAllRegisteredTransactions
	
	| aPortfolio anAccount aTransaction anotherTransaction collectionToCompare |
	
	anAccount := ReceptiveAccount new.
	aTransaction := Deposit register: 10000 * peso on: anAccount.
	anotherTransaction := Deposit register: 5000 * peso on: anAccount.
	
	aPortfolio := Portfolio new.
	aPortfolio add: anAccount.

	collectionToCompare := OrderedCollection new.
	collectionToCompare add: aTransaction; add: anotherTransaction.
	self assert: (aPortfolio transactions) equals: (collectionToCompare)! !


!PortfoliosTest methodsFor: 'tests-extras' stamp: 'sL 6/9/2022 12:33:37'!
test12APortfolioCantAddTheSameAccountTwice

	| originalPortfolio firstAccount |
	
	originalPortfolio _ Portfolio new.
	
	firstAccount _ ReceptiveAccount new.
	
	originalPortfolio add: firstAccount.
	
	self 
		should: [ originalPortfolio add: firstAccount .]
		raise: Error
		withExceptionDo: [ :anError | self assert: Portfolio cantHaveTheSameAccountMultipleTimesErrorDescription equals: anError messageText ].
	! !

!PortfoliosTest methodsFor: 'tests-extras' stamp: 'sL 6/9/2022 12:33:37'!
test13APortfolioWithPortfoliosCantAddTheSameAccountTwice

	| originalPortfolio secondPortfolio firstAccount |
	
	originalPortfolio _ Portfolio new.
	secondPortfolio _ Portfolio new.
	
	firstAccount _ ReceptiveAccount new.
	
	secondPortfolio add: firstAccount.
	originalPortfolio add: secondPortfolio.
	
	self 
		should: [ originalPortfolio add: firstAccount .]
		raise: Error
		withExceptionDo: [ :anError | self assert: Portfolio cantHaveTheSameAccountMultipleTimesErrorDescription equals: anError messageText ].
	! !

!PortfoliosTest methodsFor: 'tests-extras' stamp: 'sL 6/9/2022 12:33:37'!
test14APortfolioWithPortfoliosWithPortfoliosCantAddTheSameAccountTwice

	| originalPortfolio secondPortfolio thirdPortfolio firstAccount |
	
	originalPortfolio _ Portfolio new.
	secondPortfolio _ Portfolio new.
	thirdPortfolio _ Portfolio new.
	firstAccount _ ReceptiveAccount new.
	
	originalPortfolio add: secondPortfolio.
	secondPortfolio add: thirdPortfolio.
	
	thirdPortfolio add: firstAccount.
	
	self 
		should: [ secondPortfolio add: firstAccount .]
		raise: Error
		withExceptionDo: [ :anError | self assert: Portfolio cantHaveTheSameAccountMultipleTimesErrorDescription equals: anError messageText ].
	! !

!PortfoliosTest methodsFor: 'tests-extras' stamp: 'sL 6/9/2022 12:33:37'!
test15APortfolioWithPortfoliosAndReceptiveAccountsCantAddTheSameAccountTwice

	| originalPortfolio secondPortfolio firstAccount accountInOrigin |
	
	originalPortfolio _ Portfolio new.
	secondPortfolio _ Portfolio new.
	
	firstAccount _ ReceptiveAccount new.
	accountInOrigin _ ReceptiveAccount new.
	
	originalPortfolio add: secondPortfolio.
	originalPortfolio add: accountInOrigin.
	secondPortfolio add: firstAccount.
	
	self 
		should: [ originalPortfolio add: firstAccount .]
		raise: Error
		withExceptionDo: [ :anError | self assert: Portfolio cantHaveTheSameAccountMultipleTimesErrorDescription equals: anError messageText ].
	! !

!PortfoliosTest methodsFor: 'tests-extras' stamp: 'sL 6/9/2022 12:33:37'!
test16APortfolioInsideAPortfolioCantAddAReceptiveAccountAlreadyInParent

	| originalPortfolio secondPortfolio thirdPortfolio firstAccount |
	
	originalPortfolio _ Portfolio new.
	secondPortfolio _ Portfolio new.
	thirdPortfolio _ Portfolio new.
	
	firstAccount _ ReceptiveAccount new.
	
	originalPortfolio add: secondPortfolio.
	secondPortfolio add: thirdPortfolio.
	originalPortfolio add: firstAccount.
	
	self 
		should: [ thirdPortfolio add: firstAccount .]
		raise: Error
		withExceptionDo: [ :anError | self assert: Portfolio cantHaveTheSameAccountMultipleTimesErrorDescription equals: anError messageText ].
	! !


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


!classDefinition: #TransferenceTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferenceTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceTest methodsFor: 'tests' stamp: 'sL 6/7/2022 18:17:53'!
aaatest04TransferenceKnowsItsSender

	| originAccount destinationAccount firstTransference |
	
	originAccount _ ReceptiveAccount new.
	
	destinationAccount _ ReceptiveAccount new.
	
	firstTransference _ Transference send: 50*peso from: originAccount to: destinationAccount.
	
	self assert: (firstTransference sender) equals: originAccount .
	! !

!TransferenceTest methodsFor: 'tests' stamp: 'sL 6/7/2022 18:18:01'!
aaatest05TransferenceKnowsItsReceiver

	| originAccount destinationAccount firstTransference |
	
	originAccount _ ReceptiveAccount new.
	
	destinationAccount _ ReceptiveAccount new.
	
	firstTransference _ Transference send: 50*peso from: originAccount to: destinationAccount.
	
	self assert: (firstTransference receiver) equals: destinationAccount .
	! !

!TransferenceTest methodsFor: 'tests' stamp: 'sL 6/7/2022 17:52:32'!
test01TransferenceTakesMoneyFromOriginAccount

	| originAccount destinationAccount |
	
	originAccount _ ReceptiveAccount new.
	
	destinationAccount _ ReceptiveAccount new.
	
	Transference send: 50*peso from: originAccount  to: destinationAccount.
	
	self assert: originAccount  balance equals: -50 * peso.
	! !

!TransferenceTest methodsFor: 'tests' stamp: 'sL 6/7/2022 17:53:08'!
test02TransferenceSendsMoneyToDestinationAccount

	| originAccount destinationAccount |
	
	originAccount _ ReceptiveAccount new.
	
	destinationAccount _ ReceptiveAccount new.
	
	Transference send: 50*peso from: originAccount  to: destinationAccount.
	
	self assert: destinationAccount  balance equals: 50 * peso.
	! !

!TransferenceTest methodsFor: 'tests' stamp: 'sL 6/7/2022 18:39:01'!
test03TransferenceContainsCorrectAmount

	| originAccount destinationAccount firstTransference |
	
	originAccount _ ReceptiveAccount new.
	
	destinationAccount _ ReceptiveAccount new.
	
	firstTransference _ Transference send: 50*peso from: originAccount to: destinationAccount.
	
	self assert: (firstTransference value) equals: 50 * peso.
	! !

!TransferenceTest methodsFor: 'tests' stamp: 'sL 6/7/2022 18:39:06'!
test04DepositAndWithdrawOfTransferKnowsTheirCounterparts

	| originAccount destinationAccount firstTransference |
	
	originAccount _ ReceptiveAccount new.
	
	destinationAccount _ ReceptiveAccount new.
	
	firstTransference _ Transference send: 50*peso from: originAccount to: destinationAccount.
	
	self assert: ((firstTransference deposit) counterpart) equals: ((firstTransference withdraw) counterpart).
	! !

!TransferenceTest methodsFor: 'tests' stamp: 'sL 6/7/2022 18:45:22'!
test05accountCantTransferToItself

	| originAccount |
	
	originAccount _ ReceptiveAccount new.
	
	self 
		should: [ Transference send: 50*peso from: originAccount to: originAccount.]
		raise: Error
		withExceptionDo: [ :anError | self assert: Transference cantSendToItselfErrorDescription equals: anError messageText ].
	
	
	! !

!TransferenceTest methodsFor: 'tests' stamp: 'sL 6/7/2022 18:54:44'!
test06cantTransferANegativeValue

	| originAccount destinationAccount |
	
	originAccount _ ReceptiveAccount new.
	
	destinationAccount _ ReceptiveAccount new.
	
	self 
		should: [Transference send: -50*peso from: originAccount to: destinationAccount.]
		raise: Error
		withExceptionDo: [:anError | self assert: Transference cantTransferNegativeAmountErrorDescription equals: anError messageText ]
	! !

!TransferenceTest methodsFor: 'tests' stamp: 'sL 6/7/2022 18:58:05'!
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

!TransferDeposit methodsFor: 'initialization' stamp: 'sL 6/7/2022 17:46:22'!
initializeFor: aValue 
	
	value := aValue.! !

!TransferDeposit methodsFor: 'initialization' stamp: 'sL 6/7/2022 18:34:31'!
initializeFor: aValue andCounterpart: withdrawCounterpart

	value _ aValue .
	
	counterpart _ withdrawCounterpart.! !


!TransferDeposit methodsFor: 'value' stamp: 'sL 6/7/2022 17:47:09'!
arithmeticValue

	^ self value.! !

!TransferDeposit methodsFor: 'value' stamp: 'sL 6/7/2022 17:49:28'!
value

	^ value! !


!TransferDeposit methodsFor: 'counterpartOfTransfer' stamp: 'sL 6/7/2022 18:35:38'!
counterpart

	^ counterpart! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferDeposit class' category: 'ServiciosFinancieros-Ejercicio'!
TransferDeposit class
	instanceVariableNames: ''!

!TransferDeposit class methodsFor: 'instance creation' stamp: 'sL 6/7/2022 17:46:13'!
for: aValue 

	^ self new initializeFor: aValue ! !

!TransferDeposit class methodsFor: 'instance creation' stamp: 'sL 6/7/2022 18:33:20'!
for: aValue With: withdrawCounterpart

	^ self new initializeFor: aValue andCounterpart: withdrawCounterpart.! !


!classDefinition: #TransferWithdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferWithdraw
	instanceVariableNames: 'value counterpart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferWithdraw methodsFor: 'initialization' stamp: 'sL 6/7/2022 17:44:21'!
initializeFor: aValue 
	
	value := aValue.! !

!TransferWithdraw methodsFor: 'initialization' stamp: 'sL 6/7/2022 18:35:20'!
initializeFor: aValue andCounterpart: depositCounterpart

	value _ aValue .
	
	counterpart _ depositCounterpart.! !


!TransferWithdraw methodsFor: 'counterpartOfTransfer' stamp: 'sL 6/7/2022 18:35:42'!
counterpart

	^ counterpart! !


!TransferWithdraw methodsFor: 'value' stamp: 'sL 6/7/2022 17:46:57'!
arithmeticValue

	^ self value negated! !

!TransferWithdraw methodsFor: 'value' stamp: 'sL 6/7/2022 17:49:31'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferWithdraw class' category: 'ServiciosFinancieros-Ejercicio'!
TransferWithdraw class
	instanceVariableNames: ''!

!TransferWithdraw class methodsFor: 'instance creation' stamp: 'sL 6/7/2022 17:43:42'!
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


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'initialization' stamp: 'sL 6/8/2022 22:36:45'!
initialize
	
	accounts := OrderedCollection new.! !


!Portfolio methodsFor: 'main protocol' stamp: 'sL 6/9/2022 12:54:20'!
add: anAccount 

	(accounts anySatisfy: [ :anAccountInAccounts | anAccountInAccounts parentPortfolioContainsAReceptiveAccount: anAccount.]) ifTrue: [self error: Portfolio cantHaveTheSameAccountMultipleTimesErrorDescription].
	
	accounts add: anAccount.
	
	anAccount addParent: self.

	! !

!Portfolio methodsFor: 'main protocol' stamp: 'sL 6/9/2022 12:53:14'!
addParent: aPortfolio

	parents add: aPortfolio.! !

!Portfolio methodsFor: 'main protocol' stamp: 'sL 6/8/2022 23:20:02'!
balance
	
	| balance |
	balance := 0.

	accounts do: [:anAccount | balance := balance + anAccount balance].
	
	^balance! !

!Portfolio methodsFor: 'main protocol' stamp: 'sL 6/9/2022 12:05:15'!
containsAReceptiveAccount: searchedReceptiveAccount

	^ accounts anySatisfy: [:anAccount | anAccount containsAReceptiveAccount: searchedReceptiveAccount].! !

!Portfolio methodsFor: 'main protocol' stamp: 'sL 6/8/2022 23:00:12'!
hasRegistered: aTransaction 

	^accounts anySatisfy: [:anAccount | anAccount hasRegistered: aTransaction]! !

!Portfolio methodsFor: 'main protocol' stamp: 'sL 6/9/2022 12:51:03'!
parentPortfolioContainsAReceptiveAccount: searchedReceptiveAccount

	(parents isEmpty) 
		ifTrue:  [^accounts anySatisfy: [:anAccount | anAccount containsAReceptiveAccount: searchedReceptiveAccount]]
		ifFalse: [parents do: [:aParent | ^self parentPortfolioContainsAReceptiveAccount: searchedReceptiveAccount]].! !

!Portfolio methodsFor: 'main protocol' stamp: 'sL 6/8/2022 23:23:11'!
transactions

	| allTransactions |
	allTransactions _ OrderedCollection new.
	
	accounts do: [ :anAccount |
		allTransactions addAllLast: (anAccount transactions).
		].
	
	^allTransactions
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'error descriptions' stamp: 'sL 6/9/2022 12:33:37'!
cantHaveTheSameAccountMultipleTimesErrorDescription
	
	^'a Portfolio cant add the same account multiple times'! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'sL 6/9/2022 12:53:28'!
addParent: aPortfolio

	^self! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'MAM 6/2/2022 21:48:29'!
balance

	^transactions sum: [ :aTransaction | aTransaction arithmeticValue ] ifEmpty: [ 0 ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'sL 6/9/2022 12:06:51'!
containsAReceptiveAccount: searchedReceptiveAccount

	^self == searchedReceptiveAccount ! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'sL 6/9/2022 12:45:48'!
parentPortfolioContainsAReceptiveAccount: searchedReceptiveAccount

	^self! !

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

!Transference methodsFor: 'initialization' stamp: 'sL 6/7/2022 18:31:05'!
initializeWithWithdraw: aTransferWithdraw andDeposit: aTransferDeposit.

	value _ aTransferWithdraw value.
	
	withdraw _ aTransferWithdraw.
	
	deposit _ aTransferDeposit.
	! !


!Transference methodsFor: 'main protocol' stamp: 'sL 6/7/2022 18:31:57'!
deposit

	^deposit ! !

!Transference methodsFor: 'main protocol' stamp: 'sL 6/7/2022 18:13:05'!
value

	^value! !

!Transference methodsFor: 'main protocol' stamp: 'sL 6/7/2022 18:31:48'!
withdraw

	^withdraw ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transference class' category: 'ServiciosFinancieros-Ejercicio'!
Transference class
	instanceVariableNames: ''!

!Transference class methodsFor: 'instance creation' stamp: 'sL 6/7/2022 18:59:28'!
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


!Transference class methodsFor: 'error descriptions' stamp: 'sL 6/7/2022 18:46:00'!
cantSendToItselfErrorDescription

	^'Account cant make a transference to itself.'! !

!Transference class methodsFor: 'error descriptions' stamp: 'sL 6/7/2022 18:55:18'!
cantTransferNegativeAmountErrorDescription

	^'Cant make a negative amount transference.'! !

!Transference class methodsFor: 'error descriptions' stamp: 'sL 6/7/2022 18:59:40'!
cantTransferZeroAmountErrorDescription

	^'Cant make a zero amount transference.'! !
