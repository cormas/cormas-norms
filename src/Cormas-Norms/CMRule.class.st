Class {
	#name : 'CMRule',
	#superclass : 'Object',
	#instVars : [
		'conditionBlock',
		'instrumenter',
		'actionBlock',
		'methodToInstrument'
	],
	#category : 'Cormas-Norms',
	#package : 'Cormas-Norms'
}

{ #category : 'accessing' }
CMRule >> actionBlock [

	^ actionBlock
]

{ #category : 'api' }
CMRule >> activate [

	instrumenter instrumentMethods: methodToInstrument
]

{ #category : 'accessing' }
CMRule >> conditionBlock [

	^ conditionBlock
]

{ #category : 'accessing' }
CMRule >> conditionBlock: aFullBlockClosure [

	conditionBlock := aFullBlockClosure
]

{ #category : 'api' }
CMRule >> deactivate [

	instrumenter uninstrument
]

{ #category : 'initialization' }
CMRule >> initialize [

	super initialize.
	instrumenter := CMNormInstrumenter onNorm: self
]

{ #category : 'accessing' }
CMRule >> methodToInstrument [

	^ methodToInstrument
]

{ #category : 'accessing' }
CMRule >> methodToInstrument: aCollection [

	methodToInstrument := aCollection
]
