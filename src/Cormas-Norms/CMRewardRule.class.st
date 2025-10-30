Class {
	#name : 'CMRewardRule',
	#superclass : 'CMRule',
	#category : 'Cormas-Norms',
	#package : 'Cormas-Norms'
}

{ #category : 'as yet unclassified' }
CMRewardRule class >> if: aConditionBlock whenExecuting: aCompiledMethod reward: aRewardBlock [

	^ self new
		conditionBlock: aConditionBlock;
		methodToInstrument: aCompiledMethod;
		rewardBlock: aRewardBlock;
		yourself
]

{ #category : 'as yet unclassified' }
CMRewardRule >> rewardBlock: aBlock [

	actionBlock := aBlock
]
