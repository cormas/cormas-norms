Class {
	#name : 'CMActiveNormsApplicationTest',
	#superclass : 'CMAbstractNormsTest',
	#category : 'Cormas-Norms-Tests',
	#package : 'Cormas-Norms-Tests'
}

{ #category : 'tests' }
CMActiveNormsApplicationTest >> testOnlyActiveNormsAreApplied [

	| allowedAgent forbiddenAgent |
	allowedAgent := CMMockAgent new
		                balance: 100;
		                canEatForbiddenFruit: true;
		                yourself.
	forbiddenAgent := CMMockAgent new
		                  balance: 100;
		                  canEatForbiddenFruit: false;
		                  yourself.

	rulesApplier := CMNormsApplier onNorms: {
			                rewardRule.
			                penaltyRule }.
	penaltyRule deactivate.
	rulesApplier applyNorms.

	allowedAgent eat.
	forbiddenAgent eat.

	self assert: allowedAgent balance equals: 120.
	self assert: forbiddenAgent balance equals: 100
]
