Class {
	#name : 'CMNormTest',
	#superclass : 'TestCase',
	#instVars : [
		'penaltyRule',
		'rewardRule',
		'rulesApplier'
	],
	#category : 'Cormas-Norms-Tests',
	#package : 'Cormas-Norms-Tests'
}

{ #category : 'running' }
CMNormTest >> tearDown [

	rulesApplier deactivateRules.

	super tearDown
]

{ #category : 'tests' }
CMNormTest >> testAgentForbidden [

	| mockAgent |
	penaltyRule := CMPenaltyRule
		if: [ :agent | agent cannotEatForbiddenFruit ]
		whenExecuting: CMMockNormsAgent >> #eat
		penalty: [ :agent | agent payFine: 20 ].

	mockAgent := CMMockNormsAgent new balance: 100; canEatForbiddenFruit: false; yourself.

	rulesApplier := CMRulesApplier rules: { penaltyRule }.
	rulesApplier applyRules.
	mockAgent eat.
	
	self assert: mockAgent balance equals: 80
]

{ #category : 'tests' }
CMNormTest >> testAgentForbiddenAndAllowed [

	| mockAgent1 mockAgent2 |
	penaltyRule := CMPenaltyRule
		if: [ :agent | agent cannotEatForbiddenFruit ]
		whenExecuting: CMMockNormsAgent >> #eat
		penalty: [ :agent | agent payFine: 20 ].

	mockAgent1 := CMMockNormsAgent new balance: 100; canEatForbiddenFruit: false; yourself.
	mockAgent2 := CMMockNormsAgent new balance: 100; canEatForbiddenFruit: true; yourself.

	rulesApplier := CMRulesApplier rules: { penaltyRule }.
	rulesApplier applyRules.

	mockAgent1 eat.
	mockAgent2 eat.
	
	self assert: mockAgent1 balance equals: 80.
	self assert: mockAgent2 balance equals: 100
]

{ #category : 'tests' }
CMNormTest >> testAgentReward [

	| mockAgent |
	rewardRule := CMRewardRule
		if: [ :agent | agent canEatForbiddenFruit ]
		whenExecuting: CMMockNormsAgent >> #eat
		reward: [ :agent | agent increaseBalance: 20 ].

	mockAgent := CMMockNormsAgent new balance: 100; canEatForbiddenFruit: true; yourself.

	rulesApplier := CMRulesApplier rules: { rewardRule }.
	rulesApplier applyRules.

	mockAgent eat.
	
	self assert: mockAgent balance equals: 120
]

{ #category : 'tests' }
CMNormTest >> testAgentRewardAndForbidden [

	| mockAgent1 mockAgent2 |
	rewardRule := CMRewardRule
		if: [ :agent | agent canEatForbiddenFruit ]
		whenExecuting: CMMockNormsAgent >> #eat
		reward: [ :agent | agent increaseBalance: 20 ].
	penaltyRule := CMPenaltyRule
		if: [ :agent | agent cannotEatForbiddenFruit ]
		whenExecuting: CMMockNormsAgent >> #eat
		penalty: [ :agent | agent payFine: 20 ].

	mockAgent1 := CMMockNormsAgent new balance: 100; canEatForbiddenFruit: true; yourself.
	mockAgent2 := CMMockNormsAgent new balance: 100; canEatForbiddenFruit: false; yourself.

	rulesApplier := CMRulesApplier rules: { penaltyRule . rewardRule }.
	rulesApplier applyRules.
	
	mockAgent1 eat.
	mockAgent2 eat.

	self assert: mockAgent1 balance equals: 120.
	self assert: mockAgent2 balance equals: 80
]

{ #category : 'tests' }
CMNormTest >> testAgentRewardAndNotRewarded [

	| mockAgent1 mockAgent2 |
	rewardRule := CMRewardRule
		if: [ :agent | agent canEatForbiddenFruit ]
		whenExecuting: CMMockNormsAgent >> #eat
		reward: [ :agent | agent increaseBalance: 20 ].

	mockAgent1 := CMMockNormsAgent new balance: 100; canEatForbiddenFruit: true; yourself.
	mockAgent2 := CMMockNormsAgent new balance: 100; canEatForbiddenFruit: false; yourself.

	rulesApplier := CMRulesApplier rules: { rewardRule }.
	rulesApplier applyRules.
	
	mockAgent1 eat.
	mockAgent2 eat.
	
	self assert: mockAgent1 balance equals: 120.
	self assert: mockAgent2 balance equals: 100
]
