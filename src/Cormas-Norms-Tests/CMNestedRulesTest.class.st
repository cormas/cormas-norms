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
	rule1 := CMRule
		if: [ :person | person canEatForbiddenFruit ]
		whenExecutingMethod: CMMockAgent >> #eat
		action: [ :person | person payFine: 20 ].
	rule2 := CMRule
		if: [ :person | person canEatForbiddenFruit ]
		whenExecutingMethod: CMMockAgent >> #eat
		action: [ :person | person increaseBalance: 30 ].

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
	rule1 := CMRule
		if: [ :person | person isPregnant ]
		whenExecutingMethod: CMMockPerson >> #drinkCoffee
		action: [ :person | person killBaby ].
	rule2 := CMRule
		if: [ :person | person hasHeartDisease ]
		whenExecutingMethod: CMMockPerson >> #drinkCoffee
		action: [ :person | person haveHeartAttack ].

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
