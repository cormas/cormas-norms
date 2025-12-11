Class {
	#name : 'CMExampleNormCanEatFruit',
	#superclass : 'CMNorm',
	#category : 'Cormas-Norms-Examples-Norms',
	#package : 'Cormas-Norms-Examples',
	#tag : 'Norms'
}

{ #category : 'api - rules' }
CMExampleNormCanEatFruit >> action [

	^ self methodFor: #eat in: CMMockAgent
]

{ #category : 'api - rules' }
CMExampleNormCanEatFruit >> condition: agent [

	^ agent canEatForbiddenFruit
]

{ #category : 'api - rules' }
CMExampleNormCanEatFruit >> consequence: agent [

	^ agent increaseBalance: 20
]
