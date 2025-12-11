Class {
	#name : 'CMNestedNormsTest',
	#superclass : 'CMAbstractNormsTest',
	#instVars : [
		'rule1',
		'rule2'
	],
	#category : 'Cormas-Norms-Tests',
	#package : 'Cormas-Norms-Tests'
}

{ #category : 'tests' }
CMNestedNormsTest >> testContradictoryRules [

	| person1 |
	rule1 := CMNorm
		         if: [ :person | person canEatForbiddenFruit ]
		         whenExecutingMethod: CMMockNormsAgent >> #eat
		         action: [ :person | person payFine: 20 ].
	rule2 := CMNorm
		         if: [ :person | person canEatForbiddenFruit ]
		         whenExecutingMethod: CMMockNormsAgent >> #eat
		         action: [ :person | person increaseBalance: 30 ].

	person1 := CMMockNormsAgent new
		           balance: 100;
		           canEatForbiddenFruit: true;
		           yourself.

	"Apply rules"
	rulesApplier := CMNormsApplier onNorms: {
			                rule1.
			                rule2 }.
	rulesApplier applyNorms.

	person1 eat.

	self assert: person1 balance equals: 110
]

{ #category : 'tests' }
CMNestedNormsTest >> testNestedRules [

	| person1 person2 person3 |
	rule1 := CMNorm
		         if: [ :person | person isPregnant ]
		         whenExecutingMethod: CMMockNormsPerson >> #drinkCoffee
		         action: [ :person | person killBaby ].
	rule2 := CMNorm
		         if: [ :person | person hasHeartDisease ]
		         whenExecutingMethod: CMMockNormsPerson >> #drinkCoffee
		         action: [ :person | person haveHeartAttack ].

	person1 := CMMockNormsPerson new
		           bePregnant;
		           yourself.
	person2 := CMMockNormsPerson new
		           beHeartSick;
		           yourself.
	person3 := CMMockNormsPerson new.

	"Apply rules"
	rulesApplier := CMNormsApplier onNorms: {
			                rule1.
			                rule2 }.
	rulesApplier applyNorms.

	{
		person1.
		person2.
		person3 } do: #drinkCoffee.

	self assert: person1 hasBabyBeenKilled.
	self assert: person2 hasHadHeartAttack.

	self deny: person3 hasBabyBeenKilled.
	self deny: person3 hasHadHeartAttack
]
