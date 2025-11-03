Class {
	#name : 'CMRulesDynamicActivationTest',
	#superclass : 'CMAbstractRulesTest',
	#category : 'Cormas-Norms-Tests',
	#package : 'Cormas-Norms-Tests'
}

{ #category : 'tests' }
CMRulesDynamicActivationTest >> testDynamicallyApplyRules [

	| allowedAgent forbiddenAgent rewardRule penaltyRule |
	rewardRule := CMRule
		if: [ :agent | agent canEatForbiddenFruit ]
		whenExecutingMethod: CMMockRulesAgent >> #eat
		action: [ :agent | agent increaseBalance: 20 ].
	penaltyRule := CMRule
		if: [ :agent | agent cannotEatForbiddenFruit ]
		whenExecutingMethod: CMMockRulesAgent >> #eat
		action: [ :agent | agent payFine: 20 ].

	allowedAgent := CMMockRulesAgent new balance: 100; canEatForbiddenFruit: true; yourself.
	forbiddenAgent := CMMockRulesAgent new balance: 100; canEatForbiddenFruit: false; yourself.

	rulesApplier := CMRulesApplier rules: { penaltyRule . rewardRule }.
	rulesApplier applyRules.

	"Both rules active"
	allowedAgent eat.
	forbiddenAgent eat.
	self assert: allowedAgent balance equals: 120.
	self assert: forbiddenAgent balance equals: 80.

	penaltyRule deactivate.
	forbiddenAgent eat.
	self assert: forbiddenAgent balance equals: 80 "no decrease on penalty".

	rewardRule deactivate.
	allowedAgent eat.
	self assert: allowedAgent balance equals: 120 "no more increase".
]
