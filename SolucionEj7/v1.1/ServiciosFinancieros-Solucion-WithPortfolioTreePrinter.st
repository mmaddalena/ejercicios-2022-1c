!classDefinition: #AccountSummaryTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #AccountSummaryTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountSummaryTest methodsFor: 'tests' stamp: 'MAM 6/16/2022 12:14:04'!
test01AReceptiveAccountWithoutTransactionsSummarizesCorrectly
	
	| account accountSummary expectedSummary |
	account := ReceptiveAccount new.
	accountSummary := AccountSummary for: account.

	expectedSummary := OrderedCollection with: 'Balance = 0 * pesos'.
	
	self assert: expectedSummary equals: (accountSummary summary)! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'MAM 6/16/2022 12:13:31'!
test02AReceptiveAccountWithADepositSummarizesCorrectly
	
	| account accountSummary expectedSummary |
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	accountSummary := AccountSummary for: account.
	
	expectedSummary := OrderedCollection with: 'Depósito por 100 * pesos' with: 'Balance = 100 * pesos'.
	
	self assert: expectedSummary equals: (accountSummary summary)! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'MAM 6/16/2022 12:14:46'!
test03AReceptiveAccountWithAWithdrawSummarizesCorrectly
	
	| account accountSummary expectedSummary |
	account := ReceptiveAccount new.
	Withdraw register: 100 * peso on: account.
	accountSummary := AccountSummary for: account.
	
	expectedSummary := OrderedCollection with: 'Extracción por 100 * pesos' with: 'Balance = -100 * pesos'.
	
	self assert: expectedSummary equals: (accountSummary summary)! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'MAM 6/16/2022 12:16:08'!
test04ManyReceptiveAccountsWithATransferSummarizeCorrectly
	
	| originAccount destinationAccount expectedSummaryOnOriginAccount originAccountSummary expectedSummaryOnDestinationAccount destinationAccountSummary |
	
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.
	originAccountSummary := AccountSummary for: originAccount.

	Transfer amount: 20 * peso from: originAccount to: destinationAccount.
	
	expectedSummaryOnOriginAccount := OrderedCollection with: 'Salida por transferencia de 20 * pesos'
	with: 'Balance = -20 * pesos'.
	
	self assert: (originAccountSummary summary) equals: expectedSummaryOnOriginAccount.
	
	expectedSummaryOnDestinationAccount := OrderedCollection with: 'Entrada por transferencia de 20 * pesos'
	with: 'Balance = 20 * pesos'.
	
	destinationAccountSummary := AccountSummary for: destinationAccount.
	
	self assert: expectedSummaryOnDestinationAccount equals: (destinationAccountSummary summary).
	! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'MAM 6/16/2022 12:17:30'!
test05ManyReceptiveAccountsWithManyTransactionsSummarizeCorrectly
	
	| originAccount destinationAccount expectedSummaryOnOriginAccount originAccountSummary expectedSummaryOnDestinationAccount destinationAccountSummary |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	originAccountSummary := AccountSummary for: originAccount.

	Transfer amount: 20 * peso from: originAccount to: destinationAccount.
	
	expectedSummaryOnOriginAccount := OrderedCollection with: 'Depósito por 100 * pesos'
	with: 'Salida por transferencia de 20 * pesos' with: 'Balance = 80 * pesos'.
	
	self assert: (originAccountSummary summary) equals: expectedSummaryOnOriginAccount.
	
	expectedSummaryOnDestinationAccount := OrderedCollection with: 'Depósito por 10 * pesos'
	with: 'Entrada por transferencia de 20 * pesos' with: 'Balance = 30 * pesos'.
	
	destinationAccountSummary := AccountSummary for: destinationAccount.
	
	self assert: expectedSummaryOnDestinationAccount equals: (destinationAccountSummary summary).
	! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'MAM 6/16/2022 12:17:58'!
test06APortfolioWithAReceptiveAccountWithoutTransactionsSummarizesCorrectly
	
	| account accountSummary expectedSummary aPortfolio |
	
	account := ReceptiveAccount new.
	aPortfolio := Portfolio with: account.
	accountSummary := AccountSummary for: aPortfolio.
	
	expectedSummary := OrderedCollection with: 'Balance = 0 * pesos'.
	
	self assert: expectedSummary equals: (accountSummary summary)! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'MAM 6/16/2022 12:18:29'!
