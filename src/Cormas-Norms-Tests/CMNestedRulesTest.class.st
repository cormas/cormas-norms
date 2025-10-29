Class {
	#name : 'CMNestedRulesTest',
	#superclass : 'TestCase',
	#instVars : [
		'rule1',
		'rule2',
		'rulesApplier'
	],
	#category : 'Cormas-Norms-Tests',
	#package : 'Cormas-Norms-Tests'
}

{ #category : 'running' }
CMNestedRulesTest >> tearDown [

	rulesApplier deactivateRules.

	super tearDown
]

{ #category : 'tests' }
CMNestedRulesTest >> testContradictoryRules [

	| person1 person2 person3 |
	rule1 := CMPenaltyRule
		if: [ :person | person isPregnant ]
		whenExecuting: CMMockPerson >> #drinkCoffee
		penalty: [ :person | person killBaby ].
	rule2 := CMPenaltyRule
		if: [ :person | person hasHeartDisease ]
		whenExecuting: CMMockPerson >> #drinkCoffee
		penalty: [ :person | person haveHeartAttack ].

	person1 := CMMockPerson new bePregnant; yourself.
	person2 := CMMockPerson new beHeartSick; yourself.
	person3 := CMMockPerson new.

	"Apply rules"
	rulesApplier := CMRulesApplier rules: { rule1 . rule2 }.
	rulesApplier applyRules.

	{ person1 . person2 . person3 } do: #drinkCoffee.

	self assert: person1 hasBabyBeenKilled.
	self assert: person2 hasHadHeartAttack.

	self deny: person3 hasBabyBeenKilled.
	self deny: person3 hasHadHeartAttack
]
