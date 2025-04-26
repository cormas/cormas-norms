Class {
	#name : 'CMNormTest',
	#superclass : 'TestCase',
	#category : 'Cormas-Norms-Tests',
	#package : 'Cormas-Norms-Tests'
}

{ #category : 'tests' }
CMNormTest >> testNumbers [

	| numbers blacklist norm |
	numbers := (1 to: 20) asOrderedCollection.
	blacklist := OrderedCollection new.

	norm := CMNorm
		if: [ :number | number < 10 ]
		thenMustDo: [ :number | number isPrime ]
		otherwise: [ :number | blacklist add: number ].
	
	numbers do: [ :each | norm applyTo: each ].
	
	self assertCollection: blacklist hasSameElements: { 1 . 4 . 6 . 8 . 9 }
]
