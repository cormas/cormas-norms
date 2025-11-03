Class {
	#name : 'CMMpRuleHandler',
	#superclass : 'MpHandler',
	#instVars : [
		'rules'
	],
	#category : 'Cormas-Norms',
	#package : 'Cormas-Norms'
}

{ #category : 'as yet unclassified' }
CMMpRuleHandler class >> onRules: aCollectionOfCMRules [

	^ self new
		  rules: aCollectionOfCMRules;
		  yourself
]

{ #category : 'evaluating' }
CMMpRuleHandler >> afterExecutionWithReceiver: receiver arguments: arguments returnValue: returnValue [

	rules do: [ :aCMRule |
			((aCMRule conditionBlock value: receiver) and: [ aCMRule isActive ])
				ifTrue: [ aCMRule actionBlock value: receiver ] ].

	^ returnValue
]

{ #category : 'instance creation' }
CMMpRuleHandler >> rules: aCollectionOfCMRules [

	rules := aCollectionOfCMRules
]
