Class {
	#name : 'CMRulesDynamicActivationTest',
	#superclass : 'TestCase',
	#instVars : [
		'rulesApplier'
	],
	#category : 'Cormas-Norms-Tests',
	#package : 'Cormas-Norms-Tests'
}

{ #category : 'running' }
CMRulesDynamicActivationTest >> tearDown [

	rulesApplier deactivateRules.

	super tearDown
]

{ #category : 'tests' }
CMRulesDynamicActivationTest >> testDynamicallyApplyRules [

	| allowedAgent forbiddenAgent rewardRule penaltyRule |
	rewardRule := CMRule
		if: [ :agent | agent canEatForbiddenFruit ]
		whenExecutingMethod: CMMockAgent >> #eat
		action: [ :agent | agent increaseBalance: 20 ].
	penaltyRule := CMRule
		if: [ :agent | agent cannotEatForbiddenFruit ]
		whenExecutingMethod: CMMockAgent >> #eat
		action: [ :agent | agent payFine: 20 ].

	allowedAgent := CMMockAgent new balance: 100; canEatForbiddenFruit: true; yourself.
	forbiddenAgent := CMMockAgent new balance: 100; canEatForbiddenFruit: false; yourself.

	rulesApplier := CMRulesApplier rules: { penaltyRule . rewardRule }.
	rulesApplier applyRules.
	
	"Both rules active"
	allowedAgent eat.
	forbiddenAgent eat.
	self assert: allowedAgent balance equals: 120.
	self assert: forbiddenAgent balance equals: 80.
	
	penaltyRule deactivate.
	
	allowedAgent eat.
	forbiddenAgent eat.
	self assert: allowedAgent balance equals: 140.
	self assert: forbiddenAgent balance equals: 80 "no decrease on penalty".
	
	rewardRule deactivate.
	
	allowedAgent eat.
	forbiddenAgent eat.
	self assert: allowedAgent balance equals: 140 "no more increase".
	self assert: forbiddenAgent balance equals: 80.
]