test07APortfolioWithAReceptiveAccountWithADepositSummarizesCorrectly
	
	| account accountSummary expectedSummary aPortfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account. 
	aPortfolio := Portfolio with: account.
	accountSummary := AccountSummary for: aPortfolio.
	
	expectedSummary := OrderedCollection with: 'Depósito por 100 * pesos' with: 'Balance = 100 * pesos'.
	
	self assert: expectedSummary equals: (accountSummary summary)! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'MAM 6/16/2022 12:19:33'!
test08APortfolioWithManyReceptiveAccountWithTransactionsSummarizesCorrectly
	
	| firstAccount secondAccount accountSummary expectedSummary aPortfolio |
	
	firstAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: firstAccount.
	Withdraw register: 40 * peso on: firstAccount.
	
	secondAccount := ReceptiveAccount new.
	Deposit register: 50 * peso on: secondAccount.
	Withdraw register: 10 * peso on: secondAccount.
	
	aPortfolio := Portfolio with: firstAccount with: secondAccount.
	accountSummary := AccountSummary for: aPortfolio.
	
	expectedSummary := OrderedCollection with: 'Depósito por 100 * pesos' with: 'Extracción por 40 * pesos'
	with: 'Depósito por 50 * pesos' with: 'Extracción por 10 * pesos' with: 'Balance = 100 * pesos'.
	
	self assert: expectedSummary equals: (accountSummary summary)! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'MAM 6/16/2022 12:19:48'!
test09ComposedPortfolioWithoutTransactionsSummarizesCorrectly
	
	| accountSummary expectedSummary firstPortfolio secondPortfolio |
	
	firstPortfolio := Portfolio new.
	secondPortfolio := Portfolio with: firstPortfolio.
	accountSummary := AccountSummary for: secondPortfolio.
	
	expectedSummary := OrderedCollection with: 'Balance = 0 * pesos'.
	
	self assert: expectedSummary equals: (accountSummary summary)! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'MAM 6/16/2022 12:12:56'!
test10ComposedPortfolioWithATransactionSummarizesCorrectly
	
	| accountSummary expectedSummary firstPortfolio secondPortfolio anAccount |
	
	anAccount := ReceptiveAccount new.
	Deposit register: 50 * peso on: anAccount.
	firstPortfolio := Portfolio with: anAccount.
	secondPortfolio := Portfolio with: firstPortfolio.
	
	accountSummary := AccountSummary for: secondPortfolio.
	expectedSummary := OrderedCollection with: 'Depósito por 50 * pesos' with: 'Balance = 50 * pesos'.
	
	self assert: expectedSummary equals: (accountSummary summary)! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'MAM 6/16/2022 12:20:51'!
test11ComposedPortfolioWithManyTransactionsSummarizesCorrectly
	
	| accountSummary expectedSummary firstPortfolio secondPortfolio firstAccount secondAccount |
	
	firstAccount := ReceptiveAccount new.
	Deposit register: 50 * peso on: firstAccount.
	Withdraw register: 20 * peso on: firstAccount.
	
	secondAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: secondAccount.
	Withdraw register: 50 * peso on: secondAccount.
	
	firstPortfolio := Portfolio with: firstAccount.
	firstPortfolio add: secondAccount.
	secondPortfolio := Portfolio with: firstPortfolio.
	accountSummary := AccountSummary for: secondPortfolio.
	
	expectedSummary := OrderedCollection with: 'Depósito por 50 * pesos' with: 'Extracción por 20 * pesos'
	with: 'Depósito por 100 * pesos' with: 'Extracción por 50 * pesos' with: 'Balance = 80 * pesos'.
	
	self assert: expectedSummary equals: (accountSummary summary)! !


!classDefinition: #NetTransferSummaryTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #NetTransferSummaryTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!NetTransferSummaryTest methodsFor: 'tests' stamp: 'sL 6/15/2022 13:37:57'!
test01AReceptiveAccountWithoutTransfersSummarizesCorrectly
	
	| account accountSummary |
	account := ReceptiveAccount new.
	accountSummary := NetTransferSummary for: account.

	self assert: 0 * peso equals: accountSummary summary! !

!NetTransferSummaryTest methodsFor: 'tests' stamp: 'sL 6/15/2022 13:38:10'!
test02AReceptiveAccountWithOneTransferSummarizesCorrectly
	
	| originAccount destinationAccount accountSummary |
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.
	Transfer amount: 10 * peso from: originAccount to: destinationAccount.
	
	accountSummary := NetTransferSummary for: originAccount.

	self assert: -10 * peso equals: (accountSummary summary) ! !

