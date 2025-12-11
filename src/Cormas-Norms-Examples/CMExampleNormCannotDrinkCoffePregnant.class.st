Class {
	#name : 'CMExampleNormCannotDrinkCoffePregnant',
	#superclass : 'CMNorm',
	#category : 'Cormas-Norms-Examples-Norms',
	#package : 'Cormas-Norms-Examples',
	#tag : 'Norms'
}

{ #category : 'api - rules' }
CMExampleNormCannotDrinkCoffePregnant >> action [

	^ CMMockPerson >> #drinkCoffee
]

{ #category : 'api - rules' }
CMExampleNormCannotDrinkCoffePregnant >> condition: person [

	^ person isPregnant
]

{ #category : 'api - rules' }
CMExampleNormCannotDrinkCoffePregnant >> consequence: person [

	^ person killBaby
]
