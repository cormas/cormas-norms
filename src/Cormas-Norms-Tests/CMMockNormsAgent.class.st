Class {
	#name : 'CMMockNormsAgent',
	#superclass : 'Object',
	#instVars : [
		'balance',
		'canEatForbiddenFruit'
	],
	#category : 'Cormas-Norms-Tests',
	#package : 'Cormas-Norms-Tests'
}

{ #category : 'accessing' }
CMMockNormsAgent >> balance [

	^ balance
]

{ #category : 'accessing' }
CMMockNormsAgent >> balance: aNumber [

	balance := aNumber
]

{ #category : 'accessing' }
CMMockNormsAgent >> canEatForbiddenFruit [

	^ canEatForbiddenFruit
]

{ #category : 'accessing' }
CMMockNormsAgent >> canEatForbiddenFruit: aBoolean [

	canEatForbiddenFruit := aBoolean
]

{ #category : 'accessing' }
CMMockNormsAgent >> cannotEatForbiddenFruit [

	^ canEatForbiddenFruit not
]

{ #category : 'api' }
CMMockNormsAgent >> eat [

	
]

{ #category : 'api' }
CMMockNormsAgent >> increaseBalance: amount [

	balance := balance + amount
]

{ #category : 'initialization' }
CMMockNormsAgent >> initialize [

	super initialize.
	canEatForbiddenFruit := false
]

{ #category : 'api' }
CMMockNormsAgent >> payFine: aNumber [

	balance := balance - aNumber
]