!NetTransferSummaryTest methodsFor: 'tests' stamp: 'sL 6/14/2022 13:32:27'!
test03AReceptiveAccountWithManyTransfersSummarizesCorrectly
	
	| originAccount destinationAccount anotherAccount accountSummary |
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	Transfer amount: 10 * peso from: originAccount to: destinationAccount.
	Transfer amount: 100 * peso from: anotherAccount to: originAccount.
	
	accountSummary := NetTransferSummary for: originAccount.

	self assert: (90 * peso) equals: accountSummary summary! !

!NetTransferSummaryTest methodsFor: 'tests' stamp: 'sL 6/15/2022 12:51:13'!
test04AReceptiveAccountWithManyTransactionsExcludesDepositsAndWithdrawsAndSummarizesCorrectly
	
	| originAccount destinationAccount anotherAccount accountSummary |
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	Transfer amount: 10 * peso from: originAccount to: destinationAccount.
	Transfer amount: 100 * peso from: anotherAccount to: originAccount.
	Deposit register: 90 * peso on: originAccount.
	Deposit register: 80 * peso on: destinationAccount.
	
	accountSummary := NetTransferSummary for: originAccount.

	self assert: (90 * peso) equals: accountSummary summary! !

!NetTransferSummaryTest methodsFor: 'tests' stamp: 'MAM 6/16/2022 12:24:08'!
test05ManyReceptiveAccountsWithManyTransfersSummarizeCorrectly
	
	| originAccount destinationAccount anotherAccount originAccountSummary destinationAccountSummary |
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	Transfer amount: 10 * peso from: originAccount to: destinationAccount.
	Transfer amount: 100 * peso from: anotherAccount to: originAccount.
	
	originAccountSummary := NetTransferSummary for: originAccount.
	destinationAccountSummary := NetTransferSummary for: destinationAccount.

	self assert: (90 * peso) equals: originAccountSummary summary.
	self assert: (10 * peso) equals: destinationAccountSummary summary.! !

!NetTransferSummaryTest methodsFor: 'tests' stamp: 'sL 6/15/2022 12:55:41'!
test06APortfolioWithAReceptiveAccountWithoutTransfersSummarizesCorrectly
	
	| account accountSummary aPortfolio |
	
	account := ReceptiveAccount new.
	aPortfolio := Portfolio with: account.
	
	accountSummary := NetTransferSummary for: aPortfolio.
	
	self assert: 0 * peso equals:  (accountSummary summary) ! !

!NetTransferSummaryTest methodsFor: 'tests' stamp: 'sL 6/15/2022 13:02:01'!
test07APortfolioWithAReceptiveAccountWithOneTransferSummarizesCorrectly
	
	| originAccount destinationAccount accountSummary aPortfolio |
	
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.
	aPortfolio := Portfolio with: originAccount.
	
	Transfer amount: 20 * peso from: originAccount to: destinationAccount.
	
	accountSummary := NetTransferSummary for: aPortfolio.
	
	self assert: -20 * peso equals:  (accountSummary summary) ! !

!NetTransferSummaryTest methodsFor: 'tests' stamp: 'sL 6/15/2022 13:13:01'!
test08APortfolioWithManyReceptiveAccountsTranferingToThemselvesSummarizesZero
	
	| originAccount destinationAccount accountSummary aPortfolio |
	
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.
	aPortfolio := Portfolio with: originAccount.
	aPortfolio add: destinationAccount.
	
	Transfer amount: 20 * peso from: originAccount to: destinationAccount.
	
	accountSummary := NetTransferSummary for: aPortfolio.
	
	self assert: 0 * peso equals:  (accountSummary summary) ! !

!NetTransferSummaryTest methodsFor: 'tests' stamp: 'sL 6/15/2022 13:17:44'!
test09AComposedPortfolioWithoutTransfersSummarizesCorrectly
	
	| originAccount destinationAccount accountSummary childPortfolio parentPortfolio |
	
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.
	childPortfolio := Portfolio with: originAccount.
	parentPortfolio := Portfolio with: childPortfolio .
		
	accountSummary := NetTransferSummary for: parentPortfolio.
	
	self assert: 0 * peso equals:  (accountSummary summary) ! !

