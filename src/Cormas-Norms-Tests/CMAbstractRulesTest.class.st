Class {
	#name : 'CMAbstractRulesTest',
	#superclass : 'TestCase',
	#instVars : [
		'rulesApplier'
	],
	#category : 'Cormas-Norms-Tests',
	#package : 'Cormas-Norms-Tests'
}

{ #category : 'testing' }
CMAbstractRulesTest class >> isAbstract [

	^ self = CMAbstractRulesTest
]

{ #category : 'running' }
CMAbstractRulesTest >> tearDown [

	rulesApplier unapplyRules.

	super tearDown
]
