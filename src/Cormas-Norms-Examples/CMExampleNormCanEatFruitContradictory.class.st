Class {
	#name : 'CMExampleNormCanEatFruitContradictory',
	#superclass : 'CMNorm',
	#category : 'Cormas-Norms-Examples-Norms',
	#package : 'Cormas-Norms-Examples',
	#tag : 'Norms'
}

{ #category : 'api - rules' }
CMExampleNormCanEatFruitContradictory >> action [

	^ CMMockAgent >> #eat
]

{ #category : 'api - rules' }
CMExampleNormCanEatFruitContradictory >> condition: person [

	^ person canEatForbiddenFruit
]

{ #category : 'api - rules' }
CMExampleNormCanEatFruitContradictory >> consequence: person [

	^ person payFine: 30
]
