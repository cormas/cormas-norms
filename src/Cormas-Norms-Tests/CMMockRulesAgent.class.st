Class {
	#name : 'CMMockRulesAgent',
	#superclass : 'Object',
	#instVars : [
		'balance',
		'canEatForbiddenFruit'
	],
	#category : 'Cormas-Norms-Tests',
	#package : 'Cormas-Norms-Tests'
}

{ #category : 'accessing' }
CMMockRulesAgent >> balance [

	^ balance
]

{ #category : 'accessing' }
CMMockRulesAgent >> balance: aNumber [

	balance := aNumber
]

{ #category : 'accessing' }
CMMockRulesAgent >> canEatForbiddenFruit [

	^ canEatForbiddenFruit
]

{ #category : 'accessing' }
CMMockRulesAgent >> canEatForbiddenFruit: aBoolean [

	canEatForbiddenFruit := aBoolean
]

{ #category : 'accessing' }
CMMockRulesAgent >> cannotEatForbiddenFruit [

	^ canEatForbiddenFruit not
]

{ #category : 'api' }
CMMockRulesAgent >> eat [

	
]

{ #category : 'api' }
CMMockRulesAgent >> increaseBalance: amount [

	balance := balance + amount
]

{ #category : 'initialization' }
CMMockRulesAgent >> initialize [

	super initialize.
	canEatForbiddenFruit := false
]

{ #category : 'api' }
CMMockRulesAgent >> payFine: aNumber [

	balance := balance - aNumber
]
