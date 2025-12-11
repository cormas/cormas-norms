Class {
	#name : 'CMNormsAreUsedAsClassesTest',
	#superclass : 'CMAbstractNormsTest',
	#category : 'Cormas-Norms-Tests',
	#package : 'Cormas-Norms-Tests'
}

{ #category : 'tests' }
CMNormsAreUsedAsClassesTest >> testRulesAsClasses [

	| mockAgent1 mockAgent2 |
	mockAgent1 := CMMockNormsAgent new
		              balance: 100;
		              canEatForbiddenFruit: true;
		              yourself.
	mockAgent2 := CMMockNormsAgent new
		              balance: 100;
		              canEatForbiddenFruit: false;
		              yourself.

	rulesApplier := CMNormsApplier onNorms: {
			                CMCannotEatFruitMockNorm new.
			                CMCanEatFruitMockNorm new }.
	rulesApplier applyNorms.

	mockAgent1 eat.
	mockAgent2 eat.

	self assert: mockAgent1 balance equals: 120.
	self assert: mockAgent2 balance equals: 80
]
