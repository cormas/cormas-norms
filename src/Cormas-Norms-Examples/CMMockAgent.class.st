Class {
	#name : 'CMMockAgent',
	#superclass : 'Object',
	#instVars : [
		'balance',
		'canEatForbiddenFruit'
	],
	#category : 'Cormas-Norms-Examples-Agents',
	#package : 'Cormas-Norms-Examples',
	#tag : 'Agents'
}

{ #category : 'accessing' }
CMMockAgent >> balance [

	^ balance
]

{ #category : 'accessing' }
CMMockAgent >> balance: aNumber [

	balance := aNumber
]

{ #category : 'accessing' }
CMMockAgent >> canEatForbiddenFruit [

	^ canEatForbiddenFruit
]

{ #category : 'accessing' }
CMMockAgent >> canEatForbiddenFruit: aBoolean [

	canEatForbiddenFruit := aBoolean
]

{ #category : 'accessing' }
CMMockAgent >> cannotEatForbiddenFruit [

	^ canEatForbiddenFruit not
]

{ #category : 'api' }
CMMockAgent >> eat [

	
]

{ #category : 'api' }
CMMockAgent >> increaseBalance: amount [

	balance := balance + amount
]

{ #category : 'initialization' }
CMMockAgent >> initialize [

	super initialize.
	canEatForbiddenFruit := false
]

{ #category : 'api' }
CMMockAgent >> payFine: aNumber [

	balance := balance - aNumber
]
