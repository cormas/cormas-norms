Class {
	#name : 'CMRulesAreUsedAsClassesTest',
	#superclass : 'CMAbstractRulesTest',
	#category : 'Cormas-Norms-Tests',
	#package : 'Cormas-Norms-Tests'
}

{ #category : 'tests' }
CMRulesAreUsedAsClassesTest >> testRulesAsClasses [

	| mockAgent1 mockAgent2 |

	mockAgent1 := CMMockRulesAgent new balance: 100; canEatForbiddenFruit: true; yourself.
	mockAgent2 := CMMockRulesAgent new balance: 100; canEatForbiddenFruit: false; yourself.

	rulesApplier := CMRulesApplier rules: { CMCannotEatFruitMockRule new . CMCanEatFruitMockRule new }.
	rulesApplier applyRules.
	
	mockAgent1 eat.
	mockAgent2 eat.

	self assert: mockAgent1 balance equals: 120.
	self assert: mockAgent2 balance equals: 80
]