!NetTransferSummaryTest methodsFor: 'tests' stamp: 'sL 6/15/2022 13:19:51'!
test10AComposedPortfolioWithOneTransferSummarizesCorrectly
	
	| originAccount destinationAccount accountSummary childPortfolio parentPortfolio |
	
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.
	childPortfolio := Portfolio with: originAccount.
	parentPortfolio := Portfolio with: childPortfolio .
	
	Transfer amount: 30 * peso from: originAccount to: destinationAccount.
		
	accountSummary := NetTransferSummary for: parentPortfolio.
	
	self assert: -30 * peso equals:  (accountSummary summary) ! !

!NetTransferSummaryTest methodsFor: 'tests' stamp: 'sL 6/15/2022 13:25:08'!
test11AComposedPortfolioWithManyTransfersSummarizesCorrectly
	
	| firstAccountInChild secondAccountInChild accountInParent externalAccount accountSummary childPortfolio parentPortfolio |
	
	firstAccountInChild := ReceptiveAccount new.
	secondAccountInChild := ReceptiveAccount new.
	accountInParent := ReceptiveAccount new.
	externalAccount := ReceptiveAccount new.
	childPortfolio := Portfolio with: firstAccountInChild.
	childPortfolio add: secondAccountInChild.
	parentPortfolio := Portfolio with: childPortfolio.
	parentPortfolio add: accountInParent.
	
	Transfer amount: 30 * peso from: firstAccountInChild to: secondAccountInChild.
	Transfer amount: 50 * peso from: firstAccountInChild to: accountInParent.
	Transfer amount: 5 * peso from: externalAccount to: secondAccountInChild.
		
	accountSummary := NetTransferSummary for: parentPortfolio.
	
	self assert: 5 * peso equals:  (accountSummary summary) ! !


!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:00'!
test02BalanceOfPortfolioWithOneAccountIsAccountBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:06'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:12'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100 * peso))! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:18'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:26'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:08'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 * peso on: account.
	anotherAccountWithdraw := Withdraw register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 11/29/2021 18:55:37'!
test12PortfolioCanNotIncludeItself

	| simplePortfolio |
	
	simplePortfolio := Portfolio new.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 0 equals: simplePortfolio accountsSize. ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #PortfolioTreePrinterTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #PortfolioTreePrinterTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'MAM 6/16/2022 12:55:06'!
