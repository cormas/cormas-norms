Class {
	#name : 'CMExampleNormCannotDrinkCoffeHeartAttack',
	#superclass : 'CMNorm',
	#category : 'Cormas-Norms-Examples-Norms',
	#package : 'Cormas-Norms-Examples',
	#tag : 'Norms'
}

{ #category : 'api - rules' }
CMExampleNormCannotDrinkCoffeHeartAttack >> action [

	^ CMMockPerson >> #drinkCoffee
]

{ #category : 'api - rules' }
CMExampleNormCannotDrinkCoffeHeartAttack >> condition: person [

	^ person hasHeartDisease
]

{ #category : 'api - rules' }
CMExampleNormCannotDrinkCoffeHeartAttack >> consequence: person [

	^ person haveHeartAttack
]
