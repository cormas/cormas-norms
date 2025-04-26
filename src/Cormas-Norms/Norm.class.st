Class {
	#name : 'Norm',
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
Norm class >> if: aConditionBlock thenForbidTo: aReverseAimBlock otherwise: anOtherwiseBlock [

	^ self
		if: aConditionBlock
		thenMustDo: [ :anObject | (aReverseAimBlock value: anObject) not ]
		otherwise: anOtherwiseBlock
]

{ #category : 'enumerating' }
Norm class >> if: aConditionBlock thenMustDo: anAimBlock otherwise: anOtherwiseBlock [

	^ self new
		condition: aConditionBlock;
		aim: anAimBlock;
		otherwise: anOtherwiseBlock;
		yourself
]

{ #category : 'accessing' }
Norm >> aim: aBlock [

	aim := aBlock
]

{ #category : 'private' }
Norm >> applyTo: anObject [

	(condition value: anObject) ifTrue: [ 
		(aim value: anObject) ifFalse: [ 
			otherwise value: anObject ] ]
]

{ #category : 'accessing' }
Norm >> condition: aBlock [

	condition := aBlock
]

{ #category : 'accessing' }
Norm >> otherwise: aBlock [

	otherwise := aBlock
]
