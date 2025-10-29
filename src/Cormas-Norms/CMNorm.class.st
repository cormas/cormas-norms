Class {
	#name : 'CMNorm',
	#superclass : 'Object',
	#instVars : [
		'conditionBlock',
		'instrumenter',
		'methodsToInstrument',
		'actionBlock'
	],
	#category : 'Cormas-Norms',
	#package : 'Cormas-Norms'
}

{ #category : 'accessing' }
CMNorm >> actionBlock [

	^ actionBlock
]

{ #category : 'api' }
CMNorm >> activate [

	instrumenter instrumentMethods: methodsToInstrument
]

{ #category : 'accessing' }
CMNorm >> conditionBlock [

	^ conditionBlock
]

{ #category : 'accessing' }
CMNorm >> conditionBlock: aFullBlockClosure [

	conditionBlock := aFullBlockClosure
]

{ #category : 'api' }
CMNorm >> deactivate [

	instrumenter uninstrument
]

{ #category : 'initialization' }
CMNorm >> initialize [

	super initialize.
	instrumenter := CMNormInstrumenter onNorm: self
]

{ #category : 'accessing' }
CMNorm >> methodToInstrument: aCollection [

	methodsToInstrument := aCollection
]
