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
