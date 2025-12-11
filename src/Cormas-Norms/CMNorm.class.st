Class {
	#name : 'CMNorm',
	#superclass : 'Object',
	#instVars : [
		'isActive'
	],
	#category : 'Cormas-Norms',
	#package : 'Cormas-Norms'
}

{ #category : 'api - rules' }
CMNorm >> action [
	"Return the method that should be observed. This is the action of the cormas model"

	^ self subclassResponsibility
]

{ #category : 'api - activation' }
CMNorm >> activate [

	isActive := true
]

{ #category : 'api - rules' }
CMNorm >> condition: agent [
	"This is the condition that determines if the rule should be applied or not. This method should return a boolean."

	^ self subclassResponsibility
]

{ #category : 'api - rules' }
CMNorm >> consequence: agent [
	"Return the method that is executed if the rule is broken"

	^ self subclassResponsibility
]

{ #category : 'api - activation' }
CMNorm >> deactivate [

	isActive := false
]

{ #category : 'initialization' }
CMNorm >> initialize [

	super initialize.
	isActive := true
]

{ #category : 'api - activation' }
CMNorm >> isActive [

	^ isActive
]

{ #category : 'defaults' }
CMNorm >> methodFor: aSelector in: aClass [

	| compiledMethod |
	compiledMethod := aClass lookupSelector: aSelector.
	compiledMethod ifNil: [
		self error: 'The method ' , aSelector , ' does not exist in class ' , aClass name ].
	^ compiledMethod
]

{ #category : 'accessing' }
CMNorm >> methodToInstrument [

	^ self action
]

{ #category : 'accessing' }
CMNorm >> name [
	"The default rule name is the class name. Override it to have a custom name"

	^ self class name
]
