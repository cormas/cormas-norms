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

{ #category : 'instance creation' }
CMRule class >> if: aConditionBlock whenExecutingMethod: compiledMethod action: anActionBlock [

	^ self new
		  conditionBlock: aConditionBlock;
		  methodToInstrument: compiledMethod;
		  actionBlock: anActionBlock;
		  yourself
]

{ #category : 'instance creation' }
CMRule class >> if: aConditionBlock whenExecutingSelector: aSelector inClass: aClass action: anActionBlock [

	| compiledMethod |
	compiledMethod := aClass lookupSelector: aSelector.
	compiledMethod ifNil: [ 
		self error: 'The method ', aSelector , ' does not exist in class ', aClass name  ].

	^ self
		if: aConditionBlock
		whenExecutingMethod: compiledMethod
		action: anActionBlock
]

{ #category : 'accessing' }
CMRule >> actionBlock [

	^ actionBlock
]

{ #category : 'accessing' }
CMRule >> actionBlock: aBlockClosure [

	actionBlock := aBlockClosure
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
