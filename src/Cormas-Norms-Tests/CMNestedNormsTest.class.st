Class {
	#name : 'CMNestedNormsTest',
	#superclass : 'CMAbstractNormsTest',
	#category : 'Cormas-Norms-Tests',
	#package : 'Cormas-Norms-Tests'
}

{ #category : 'tests' }
CMNestedNormsTest >> testContradictoryRules [

	| person1 |

	person1 := CMMockAgent new
		           balance: 100;
		           canEatForbiddenFruit: true;
		           yourself.

	"Apply rules"
	rulesApplier := CMNormsApplier onNorms: { rewardRule . CMExampleNormCanEatFruitContradictory new. }.
	rulesApplier applyNorms.

	person1 eat.

	self assert: person1 balance equals: 90
]

{ #category : 'tests' }
CMNestedNormsTest >> testNestedRules [

	| person1 person2 person3 |
	person1 := CMMockPerson new
		           bePregnant;
		           yourself.
	person2 := CMMockPerson new
		           beHeartSick;
		           yourself.
	person3 := CMMockPerson new.

	"Apply rules"
	rulesApplier := CMNormsApplier onNorms: {
			CMExampleNormCannotDrinkCoffePregnant new. CMExampleNormCannotDrinkCoffeHeartAttack new }.
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
