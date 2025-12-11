Class {
	#name : 'CMNorm',
	#superclass : 'Object',
	#instVars : [
		'conditionBlock',
		'actionBlock',
		'methodToInstrument',
		'isActive',
		'name'
	],
	#category : 'Cormas-Norms',
	#package : 'Cormas-Norms'
}

{ #category : 'instance creation' }
CMNorm class >> if: aConditionBlock whenExecutingMethod: compiledMethod action: anActionBlock [

	^ self new
		  conditionBlock: aConditionBlock;
		  methodToInstrument: compiledMethod;
		  actionBlock: anActionBlock;
		  yourself
]

{ #category : 'instance creation' }
CMNorm class >> if: aConditionBlock whenExecutingSelector: aSelector inClass: aClass action: anActionBlock [

	| compiledMethod |
	compiledMethod := self methodFor: aSelector in: aClass.

	^ self
		if: aConditionBlock
		whenExecutingMethod: compiledMethod
		action: anActionBlock
]

{ #category : 'instance creation' }
CMNorm class >> methodFor: aSelector in: aClass [

	| compiledMethod |
	compiledMethod := aClass lookupSelector: aSelector.
	compiledMethod ifNil: [
		self error: 'The method ' , aSelector , ' does not exist in class ' , aClass name ].
	^ compiledMethod
]

{ #category : 'accessing' }
CMNorm >> actionBlock [

	^ actionBlock
]

{ #category : 'accessing' }
CMNorm >> actionBlock: aBlockClosure [

	actionBlock := aBlockClosure
]

{ #category : 'api' }
CMNorm >> activate [

	isActive := true
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

	isActive := false
]

{ #category : 'initialization' }
CMNorm >> initialize [

	super initialize.
	isActive := true.
	name := self class name
]

{ #category : 'api' }
CMNorm >> isActive [

	^ isActive
]

{ #category : 'defaults' }
CMNorm >> methodFor: aSelector in: aClass [

	^ self class methodFor: aSelector in: aClass
]

{ #category : 'accessing' }
CMNorm >> methodToInstrument [

	^ methodToInstrument
]

{ #category : 'accessing' }
CMNorm >> methodToInstrument: aCollection [

	methodToInstrument := aCollection
]

{ #category : 'accessing' }
CMNorm >> name [

	^ name
]

{ #category : 'accessing' }
CMNorm >> name: aString [

	name := aString
]
