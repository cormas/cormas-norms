Class {
	#name : 'Obligation',
	#superclass : 'Norm',
	#category : 'Cormas-Norms',
	#package : 'Cormas-Norms'
}

{ #category : 'enumerating' }
Obligation class >> if: aConditionBlock thenMustDo: anAimBlock otherwise: anOtherwiseBlock [

	^ self new
		condition: aConditionBlock;
		aim: anAimBlock;
		otherwise: anOtherwiseBlock;
		yourself
]
