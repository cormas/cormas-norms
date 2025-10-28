Class {
	#name : 'CMNormTest',
	#superclass : 'TestCase',
	#instVars : [
		'norm'
	],
	#category : 'Cormas-Norms-Tests',
	#package : 'Cormas-Norms-Tests'
}

{ #category : 'running' }
CMNormTest >> tearDown [

	norm deactivate.
	super tearDown
]

{ #category : 'tests' }
CMNormTest >> testAgentForbidden [

	| mockAgent |
	norm := CMNorm
		if: [ :agent | agent cannotEatForbiddenFruit ]
		forbiddenMethods: { CMMockAgent >> #eat }
		penalty: [ :agent | agent payFine: 20 ].

	mockAgent := CMMockAgent new
		balance: 100;
		yourself.

	norm activate.
	mockAgent eat.
	
	self assert: mockAgent balance equals: 80
]
