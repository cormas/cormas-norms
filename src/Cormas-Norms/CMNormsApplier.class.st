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

	| normsByMethodToInstrument |
	norms := aCollection.
	
	normsByMethodToInstrument := norms groupedBy: [ :norm | norm methodToInstrument ].
	normsByMethodToInstrument keysAndValuesDo: [ :compiledMethod :cmNorms |
		methodProxies
			at: compiledMethod
			put: (MpMethodProxy onMethod: compiledMethod handler: (CMMpNormHandler onNorms: cmNorms)) ].

]

{ #category : 'api' }
CMNormsApplier >> unapplyNorms [

	methodProxies do: #uninstall.
	MpMethodProxy disableInstrumentation.

	areNormsApplied := false
]
