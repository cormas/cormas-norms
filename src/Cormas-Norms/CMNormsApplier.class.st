Class {
	#name : 'CMNormsApplier',
	#superclass : 'Object',
	#instVars : [
		'methodProxies',
		'norms',
		'areNormsApplied'
	],
	#category : 'Cormas-Norms',
	#package : 'Cormas-Norms'
}

{ #category : 'instance creation' }
CMNormsApplier class >> onNorms: aSetOfRules [

	^ self new
		  norms: aSetOfRules;
		  yourself
]

{ #category : 'api' }
CMNormsApplier >> activateNorms [

	norms do: #activate
]

{ #category : 'api' }
CMNormsApplier >> applyNorms [

	| activeNormsByMethodToInstrument |
	areNormsApplied ifTrue: [ self unapplyNorms ].
	activeNormsByMethodToInstrument := (norms select: [:norm| norm isActive])
		groupedBy: [ :norm | norm methodToInstrument ].
	activeNormsByMethodToInstrument keysAndValuesDo: [ :compiledMethod :cmNorms | methodProxies 
			at: compiledMethod 
			put: (MpMethodProxy onMethod: compiledMethod handler: (CMMpNormHandler onNorms: cmNorms ))
	].
	methodProxies do: #install.
	MpMethodProxy enableInstrumentation.
	areNormsApplied := true
]

{ #category : 'api' }
CMNormsApplier >> areNormsActive [

	^ self error: 'Should not be used'
]

{ #category : 'api' }
CMNormsApplier >> areNormsApplied [

	^ areNormsApplied
]

{ #category : 'api' }
CMNormsApplier >> deactivateNorms [

	norms do: #deactivate
]

{ #category : 'initialization' }
CMNormsApplier >> initialize [

	super initialize.
	methodProxies := Dictionary new.
	norms := {  }.
	areNormsApplied := false
]

{ #category : 'accessing' }
CMNormsApplier >> norms [
	^ norms
]

{ #category : 'accessing' }
CMNormsApplier >> norms: aCollection [
	norms := aCollection
]

{ #category : 'api' }
CMNormsApplier >> unapplyNorms [

	methodProxies do: #uninstall.
	methodProxies removeAll.
	MpMethodProxy disableInstrumentation.

	areNormsApplied := false
]

{ #category : 'api' }
CMNormsApplier >> updateAppliedNorms [

	areNormsApplied ifTrue: [ self applyNorms ]
]