test01APortfolioTreePrinterOfAPortfolioWithoutNameReportsCorrectly
	
	| aPortfolio expectedPorfolioTreePrinter aPortfolioTreePrinter |
	aPortfolio := Portfolio new.
	aPortfolioTreePrinter := PortfolioTreePrinter for: aPortfolio.
	
	expectedPorfolioTreePrinter := OrderedCollection with: 'Portfolio'.
	
	self assert: expectedPorfolioTreePrinter equals: aPortfolioTreePrinter report.! !

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'MAM 6/16/2022 13:02:56'!
test02APortfolioTreePrinterOfAPortfolioNamedAndAnAccountInsideItselfReportsCorrectly
	
	| aPortfolio expectedPorfolioTreePrinter aPortfolioTreePrinter johnsAccount |
	
	johnsAccount := ReceptiveAccount named: 'Cuenta de Juan'.
	
	aPortfolio := Portfolio named: 'Portfolio de la familia' with: johnsAccount.
	aPortfolioTreePrinter := PortfolioTreePrinter for: aPortfolio.
	
	expectedPorfolioTreePrinter := OrderedCollection with: 'Portfolio de la familia' with: 'Cuenta de Juan'.
	
	self assert: expectedPorfolioTreePrinter equals: aPortfolioTreePrinter report.! !

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'MAM 6/16/2022 13:02:52'!
test03APortfolioTreePrinterOfAPortfolioNamedAndManyAccountsInsideItselfReportsCorrectly
	
	| aPortfolio expectedPorfolioTreePrinter aPortfolioTreePrinter johnsAccount angiesAccount |
	
	johnsAccount := ReceptiveAccount named: 'Cuenta de Juan'.
	angiesAccount := ReceptiveAccount named: 'Cuenta de Angeles'.
	
	aPortfolio := Portfolio named: 'Portfolio de la familia' with: johnsAccount with: angiesAccount.
	aPortfolioTreePrinter := PortfolioTreePrinter for: aPortfolio.
	
	expectedPorfolioTreePrinter := OrderedCollection with: 'Portfolio de la familia' with: 'Cuenta de Juan'
	with: 'Cuenta de Angeles'.
	
	self assert: expectedPorfolioTreePrinter equals: aPortfolioTreePrinter report.! !

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'MAM 6/16/2022 12:55:37'!
test04APortfolioTreePrinterOfAPortfolioNamedAndAnEmptyPortfolioInsideItselfReportsCorrectly
	
	| portfolioOfJose portfolioOfJuan expectedPorfolioTreePrinter aPortfolioTreePrinter |
	
	portfolioOfJose := Portfolio new updateName: 'Portfolio de Jose'.
	portfolioOfJuan := Portfolio named: 'Portfolio de Juan' with: portfolioOfJose.
	aPortfolioTreePrinter := PortfolioTreePrinter for: portfolioOfJuan.
	
	expectedPorfolioTreePrinter := OrderedCollection with: 'Portfolio de Juan' with: 'Portfolio de Jose'.
	
	self assert: expectedPorfolioTreePrinter equals: aPortfolioTreePrinter report.! !

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'MAM 6/16/2022 13:02:43'!
test05APortfolioTreePrinterOfAPortfolioNamedAndAnPortfolioWithManyAccountsInsideItselfReportsCorrectly
	
	| johnsAccount angiesAccount portfolioOfJose portfolioOfJuan expectedPorfolioTreePrinter aPortfolioTreePrinter |
	
	johnsAccount := ReceptiveAccount named: 'Cuenta de Juan'.
	angiesAccount := ReceptiveAccount named: 'Cuenta de Angeles'.
	
	portfolioOfJose := Portfolio named: 'Portfolio de Jose' with: johnsAccount with: angiesAccount.
	portfolioOfJuan := Portfolio named: 'Portfolio de Juan' with: portfolioOfJose.
	aPortfolioTreePrinter := PortfolioTreePrinter for: portfolioOfJuan.
	
	expectedPorfolioTreePrinter := OrderedCollection with: 'Portfolio de Juan' with: 'Portfolio de Jose' with: 'Cuenta de Juan'
	with: 'Cuenta de Angeles'.
	
	self assert: expectedPorfolioTreePrinter equals: aPortfolioTreePrinter report.! !

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'MAM 6/16/2022 13:02:26'!
test06APortfolioTreePrinterOfAPortfolioNamedWithAccountsAndAnPortfolioWithManyAccountsInsideItselfReportsCorrectly
	
	| johnsAccount angiesAccount jackAccount portfolioOfJose portfolioOfJuan expectedPorfolioTreePrinter aPortfolioTreePrinter |
	
	johnsAccount := ReceptiveAccount named: 'Cuenta de Juan'. 
	angiesAccount := ReceptiveAccount named: 'Cuenta de Angeles'.
	jackAccount := ReceptiveAccount named: 'Cuenta de Jack'.
	
	portfolioOfJose := Portfolio named: 'Portfolio de Jose' with: johnsAccount with: angiesAccount.
	portfolioOfJuan := Portfolio named: 'Portfolio de Juan' with: jackAccount with: portfolioOfJose.
	
	aPortfolioTreePrinter := PortfolioTreePrinter for: portfolioOfJuan.
	
	expectedPorfolioTreePrinter := OrderedCollection with: 'Portfolio de Juan' with: 'Cuenta de Jack' with: 'Portfolio de Jose' 	with: 'Cuenta de Juan' with: 'Cuenta de Angeles'.
	
	self assert: expectedPorfolioTreePrinter equals: aPortfolioTreePrinter report.! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'MAM 6/14/2022 10:17:49'!
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


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 21:07:03'!
test01ATransferDecreasesBalanceFromOriginAccountAndIncreasesItForDestinationAccount

	| destinationAccount originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 8 * peso equals: originAccount balance.
	self assert: 12 * peso equals: destinationAccount balance.! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 21:12:28'!
