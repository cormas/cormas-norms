Class {
	#name : 'CMAbstractNormsTest',
	#superclass : 'TestCase',
	#instVars : [
		'rulesApplier'
	],
	#category : 'Cormas-Norms-Tests',
	#package : 'Cormas-Norms-Tests'
}

{ #category : 'testing' }
CMAbstractNormsTest class >> isAbstract [

	^ self = CMAbstractNormsTest
]

{ #category : 'running' }
CMAbstractNormsTest >> tearDown [

	rulesApplier unapplyNorms.

	super tearDown
]
