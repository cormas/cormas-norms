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
	methodToInstrument := self methodFor: #eat in: CMMockRulesAgent.
	actionBlock := [ :agent | agent increaseBalance: 20 ]
]
