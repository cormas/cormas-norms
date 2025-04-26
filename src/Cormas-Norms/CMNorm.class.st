Class {
	#name : 'CMNorm',
	#superclass : 'Object',
	#instVars : [
		'aim',
		'condition',
		'otherwise'
	],
	#category : 'Cormas-Norms',
	#package : 'Cormas-Norms'
}

{ #category : 'as yet unclassified' }
CMNorm class >> if: aConditionBlock thenForbidTo: aReverseAimBlock otherwise: anOtherwiseBlock [

	^ self
		if: aConditionBlock
		thenMustDo: [ :anObject | (aReverseAimBlock value: anObject) not ]
		otherwise: anOtherwiseBlock
]

{ #category : 'enumerating' }
CMNorm class >> if: aConditionBlock thenMustDo: anAimBlock otherwise: anOtherwiseBlock [

	^ self new
		condition: aConditionBlock;
		aim: anAimBlock;
		otherwise: anOtherwiseBlock;
		yourself
]

{ #category : 'accessing' }
CMNorm >> aim: aBlock [

	aim := aBlock
]

{ #category : 'private' }
CMNorm >> applyTo: anObject [

	(condition value: anObject) ifTrue: [ 
		(aim value: anObject) ifFalse: [ 
			otherwise value: anObject ] ]
]

{ #category : 'accessing' }
CMNorm >> condition: aBlock [

	condition := aBlock
]

{ #category : 'accessing' }
CMNorm >> otherwise: aBlock [

	otherwise := aBlock
]
