Class {
	#name : 'CMRule',
	#superclass : 'Object',
	#instVars : [
		'conditionBlock',
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

{ #category : 'accessing' }
CMRule >> conditionBlock [

	^ conditionBlock
]

{ #category : 'accessing' }
CMRule >> conditionBlock: aFullBlockClosure [

	conditionBlock := aFullBlockClosure
]

{ #category : 'accessing' }
CMRule >> methodToInstrument [

	^ methodToInstrument
]

{ #category : 'accessing' }
CMRule >> methodToInstrument: aCollection [

	methodToInstrument := aCollection
]
