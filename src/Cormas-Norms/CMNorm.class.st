Class {
	#name : 'CMNorm',
	#superclass : 'Object',
	#instVars : [
		'conditionBlock',
		'penaltyBlock',
		'instrumenter',
		'methodsToInstrument'
	],
	#category : 'Cormas-Norms',
	#package : 'Cormas-Norms'
}

{ #category : 'as yet unclassified' }
CMNorm class >> if: aConditionBlock forbiddenMethods: aCompiledMethodsArray penalty: aPenaltyBlock [

	^ self new
		condition: aConditionBlock;
		methodToInstrument: aCompiledMethodsArray;
		penalty: aPenaltyBlock;
		yourself
]

{ #category : 'as yet unclassified' }
CMNorm class >> if: aConditionBlock thenForbidTo: aCompiledMethod otherwise: aPenaltyBlock [

	^ self new
		condition: aConditionBlock;
		methodToInstrument: aCompiledMethod;
		penalty: aPenaltyBlock;
		yourself
]

{ #category : 'private' }
CMNorm >> activate [

	instrumenter instrumentMethods: methodsToInstrument
]

{ #category : 'accessing' }
CMNorm >> condition [

	^ conditionBlock
]

{ #category : 'accessing' }
CMNorm >> condition: aFullBlockClosure [

	conditionBlock := aFullBlockClosure
]

{ #category : 'private' }
CMNorm >> deactivate [

	instrumenter uninstrument
]

{ #category : 'initialization' }
CMNorm >> initialize [

	super initialize.
	instrumenter := CMNormInstrumenter onNorm: self
]

{ #category : 'as yet unclassified' }
CMNorm >> methodToInstrument: aCollection [

	methodsToInstrument := aCollection
]

{ #category : 'as yet unclassified' }
CMNorm >> penalty [

	^ penaltyBlock
]

{ #category : 'as yet unclassified' }
CMNorm >> penalty: aFullBlockClosure [

	penaltyBlock := aFullBlockClosure
]
