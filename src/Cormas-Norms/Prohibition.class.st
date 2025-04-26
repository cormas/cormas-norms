Class {
	#name : 'Prohibition',
	#superclass : 'Norm',
	#category : 'Cormas-Norms',
	#package : 'Cormas-Norms'
}

{ #category : 'as yet unclassified' }
Prohibition class >> if: aConditionBlock thenForbidTo: aReverseAimBlock otherwise: anOtherwiseBlock [

	^ Obligation
		if: aConditionBlock
		thenMustDo: [ :anObject | (aReverseAimBlock value: anObject) not ]
		otherwise: anOtherwiseBlock
]
