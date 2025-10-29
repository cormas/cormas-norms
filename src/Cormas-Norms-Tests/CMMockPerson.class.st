Class {
	#name : 'CMMockPerson',
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
CMMockPerson >> beHeartSick [

	hasHeartDisease := true
]

{ #category : 'api' }
CMMockPerson >> bePregnant [

	isPregnant := true.
	hasBabyBeenKilled := true
]

{ #category : 'api' }
CMMockPerson >> drinkCoffee [

	
]

{ #category : 'accessing' }
CMMockPerson >> hasBabyBeenKilled [

	^ hasBabyBeenKilled
]

{ #category : 'accessing' }
CMMockPerson >> hasHadHeartAttack [

	^ hasHadHeartAttack
]

{ #category : 'accessing' }
CMMockPerson >> hasHeartDisease [

	^ hasHeartDisease
]

{ #category : 'api' }
CMMockPerson >> haveHeartAttack [

	hasHadHeartAttack := true
]

{ #category : 'initialization' }
CMMockPerson >> initialize [

	super initialize.
	isPregnant := false.
	hasHeartDisease := false.

	hasBabyBeenKilled := false.
	hasHadHeartAttack := false
]

{ #category : 'accessing' }
CMMockPerson >> isPregnant [

	^ isPregnant
]

{ #category : 'api' }
CMMockPerson >> killBaby [

	hasBabyBeenKilled := true
]
