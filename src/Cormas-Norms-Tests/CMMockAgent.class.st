Class {
	#name : 'CMMockAgent',
	#superclass : 'Object',
	#instVars : [
		'balance'
	],
	#category : 'Cormas-Norms-Tests',
	#package : 'Cormas-Norms-Tests'
}

{ #category : 'biology' }
CMMockAgent >> balance [

	^ balance
]

{ #category : 'biology' }
CMMockAgent >> balance: aNumber [

	balance := aNumber
]

{ #category : 'biology' }
CMMockAgent >> cannotEatForbiddenFruit [

	^ true
]

{ #category : 'biology' }
CMMockAgent >> eat [

	
]

{ #category : 'biology' }
CMMockAgent >> payFine: aNumber [

	balance := balance - aNumber
]
