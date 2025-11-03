Class {
	#name : 'CMRulesTest',
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
CMRulesTest >> tearDown [

	rulesApplier deactivateRules.

	super tearDown
]

{ #category : 'tests' }
CMRulesTest >> testAgentForbidden [

	| mockAgent |
	penaltyRule := CMRule
		if: [ :agent | agent cannotEatForbiddenFruit ]
		whenExecutingMethod: CMMockAgent >> #eat
		action: [ :agent | agent payFine: 20 ].

	mockAgent := CMMockAgent new balance: 100; canEatForbiddenFruit: false; yourself.

	rulesApplier := CMRulesApplier rules: { penaltyRule }.
	rulesApplier applyRules.
	mockAgent eat.
	
	self assert: mockAgent balance equals: 80
]

{ #category : 'tests' }
CMRulesTest >> testAgentForbiddenAndAllowed [

	| mockAgent1 mockAgent2 |
	penaltyRule := CMRule
		if: [ :agent | agent cannotEatForbiddenFruit ]
		whenExecutingMethod: CMMockAgent >> #eat
		action: [ :agent | agent payFine: 20 ].

	mockAgent1 := CMMockAgent new balance: 100; canEatForbiddenFruit: false; yourself.
	mockAgent2 := CMMockAgent new balance: 100; canEatForbiddenFruit: true; yourself.

	rulesApplier := CMRulesApplier rules: { penaltyRule }.
	rulesApplier applyRules.

	mockAgent1 eat.
	mockAgent2 eat.
	
	self assert: mockAgent1 balance equals: 80.
	self assert: mockAgent2 balance equals: 100
]

{ #category : 'tests' }
CMRulesTest >> testAgentReward [

	| mockAgent |
	rewardRule := CMRule
		if: [ :agent | agent canEatForbiddenFruit ]
		whenExecutingMethod: CMMockAgent >> #eat
		action: [ :agent | agent increaseBalance: 20 ].

	mockAgent := CMMockAgent new balance: 100; canEatForbiddenFruit: true; yourself.

	rulesApplier := CMRulesApplier rules: { rewardRule }.
	rulesApplier applyRules.

	mockAgent eat.
	
	self assert: mockAgent balance equals: 120
]

{ #category : 'tests' }
CMRulesTest >> testAgentRewardAndForbidden [

	| mockAgent1 mockAgent2 |
	rewardRule := CMRule
		if: [ :agent | agent canEatForbiddenFruit ]
		whenExecutingMethod: CMMockAgent >> #eat
		action: [ :agent | agent increaseBalance: 20 ].
	penaltyRule := CMRule
		if: [ :agent | agent cannotEatForbiddenFruit ]
		whenExecutingMethod: CMMockAgent >> #eat
		action: [ :agent | agent payFine: 20 ].

	mockAgent1 := CMMockAgent new balance: 100; canEatForbiddenFruit: true; yourself.
	mockAgent2 := CMMockAgent new balance: 100; canEatForbiddenFruit: false; yourself.

	rulesApplier := CMRulesApplier rules: { penaltyRule . rewardRule }.
	rulesApplier applyRules.
	
	mockAgent1 eat.
	mockAgent2 eat.

	self assert: mockAgent1 balance equals: 120.
	self assert: mockAgent2 balance equals: 80
]

{ #category : 'tests' }
CMRulesTest >> testAgentRewardAndNotRewarded [

	| mockAgent1 mockAgent2 |
	rewardRule := CMRule
		if: [ :agent | agent canEatForbiddenFruit ]
		whenExecutingMethod: CMMockAgent >> #eat
		action: [ :agent | agent increaseBalance: 20 ].

	mockAgent1 := CMMockAgent new balance: 100; canEatForbiddenFruit: true; yourself.
	mockAgent2 := CMMockAgent new balance: 100; canEatForbiddenFruit: false; yourself.

	rulesApplier := CMRulesApplier rules: { rewardRule }.
	rulesApplier applyRules.
	
	mockAgent1 eat.
	mockAgent2 eat.
	
	self assert: mockAgent1 balance equals: 120.
	self assert: mockAgent2 balance equals: 100
]
