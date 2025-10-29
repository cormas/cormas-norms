Class {
	#name : 'CMRewardNorm',
	#superclass : 'CMNorm',
	#category : 'Cormas-Norms',
	#package : 'Cormas-Norms'
}

{ #category : 'as yet unclassified' }
CMRewardNorm class >> if: aConditionBlock rewardingMethods: aCompiledMethodsArray reward: aRewardBlock [

	^ self new
		conditionBlock: aConditionBlock;
		methodToInstrument: aCompiledMethodsArray;
		rewardBlock: aRewardBlock;
		yourself
]

{ #category : 'as yet unclassified' }
CMRewardNorm >> rewardBlock: aBlock [

	actionBlock := aBlock
]
