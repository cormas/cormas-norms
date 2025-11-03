Class {
	#name : 'CMMockRulesPerson',
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
CMMockRulesPerson >> beHeartSick [

	hasHeartDisease := true
]

{ #category : 'api' }
CMMockRulesPerson >> bePregnant [

	isPregnant := true.
	hasBabyBeenKilled := true
]

{ #category : 'api' }
CMMockRulesPerson >> drinkCoffee [

	
]

{ #category : 'accessing' }
CMMockRulesPerson >> hasBabyBeenKilled [

	^ hasBabyBeenKilled
]

{ #category : 'accessing' }
CMMockRulesPerson >> hasHadHeartAttack [

	^ hasHadHeartAttack
]

{ #category : 'accessing' }
CMMockRulesPerson >> hasHeartDisease [

	^ hasHeartDisease
]

{ #category : 'api' }
CMMockRulesPerson >> haveHeartAttack [

	hasHadHeartAttack := true
]

{ #category : 'initialization' }
CMMockRulesPerson >> initialize [

	super initialize.
	isPregnant := false.
	hasHeartDisease := false.

	hasBabyBeenKilled := false.
	hasHadHeartAttack := false
]

{ #category : 'accessing' }
CMMockRulesPerson >> isPregnant [

	^ isPregnant
]

{ #category : 'api' }
CMMockRulesPerson >> killBaby [

	hasBabyBeenKilled := true
]
