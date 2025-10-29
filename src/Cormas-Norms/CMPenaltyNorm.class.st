Class {
	#name : 'CMPenaltyNorm',
	#superclass : 'CMNorm',
	#category : 'Cormas-Norms',
	#package : 'Cormas-Norms'
}

{ #category : 'as yet unclassified' }
CMPenaltyNorm class >> if: aConditionBlock forbiddenMethods: aCompiledMethodsArray penalty: aPenaltyBlock [

	^ self new
		conditionBlock: aConditionBlock;
		methodToInstrument: aCompiledMethodsArray;
		penaltyBlock: aPenaltyBlock;
		yourself
]

{ #category : 'accessing' }
CMPenaltyNorm >> penaltyBlock: aFullBlockClosure [

	actionBlock := aFullBlockClosure
]
