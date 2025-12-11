Class {
	#name : 'CMNormsTest',
	#superclass : 'CMAbstractNormsTest',
	#instVars : [
		'penaltyRule',
		'rewardRule'
	],
	#category : 'Cormas-Norms-Tests',
	#package : 'Cormas-Norms-Tests'
}

{ #category : 'tests' }
CMNormsTest >> testAgentForbidden [

	| mockAgent |
	penaltyRule := CMNorm
		               if: [ :agent | agent cannotEatForbiddenFruit ]
		               whenExecutingMethod: CMMockNormsAgent >> #eat
		               action: [ :agent | agent payFine: 20 ].

	mockAgent := CMMockNormsAgent new
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
	penaltyRule := CMNorm
		               if: [ :agent | agent cannotEatForbiddenFruit ]
		               whenExecutingSelector: #eat
		               inClass: CMMockNormsAgent
		               action: [ :agent | agent payFine: 20 ].

	mockAgent1 := CMMockNormsAgent new
		              balance: 100;
		              canEatForbiddenFruit: false;
		              yourself.
	mockAgent2 := CMMockNormsAgent new
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
	rewardRule := CMNorm
		              if: [ :agent | agent canEatForbiddenFruit ]
		              whenExecutingSelector: #eat
		              inClass: CMMockNormsAgent
		              action: [ :agent | agent increaseBalance: 20 ].

	mockAgent := CMMockNormsAgent new
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
	rewardRule := CMNorm
		              if: [ :agent | agent canEatForbiddenFruit ]
		              whenExecutingMethod: CMMockNormsAgent >> #eat
		              action: [ :agent | agent increaseBalance: 20 ].
	penaltyRule := CMNorm
		               if: [ :agent | agent cannotEatForbiddenFruit ]
		               whenExecutingMethod: CMMockNormsAgent >> #eat
		               action: [ :agent | agent payFine: 20 ].

	mockAgent1 := CMMockNormsAgent new
		              balance: 100;
		              canEatForbiddenFruit: true;
		              yourself.
	mockAgent2 := CMMockNormsAgent new
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
	rewardRule := CMNorm
		              if: [ :agent | agent canEatForbiddenFruit ]
		              whenExecutingMethod: CMMockNormsAgent >> #eat
		              action: [ :agent | agent increaseBalance: 20 ].

	mockAgent1 := CMMockNormsAgent new
		              balance: 100;
		              canEatForbiddenFruit: true;
		              yourself.
	mockAgent2 := CMMockNormsAgent new
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
