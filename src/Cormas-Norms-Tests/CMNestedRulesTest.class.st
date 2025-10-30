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

	| person1 |
	rule1 := CMPenaltyRule
		if: [ :person | person canEatForbiddenFruit ]
		whenExecuting: CMMockAgent >> #eat
		penalty: [ :person | person payFine: 20 ].
	rule2 := CMRewardRule
		if: [ :person | person canEatForbiddenFruit ]
		whenExecuting: CMMockAgent >> #eat
		reward: [ :person | person increaseBalance: 30 ].

	person1 := CMMockAgent new balance: 100; canEatForbiddenFruit: true; yourself.

	"Apply rules"
	rulesApplier := CMRulesApplier rules: { rule1 . rule2 }.
	rulesApplier applyRules.

	person1 eat.

	self assert: person1 balance equals: 110
]

{ #category : 'tests' }
CMNestedRulesTest >> testNestedRules [

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
