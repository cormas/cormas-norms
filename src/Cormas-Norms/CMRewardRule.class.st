Class {
	#name : 'CMRewardRule',
	#superclass : 'CMRule',
	#category : 'Cormas-Norms',
	#package : 'Cormas-Norms'
}

{ #category : 'as yet unclassified' }
CMRewardRule >> rewardBlock: aBlock [

	self actionBlock: aBlock
]
