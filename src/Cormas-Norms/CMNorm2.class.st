Class {
	#name : 'CMNorm2',
	#superclass : 'Object',
	#instVars : [
		'condition',
		'methodToInstrument',
		'penalty',
		'methodProxy'
	],
	#category : 'Cormas-Norms',
	#package : 'Cormas-Norms'
}

{ #category : 'as yet unclassified' }
CMNorm2 class >> if: aConditionBlock thenForbidTo: aCompiledMethod otherwise: aPenaltyBlock [

	^ self new
		condition: aConditionBlock;
		methodToInstrument: aCompiledMethod;
		penalty: aPenaltyBlock;
		yourself
]

{ #category : 'private' }
CMNorm2 >> apply [

	methodProxy := MpMethodProxy
		onMethod: methodToInstrument
		handler: (CMMpHandler onNorm: self)
]

{ #category : 'accessing' }
CMNorm2 >> condition [

	^ condition
]

{ #category : 'accessing' }
CMNorm2 >> condition: aFullBlockClosure [

	condition := aFullBlockClosure
]

{ #category : 'private' }
CMNorm2 >> install [

	methodProxy
		install;
		enableInstrumentation
]

{ #category : 'as yet unclassified' }
CMNorm2 >> methodToInstrument: aCollection [

	methodToInstrument := aCollection
]

{ #category : 'accessing' }
CMNorm2 >> penalty [

	^ penalty
]

{ #category : 'as yet unclassified' }
CMNorm2 >> penalty: aFullBlockClosure [

	penalty := aFullBlockClosure
]
