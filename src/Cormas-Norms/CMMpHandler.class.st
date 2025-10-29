Class {
	#name : 'CMMpHandler',
	#superclass : 'MpHandler',
	#instVars : [
		'norm'
	],
	#category : 'Cormas-Norms',
	#package : 'Cormas-Norms'
}

{ #category : 'as yet unclassified' }
CMMpHandler class >> onNorm: aCormasNorm [

	^ self new
		  norm: aCormasNorm;
		  yourself
]

{ #category : 'evaluating' }
CMMpHandler >> afterExecutionWithReceiver: receiver arguments: args returnValue: returnValue [

	(norm conditionBlock value: receiver) ifTrue: [
		norm actionBlock value: receiver ].

	^ returnValue
]

{ #category : 'evaluating' }
CMMpHandler >> norm: aCormas [

	norm := aCormas
]
