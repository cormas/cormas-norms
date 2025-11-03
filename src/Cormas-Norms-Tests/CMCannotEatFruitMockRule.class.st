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
	methodToInstrument := CMMockRulesAgent lookupSelector: #eat.
	actionBlock := [ :agent | agent payFine: 20 ]
]
