Class {
	#name : 'CMNormsTest',
	#superclass : 'CMAbstractNormsTest',
	#category : 'Cormas-Norms-Tests',
	#package : 'Cormas-Norms-Tests'
}

{ #category : 'tests' }
CMNormsTest >> testAgentForbidden [

	| mockAgent |
	mockAgent := CMMockAgent new
		             balance: 100;
		             canEatForbiddenFruit: false;
		             yourself.

	rulesApplier := CMNormsApplier onNorms: { penaltyRule }.
	rulesApplier applyNorms.
	mockAgent eat.

	self assert: mockAgent balance equals: 80
]

{ #category : 'tests' }
CMNormsTest >> testAgentForbiddenAndAllowed [

	| mockAgent1 mockAgent2 |
	mockAgent1 := CMMockAgent new
		              balance: 100;
		              canEatForbiddenFruit: false;
		              yourself.
	mockAgent2 := CMMockAgent new
		              balance: 100;
		              canEatForbiddenFruit: true;
		              yourself.

	rulesApplier := CMNormsApplier onNorms: { penaltyRule }.
	rulesApplier applyNorms.

	mockAgent1 eat.
	mockAgent2 eat.

	self assert: mockAgent1 balance equals: 80.
	self assert: mockAgent2 balance equals: 100
]

{ #category : 'tests' }
CMNormsTest >> testAgentReward [

	| mockAgent |
	mockAgent := CMMockAgent new
		             balance: 100;
		             canEatForbiddenFruit: true;
		             yourself.

	rulesApplier := CMNormsApplier onNorms: { rewardRule }.
	rulesApplier applyNorms.

	mockAgent eat.

	self assert: mockAgent balance equals: 120
]

{ #category : 'tests' }
CMNormsTest >> testAgentRewardAndForbidden [

	| mockAgent1 mockAgent2 |
	mockAgent1 := CMMockAgent new
		              balance: 100;
		              canEatForbiddenFruit: true;
		              yourself.
	mockAgent2 := CMMockAgent new
		              balance: 100;
		              canEatForbiddenFruit: false;
		              yourself.

	rulesApplier := CMNormsApplier onNorms: {
			                penaltyRule.
			                rewardRule }.
	rulesApplier applyNorms.

	mockAgent1 eat.
	mockAgent2 eat.

	self assert: mockAgent1 balance equals: 120.
	self assert: mockAgent2 balance equals: 80
]

{ #category : 'tests' }
CMNormsTest >> testAgentRewardAndNotRewarded [

	| mockAgent1 mockAgent2 |
	mockAgent1 := CMMockAgent new
		              balance: 100;
		              canEatForbiddenFruit: true;
		              yourself.
	mockAgent2 := CMMockAgent new
		              balance: 100;
		              canEatForbiddenFruit: false;
		              yourself.

	rulesApplier := CMNormsApplier onNorms: { rewardRule }.
	rulesApplier applyNorms.

	mockAgent1 eat.
	mockAgent2 eat.

	self assert: mockAgent1 balance equals: 120.
	self assert: mockAgent2 balance equals: 100
]
