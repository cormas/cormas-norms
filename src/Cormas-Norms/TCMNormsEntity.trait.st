Trait {
	#name : 'TCMNormsEntity',
	#instVars : [
		'norms'
	],
	#category : 'Cormas-Norms',
	#package : 'Cormas-Norms'
}

{ #category : 'adding' }
TCMNormsEntity >> addNorm: aNorm [

	self norms add: aNorm
]

{ #category : 'as yet unclassified' }
TCMNormsEntity >> applyNorms [

	self norms do: [ :norm | norm applyTo: self ]
]

{ #category : 'accessing' }
TCMNormsEntity >> norms [

	^ norms ifNil: [ norms := OrderedCollection new ]
]
