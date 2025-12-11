Class {
	#name : 'CMAbstractNormsTest',
	#superclass : 'TestCase',
	#instVars : [
		'rulesApplier',
		'rewardRule',
		'penaltyRule'
	],
	#category : 'Cormas-Norms-Tests',
	#package : 'Cormas-Norms-Tests'
}

{ #category : 'testing' }
CMAbstractNormsTest class >> isAbstract [

	^ self = CMAbstractNormsTest
]

{ #category : 'running' }
CMAbstractNormsTest >> setUp [

	super setUp.
	rewardRule := CMExampleNormCanEatFruit new.
	penaltyRule := CMExampleNormCannotEatFruit new
]

{ #category : 'running' }
CMAbstractNormsTest >> tearDown [

	rulesApplier unapplyNorms.

	super tearDown
]
