Class {
	#name : 'CMNormsDynamicActivationTest',
	#superclass : 'CMAbstractNormsTest',
	#category : 'Cormas-Norms-Tests',
	#package : 'Cormas-Norms-Tests'
}

{ #category : 'tests' }
CMNormsDynamicActivationTest >> testDynamicallyApplyRules [

	| allowedAgent forbiddenAgent rewardRule penaltyRule |
	rewardRule := CMNorm
		              if: [ :agent | agent canEatForbiddenFruit ]
		              whenExecutingMethod: CMMockNormsAgent >> #eat
		              action: [ :agent | agent increaseBalance: 20 ].
	penaltyRule := CMNorm
		               if: [ :agent | agent cannotEatForbiddenFruit ]
		               whenExecutingMethod: CMMockNormsAgent >> #eat
		               action: [ :agent | agent payFine: 20 ].

	allowedAgent := CMMockNormsAgent new
		                balance: 100;
		                canEatForbiddenFruit: true;
		                yourself.
	forbiddenAgent := CMMockNormsAgent new
		                  balance: 100;
		                  canEatForbiddenFruit: false;
		                  yourself.

	rulesApplier := CMNormsApplier onNorms: {
			                penaltyRule.
			                rewardRule }.
	rulesApplier applyNorms.

	"Both rules active"
	allowedAgent eat.
	forbiddenAgent eat.
	self assert: allowedAgent balance equals: 120.
	self assert: forbiddenAgent balance equals: 80.

	penaltyRule deactivate.
	forbiddenAgent eat.
	self assert: forbiddenAgent balance equals: 80. "no decrease on penalty"

	rewardRule deactivate.
	allowedAgent eat.
	self assert: allowedAgent balance equals: 120 "no more increase"
]
