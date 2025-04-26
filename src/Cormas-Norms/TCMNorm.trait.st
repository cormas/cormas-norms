Trait {
	#name : 'TCMNorm',
	#instVars : [
		'norms'
	],
	#category : 'Cormas-Norms',
	#package : 'Cormas-Norms'
}

{ #category : 'adding' }
TCMNorm >> addNorm: aNorm [

	self norms add: aNorm
]

{ #category : 'as yet unclassified' }
TCMNorm >> applyNorms [

	self norms do: [ :norm | norm applyTo: self ]
]

{ #category : 'accessing' }
TCMNorm >> norms [

	^ norms ifNil: [ norms := OrderedCollection new ]
]
