Class {
	#name : 'CMCanEatFruitMockRule',
	#superclass : 'CMRule',
	#category : 'Cormas-Norms-Tests',
	#package : 'Cormas-Norms-Tests'
}

{ #category : 'initialization' }
CMCanEatFruitMockRule >> initialize [

	super initialize.

	conditionBlock := [ :agent | agent canEatForbiddenFruit ].
	methodToInstrument := CMMockRulesAgent >> #eat.
	actionBlock := [ :agent | agent increaseBalance: 20 ]
]
