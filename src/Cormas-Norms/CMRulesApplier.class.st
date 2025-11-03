Class {
	#name : 'CMRulesApplier',
	#superclass : 'Object',
	#instVars : [
		'rules',
		'methodProxies'
	],
	#category : 'Cormas-Norms',
	#package : 'Cormas-Norms'
}

{ #category : 'instance creation' }
CMRulesApplier class >> rules: aSetOfRules [

	^ self new
		  rules: aSetOfRules;
		  yourself
]

{ #category : 'api' }
CMRulesApplier >> applyRules [

	| rulesByMethodToInstrument |
	rulesByMethodToInstrument := rules groupedBy: [ :rule | rule methodToInstrument ].
	rulesByMethodToInstrument keysAndValuesDo: [ :compiledMethod :cmRules |
		methodProxies
			at: compiledMethod
			put: (MpMethodProxy onMethod: compiledMethod handler: (CMMpRuleHandler onRules: cmRules)) ].

	methodProxies do: #install.
	MpMethodProxy enableInstrumentation
]

{ #category : 'api' }
CMRulesApplier >> deactivateRules [

	methodProxies do: #uninstall.
	MpMethodProxy disableInstrumentation
]

{ #category : 'initialization' }
CMRulesApplier >> initialize [

	super initialize.
	methodProxies := Dictionary new
]

{ #category : 'accessing' }
CMRulesApplier >> rules: cmRules [

	rules := cmRules
]
