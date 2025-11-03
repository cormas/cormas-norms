Class {
	#name : 'CMCannotEatFruitMockRule',
	#superclass : 'CMRule',
	#category : 'Cormas-Norms-Tests',
	#package : 'Cormas-Norms-Tests'
}

{ #category : 'initialization' }
CMCannotEatFruitMockRule >> initialize [

	super initialize.

	conditionBlock := [ :agent | agent cannotEatForbiddenFruit ].
	methodToInstrument := self methodFor: #eat in: CMMockRulesAgent.
	actionBlock := [ :agent | agent payFine: 20 ]
]