test02ATransferKnowsItsValue

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 2 * peso equals: transfer value.! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:01:44'!
test03DepositLegKnowsItsWithdrawCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer withdrawLeg equals: transfer depositLeg withdrawLeg! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:01:51'!
test04WithdrawLegKnowsItsDepositCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer depositLeg equals: transfer withdrawLeg depositLeg! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:02:36'!
test05OriginAndDestinationAccountsCannotBeTheSame

	| originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	self should: [ Transfer amount: 2 * peso from: originAccount to: originAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferToOriginErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:02:44'!
test06CannotTransferAZeroAmount

	| originAccount destinationAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 5 * peso on: destinationAccount.
	
	self should: [ Transfer amount: 0 from: originAccount to: destinationAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferZeroErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !


!classDefinition: #Account category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:45:50'!
addedTo: aPortfolio

	self subclassResponsibility! !

!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:46:48'!
isComposedBy: anAccount

	self subclassResponsibility! !


!Account methodsFor: 'private' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Solucion'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Portfolio methodsFor: 'initialization' stamp: 'MAM 6/16/2022 11:25:54'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.
	name := 'Portfolio'.! !


!Portfolio methodsFor: 'main protocol' stamp: 'MAM 6/16/2022 11:20:08'!
accounts
	
	^accounts copy! !

!Portfolio methodsFor: 'main protocol' stamp: 'sL 6/14/2022 13:24:52'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 * peso ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'MAM 6/16/2022 11:23:28'!
name

	^name! !

!Portfolio methodsFor: 'main protocol' stamp: 'MAM 6/16/2022 12:48:09'!
reportRequest: aPortfolioTreePrinter 
	^aPortfolioTreePrinter portfolioReport: self.! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !

!Portfolio methodsFor: 'main protocol' stamp: 'MAM 6/16/2022 11:25:22'!
updateName: aNewName
	
	name := aNewName! !


!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !


!Portfolio methodsFor: 'private' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Solucion'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'error descriptions' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !


!Portfolio class methodsFor: 'instance creation without a name' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'instance creation without a name' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!Portfolio class methodsFor: 'instance creation with a name' stamp: 'MAM 6/16/2022 11:43:26'!
named: aName with: anAccount

	^self new 
		add: anAccount;
		updateName: aName;
		yourself! !

!Portfolio class methodsFor: 'instance creation with a name' stamp: 'MAM 6/16/2022 11:27:22'!
named: aName with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		updateName: aName;
		yourself! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Solucion'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions accountName'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !

!ReceptiveAccount methodsFor: 'initialization' stamp: 'MAM 6/16/2022 11:40:00'!
initializeNamed: anAccountName 

	accountName := anAccountName.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'sL 6/14/2022 13:20:37'!
balance

	^transactions 
		inject: 0 * peso
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/21/2019 18:55:56'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'MAM 6/16/2022 12:09:22'!
name
	^accountName! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'MAM 6/16/2022 12:04:23'!
reportRequest: aPortfolioTreePrinter 
	^aPortfolioTreePrinter receptiveAccountReport: self.! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'private' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !

!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReceptiveAccount class' category: 'ServiciosFinancieros-Solucion'!
ReceptiveAccount class
	instanceVariableNames: ''!

!ReceptiveAccount class methodsFor: 'instance creation' stamp: 'MAM 6/16/2022 11:39:41'!
named: anAccountName 

	^self new initializeNamed: anAccountName! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Solucion'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'balance' stamp: 'sL 6/14/2022 13:35:50'!
summaryRequest: anSummary
	
	self subclassResponsibility ! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !


!Deposit methodsFor: 'summary' stamp: 'MAM 6/16/2022 09:30:21'!
summaryRequest: anSummary
	^anSummary summaryDeposit: self value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Solucion'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!Deposit class methodsFor: 'registration' stamp: 'LL 7/8/2021 21:45:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #TransferLeg category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferLeg methodsFor: 'value' stamp: 'LL 9/20/2020 22:27:32'!
value

	^transfer value! !


!TransferLeg methodsFor: 'initialization' stamp: 'LL 9/20/2020 22:28:14'!
initializeWith: aTransfer

	transfer := aTransfer! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancieros-Solucion'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'registration' stamp: 'LL 9/20/2020 22:45:01'!
of: aTransfer on: anAccount

	| transaction |
	
	transaction := self new initializeWith: 	aTransfer.
	anAccount register: transaction.	
	
	^transaction! !


!classDefinition: #TransferDepositLeg category: 'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferDepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferDepositLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:26:10'!
withdrawLeg

	^transfer withdrawLeg! !


!TransferDepositLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:49'!
affectBalance: aBalance

	^aBalance + self value! !


!TransferDepositLeg methodsFor: 'summary' stamp: 'MAM 6/16/2022 09:32:39'!
summaryRequest: anSummary
	^anSummary summaryTransferDepositLeg: self value! !


!classDefinition: #TransferWithdrawLeg category: 'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferWithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferWithdrawLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:25:47'!
depositLeg

	^transfer depositLeg! !


!TransferWithdrawLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:55'!
affectBalance: aBalance

	^aBalance - self value! !


!TransferWithdrawLeg methodsFor: 'summary' stamp: 'MAM 6/16/2022 09:32:57'!
summaryRequest: anSummary
	^anSummary summaryTransferWithdrawLeg: self value! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !


!Withdraw methodsFor: 'summary' stamp: 'MAM 6/16/2022 09:38:03'!
summaryRequest: anSummary
	^anSummary summaryWithdraw: self value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Solucion'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!Withdraw class methodsFor: 'registration' stamp: 'LL 7/8/2021 21:45:05'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #PortfolioTreePrinter category: 'ServiciosFinancieros-Solucion'!
Object subclass: #PortfolioTreePrinter
	instanceVariableNames: 'portfolio'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTreePrinter methodsFor: 'initialization' stamp: 'MAM 6/16/2022 10:45:54'!
initializeFor: aPortfolio 

	portfolio := aPortfolio.! !


!PortfolioTreePrinter methodsFor: 'report' stamp: 'MAM 6/16/2022 12:47:27'!
portfolioReport: aPortfolio
	
	| portfolioTreePrinter |
	portfolioTreePrinter := OrderedCollection with: aPortfolio name.
	
	aPortfolio accounts do: [:anAccount | portfolioTreePrinter addAll: (anAccount reportRequest: self)].
	
	^portfolioTreePrinter! !

!PortfolioTreePrinter methodsFor: 'report' stamp: 'MAM 6/16/2022 11:57:46'!
receptiveAccountReport: aReceptiveAccount 
	
	^OrderedCollection with: aReceptiveAccount name.! !

!PortfolioTreePrinter methodsFor: 'report' stamp: 'MAM 6/16/2022 12:29:53'!
report
	
	| porftolioTreePrinter |
	porftolioTreePrinter := OrderedCollection with: portfolio name.
	
	portfolio accounts do: [:anAccount | porftolioTreePrinter addAll: (anAccount reportRequest: self)].
	
	^porftolioTreePrinter! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioTreePrinter class' category: 'ServiciosFinancieros-Solucion'!
PortfolioTreePrinter class
	instanceVariableNames: ''!

!PortfolioTreePrinter class methodsFor: 'instance creation' stamp: 'MAM 6/16/2022 10:45:38'!
for: aPortfolio 

	^self new initializeFor: aPortfolio! !


!classDefinition: #Summaries category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Summaries
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Summaries methodsFor: 'initialization' stamp: 'sL 6/15/2022 01:39:40'!
initializeFor: anAccount
	
	self subclassResponsibility ! !


!Summaries methodsFor: 'summary' stamp: 'sL 6/15/2022 01:40:55'!
summary

	self subclassResponsibility ! !

!Summaries methodsFor: 'summary' stamp: 'MAM 6/16/2022 09:34:51'!
summaryDeposit: aTransactionValue

	self subclassResponsibility ! !

!Summaries methodsFor: 'summary' stamp: 'MAM 6/16/2022 09:35:51'!
summaryTransferDepositLeg: aTransactionValue

	self subclassResponsibility ! !

!Summaries methodsFor: 'summary' stamp: 'MAM 6/16/2022 09:37:00'!
summaryTransferWithdrawLeg: aTransactionValue
	
	self subclassResponsibility ! !

!Summaries methodsFor: 'summary' stamp: 'MAM 6/16/2022 09:37:35'!
summaryWithdraw: aTransactionValue

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Summaries class' category: 'ServiciosFinancieros-Solucion'!
Summaries class
	instanceVariableNames: ''!

!Summaries class methodsFor: 'instance creation' stamp: 'sL 6/15/2022 01:38:19'!
for: anAccount
	^self new initializeFor: anAccount! !


!classDefinition: #AccountSummary category: 'ServiciosFinancieros-Solucion'!
Summaries subclass: #AccountSummary
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountSummary methodsFor: 'summary' stamp: 'MAM 6/14/2022 10:23:33'!
summary
	| lines |
	lines := OrderedCollection new.
	
	account transactions do: [:aTransaction | lines add: (aTransaction summaryRequest: self)].
	lines add: 'Balance = ', (account balance) asString.
	^lines! !

!AccountSummary methodsFor: 'summary' stamp: 'MAM 6/16/2022 09:34:59'!
summaryDeposit: aTransactionValue

	^'Depósito por ', aTransactionValue asString.	! !

!AccountSummary methodsFor: 'summary' stamp: 'MAM 6/16/2022 09:35:58'!
summaryTransferDepositLeg: aTransactionValue

	^'Entrada por transferencia de ', aTransactionValue asString.	! !

!AccountSummary methodsFor: 'summary' stamp: 'MAM 6/16/2022 09:37:09'!
summaryTransferWithdrawLeg: aTransactionValue

	^'Salida por transferencia de ', aTransactionValue asString.	! !

!AccountSummary methodsFor: 'summary' stamp: 'MAM 6/16/2022 09:37:46'!
summaryWithdraw: aTransactionValue

	^'Extracción por ', aTransactionValue asString.	! !


!AccountSummary methodsFor: 'initialization' stamp: 'MAM 6/13/2022 20:15:16'!
initializeFor: anAccount
	account := anAccount! !


!classDefinition: #NetTransferSummary category: 'ServiciosFinancieros-Solucion'!
Summaries subclass: #NetTransferSummary
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!NetTransferSummary methodsFor: 'summary' stamp: 'sL 6/14/2022 13:41:23'!
summary

	^(account transactions) inject: 0 * peso
	into: [:currentBalance :aTransaction | currentBalance + (aTransaction summaryRequest: self)].
	! !

!NetTransferSummary methodsFor: 'summary' stamp: 'MAM 6/16/2022 09:35:03'!
summaryDeposit: aTransactionValue

	^0! !

!NetTransferSummary methodsFor: 'summary' stamp: 'MAM 6/16/2022 09:36:32'!
summaryTransferDepositLeg: aTransactionValue

	^aTransactionValue! !

!NetTransferSummary methodsFor: 'summary' stamp: 'MAM 6/16/2022 09:37:16'!
summaryTransferWithdrawLeg: aTransactionValue

	^aTransactionValue negated! !

!NetTransferSummary methodsFor: 'summary' stamp: 'MAM 6/16/2022 09:37:50'!
summaryWithdraw: aTransactionValue

	^0! !


!NetTransferSummary methodsFor: 'initialization' stamp: 'sL 6/14/2022 12:38:19'!
initializeFor: anAccount
	account := anAccount! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Transfer methodsFor: 'value' stamp: 'LL 9/20/2020 21:13:00'!
value

	^value! !


!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:39:46'!
depositLeg

	^depositLeg! !

!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 21:25:56'!
withdrawLeg
	
	^withdrawLeg! !


!Transfer methodsFor: 'initialization' stamp: 'LL 9/20/2020 21:25:21'!
initializeWith: aValue withdrawLeg: aWithdraw depositLeg: aDeposit

	value := aValue.
	withdrawLeg := aWithdraw.
	depositLeg := aDeposit! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Solucion'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:57:30'!
cannotTransferToOriginErrorDescription
	
	^'Transfer destionation cannot be the origin account'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:00:53'!
cannotTransferZeroErrorDescription

	^'Transfer amount should be positive'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:56:35'!
signalCannotTransferToOrigin
	
	self error: self cannotTransferToOriginErrorDescription! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:06:17'!
signalCannotTransferZero

	self error: self cannotTransferZeroErrorDescription! !


!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:05:22'!
assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount

	self assertCanTransferTo: destinationAccount from: originAccount.
	self assertCanTransfer: anAmountOfMoney! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:11:50'!
assertCanTransfer: anAmountOfMoney

	^ anAmountOfMoney isZero ifTrue: [ self signalCannotTransferZero ]! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:04:58'!
assertCanTransferTo: destinationAccount from: originAccount

	^ originAccount = destinationAccount ifTrue: [ self signalCannotTransferToOrigin ]! !


!Transfer class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 23:11:34'!
amount: anAmountOfMoney from: originAccount to: destinationAccount 
	
	| transfer depositLeg withdrawLeg |
	
	self assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount.
	
	transfer := self new.
	
	withdrawLeg := TransferWithdrawLeg of: transfer on: originAccount.
	depositLeg := TransferDepositLeg of: transfer on: destinationAccount.
	
	^transfer initializeWith: anAmountOfMoney withdrawLeg: withdrawLeg depositLeg: depositLeg
	
	
	! !
