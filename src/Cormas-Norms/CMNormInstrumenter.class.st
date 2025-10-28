Class {
	#name : 'CMNormInstrumenter',
	#superclass : 'Object',
	#instVars : [
		'methodProxies',
		'norm'
	],
	#category : 'Cormas-Norms',
	#package : 'Cormas-Norms'
}

{ #category : 'as yet unclassified' }
CMNormInstrumenter class >> new [

	^ self error: 'Do not use new. Use onNorm: instead.'
]

{ #category : 'as yet unclassified' }
CMNormInstrumenter class >> onNorm: aNorm [

	^ super new
		  norm: aNorm;
		  yourself
]

{ #category : 'initialization' }
CMNormInstrumenter >> initialize [

	super initialize.
	methodProxies := Dictionary new
]

{ #category : 'as yet unclassified' }
CMNormInstrumenter >> instrumentMethods: anArrayOfCompiledMethods [

	anArrayOfCompiledMethods do: [ :aMethod |
		methodProxies
			at: aMethod
			put: (MpMethodProxy onMethod: aMethod handler: (CMMpHandler onNorm: norm)) ].

	methodProxies do: #install.
	MpMethodProxy enableInstrumentation
]

{ #category : 'accessing' }
CMNormInstrumenter >> norm: aCMNorm [

	norm := aCMNorm
]

{ #category : 'as yet unclassified' }
CMNormInstrumenter >> uninstrument [

	methodProxies do: #uninstall.
	MpMethodProxy disableInstrumentation
]
