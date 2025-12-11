Class {
	#name : 'CMMpNormHandler',
	#superclass : 'MpHandler',
	#instVars : [
		'norms'
	],
	#category : 'Cormas-Norms',
	#package : 'Cormas-Norms'
}

{ #category : 'instance creation' }
CMMpNormHandler class >> onNorms: aCollectionOfCMRules [

	^ self new
		  norms: aCollectionOfCMRules;
		  yourself
]

{ #category : 'evaluating' }
CMMpNormHandler >> afterExecutionWithReceiver: receiver arguments: arguments returnValue: returnValue [

	norms do: [ :aCMNorm |
			((aCMNorm conditionBlock value: receiver) and: [ aCMNorm isActive ])
				ifTrue: [ aCMNorm actionBlock value: receiver ] ].

	^ returnValue
]

{ #category : 'instance creation' }
CMMpNormHandler >> norms: aCollectionOfCMNorms [

	norms := aCollectionOfCMNorms
]
