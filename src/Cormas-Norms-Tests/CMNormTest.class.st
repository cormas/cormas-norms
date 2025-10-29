Class {
	#name : 'CMNormTest',
	#superclass : 'TestCase',
	#instVars : [
		'rewardNorm',
		'penaltyNorm'
	],
	#category : 'Cormas-Norms-Tests',
	#package : 'Cormas-Norms-Tests'
}

{ #category : 'running' }
CMNormTest >> tearDown [

	penaltyNorm ifNotNil: [ penaltyNorm deactivate ].
	rewardNorm ifNotNil: [ rewardNorm deactivate ].

	super tearDown
]

{ #category : 'tests' }
CMNormTest >> testAgentForbidden [

	| mockAgent |
	penaltyNorm := CMPenaltyNorm
		if: [ :agent | agent cannotEatForbiddenFruit ]
		forbiddenMethods: { CMMockNormsAgent >> #eat }
		penalty: [ :agent | agent payFine: 20 ].

	mockAgent := CMMockNormsAgent new
		balance: 100;
		canEatForbiddenFruit: false;
		yourself.

	penaltyNorm activate.
	mockAgent eat.
	
	self assert: mockAgent balance equals: 80
]

{ #category : 'tests' }
CMNormTest >> testAgentForbiddenAndAllowed [

	| mockAgent1 mockAgent2 |
	penaltyNorm := CMPenaltyNorm
		if: [ :agent | agent cannotEatForbiddenFruit ]
		forbiddenMethods: { CMMockNormsAgent >> #eat }
		penalty: [ :agent | agent payFine: 20 ].

	mockAgent1 := CMMockNormsAgent new
		balance: 100;
		canEatForbiddenFruit: false;
		yourself.
	mockAgent2 := CMMockNormsAgent new
		balance: 100;
		canEatForbiddenFruit: true;
		yourself.

	penaltyNorm activate.
	mockAgent1 eat.
	mockAgent2 eat.
	
	self assert: mockAgent1 balance equals: 80.
	self assert: mockAgent2 balance equals: 100
]

{ #category : 'tests' }
CMNormTest >> testAgentReward [

	| mockAgent |
	rewardNorm := CMRewardNorm
		if: [ :agent | agent canEatForbiddenFruit ]
		rewardingMethods: { CMMockNormsAgent >> #eat }
		reward: [ :agent | agent increaseBalance: 20 ].

	mockAgent := CMMockNormsAgent new
		balance: 100;
		canEatForbiddenFruit: true;
		yourself.

	rewardNorm activate.
	mockAgent eat.
	
	self assert: mockAgent balance equals: 120
]

{ #category : 'tests' }
CMNormTest >> testAgentRewardAndForbidden [

	| mockAgent1 mockAgent2 |
	rewardNorm := CMRewardNorm
		if: [ :agent | agent canEatForbiddenFruit ]
		rewardingMethods: { CMMockNormsAgent >> #eat }
		reward: [ :agent | agent increaseBalance: 20 ].
	penaltyNorm := CMPenaltyNorm
		if: [ :agent | agent cannotEatForbiddenFruit ]
		forbiddenMethods: { CMMockNormsAgent >> #eat }
		penalty: [ :agent | agent payFine: 20 ].

	mockAgent1 := CMMockNormsAgent new
		balance: 100;
		canEatForbiddenFruit: true;
		yourself.
	mockAgent2 := CMMockNormsAgent new
		balance: 100;
		canEatForbiddenFruit: false;
		yourself.

	rewardNorm activate.
	penaltyNorm activate.
	mockAgent1 eat.
	mockAgent2 eat.

	self assert: mockAgent1 balance equals: 120.
	self assert: mockAgent2 balance equals: 80
]

{ #category : 'tests' }
CMNormTest >> testAgentRewardAndNotRewarded [

	| mockAgent1 mockAgent2 |
	rewardNorm := CMRewardNorm
		if: [ :agent | agent canEatForbiddenFruit ]
		rewardingMethods: { CMMockNormsAgent >> #eat }
		reward: [ :agent | agent increaseBalance: 20 ].

	mockAgent1 := CMMockNormsAgent new
		balance: 100;
		canEatForbiddenFruit: true;
		yourself.
	mockAgent2 := CMMockNormsAgent new
		balance: 100;
		canEatForbiddenFruit: false;
		yourself.

	rewardNorm activate.
	mockAgent1 eat.
	mockAgent2 eat.
	
	self assert: mockAgent1 balance equals: 120.
	self assert: mockAgent2 balance equals: 100
]
