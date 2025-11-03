Class {
	#name : 'CMNestedRulesTest',
	#superclass : 'CMAbstractRulesTest',
	#instVars : [
		'rule1',
		'rule2'
	],
	#category : 'Cormas-Norms-Tests',
	#package : 'Cormas-Norms-Tests'
}

{ #category : 'tests' }
CMNestedRulesTest >> testContradictoryRules [

	| person1 |
	rule1 := CMRule
		if: [ :person | person canEatForbiddenFruit ]
		whenExecutingMethod: CMMockRulesAgent >> #eat
		action: [ :person | person payFine: 20 ].
	rule2 := CMRule
		if: [ :person | person canEatForbiddenFruit ]
		whenExecutingMethod: CMMockRulesAgent >> #eat
		action: [ :person | person increaseBalance: 30 ].

	person1 := CMMockRulesAgent new balance: 100; canEatForbiddenFruit: true; yourself.

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
		whenExecutingMethod: CMMockRulesPerson >> #drinkCoffee
		action: [ :person | person killBaby ].
	rule2 := CMRule
		if: [ :person | person hasHeartDisease ]
		whenExecutingMethod: CMMockRulesPerson >> #drinkCoffee
		action: [ :person | person haveHeartAttack ].

	person1 := CMMockRulesPerson new bePregnant; yourself.
	person2 := CMMockRulesPerson new beHeartSick; yourself.
	person3 := CMMockRulesPerson new.

	"Apply rules"
	rulesApplier := CMRulesApplier rules: { rule1 . rule2 }.
	rulesApplier applyRules.

	{ person1 . person2 . person3 } do: #drinkCoffee.

	self assert: person1 hasBabyBeenKilled.
	self assert: person2 hasHadHeartAttack.

	self deny: person3 hasBabyBeenKilled.
	self deny: person3 hasHadHeartAttack
]
