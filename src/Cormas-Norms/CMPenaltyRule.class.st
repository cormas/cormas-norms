Class {
	#name : 'CMPenaltyRule',
	#superclass : 'CMRule',
	#category : 'Cormas-Norms',
	#package : 'Cormas-Norms'
}

{ #category : 'accessing' }
CMPenaltyRule >> penaltyBlock: aFullBlockClosure [

	self actionBlock: aFullBlockClosure
]
