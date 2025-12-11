Class {
	#name : 'CMExampleNormCannotEatFruit',
	#superclass : 'CMNorm',
	#category : 'Cormas-Norms-Examples-Norms',
	#package : 'Cormas-Norms-Examples',
	#tag : 'Norms'
}

{ #category : 'api - rules' }
CMExampleNormCannotEatFruit >> action [

	^ self methodFor: #eat in: CMMockAgent
]

{ #category : 'api - rules' }
CMExampleNormCannotEatFruit >> condition: agent [

	^ agent cannotEatForbiddenFruit
]

{ #category : 'api - rules' }
CMExampleNormCannotEatFruit >> consequence: agent [

	^ agent payFine: 20
]
