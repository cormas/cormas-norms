Class {
	#name : 'CMMockNormsPerson',
	#superclass : 'Object',
	#instVars : [
		'isPregnant',
		'hasHeartDisease',
		'hasHadHeartAttack',
		'hasBabyBeenKilled'
	],
	#category : 'Cormas-Norms-Tests',
	#package : 'Cormas-Norms-Tests'
}

{ #category : 'api' }
CMMockNormsPerson >> beHeartSick [

	hasHeartDisease := true
]

{ #category : 'api' }
CMMockNormsPerson >> bePregnant [

	isPregnant := true.
	hasBabyBeenKilled := true
]

{ #category : 'api' }
CMMockNormsPerson >> drinkCoffee [

	
]

{ #category : 'accessing' }
CMMockNormsPerson >> hasBabyBeenKilled [

	^ hasBabyBeenKilled
]

{ #category : 'accessing' }
CMMockNormsPerson >> hasHadHeartAttack [

	^ hasHadHeartAttack
]

{ #category : 'accessing' }
CMMockNormsPerson >> hasHeartDisease [

	^ hasHeartDisease
]

{ #category : 'api' }
CMMockNormsPerson >> haveHeartAttack [

	hasHadHeartAttack := true
]

{ #category : 'initialization' }
CMMockNormsPerson >> initialize [

	super initialize.
	isPregnant := false.
	hasHeartDisease := false.

	hasBabyBeenKilled := false.
	hasHadHeartAttack := false
]

{ #category : 'accessing' }
CMMockNormsPerson >> isPregnant [

	^ isPregnant
]

{ #category : 'api' }
CMMockNormsPerson >> killBaby [

	hasBabyBeenKilled := true
]
