Class {
	#name : 'CMPenaltyRule',
	#superclass : 'CMRule',
	#category : 'Cormas-Norms',
	#package : 'Cormas-Norms'
}

{ #category : 'as yet unclassified' }
CMPenaltyRule class >> if: aConditionBlock whenExecuting: aCompiledMethodsArray penalty: aPenaltyBlock [

	^ self new
		conditionBlock: aConditionBlock;
		methodToInstrument: aCompiledMethodsArray;
		penaltyBlock: aPenaltyBlock;
		yourself
]

{ #category : 'accessing' }
CMPenaltyRule >> penaltyBlock: aFullBlockClosure [

	actionBlock := aFullBlockClosure
]
