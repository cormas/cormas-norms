Class {
	#name : 'CMCanEatFruitMockNorm',
	#superclass : 'CMNorm',
	#category : 'Cormas-Norms-Tests',
	#package : 'Cormas-Norms-Tests'
}

{ #category : 'initialization' }
CMCanEatFruitMockNorm >> initialize [

	super initialize.

	conditionBlock := [ :agent | agent canEatForbiddenFruit ].
	methodToInstrument := self methodFor: #eat in: CMMockNormsAgent.
	actionBlock := [ :agent | agent increaseBalance: 20 ]
]
