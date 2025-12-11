Class {
	#name : 'CMCannotEatFruitMockNorm',
	#superclass : 'CMNorm',
	#category : 'Cormas-Norms-Tests',
	#package : 'Cormas-Norms-Tests'
}

{ #category : 'initialization' }
CMCannotEatFruitMockNorm >> initialize [

	super initialize.

	conditionBlock := [ :agent | agent cannotEatForbiddenFruit ].
	methodToInstrument := self methodFor: #eat in: CMMockNormsAgent.
	actionBlock := [ :agent | agent payFine: 20 ]
]
