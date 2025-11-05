Class {
	#name : 'CMRulesApplier',
	#superclass : 'Object',
	#instVars : [
		'rules',
		'methodProxies',
		'areRulesActive'
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
CMRulesApplier >> activateRules [

	rules do: #activate.
	areRulesActive := true
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
	MpMethodProxy enableInstrumentation.
	
	self activateRules
]

{ #category : 'api' }
CMRulesApplier >> areRulesActive [

	^ areRulesActive
]

{ #category : 'api' }
CMRulesApplier >> deactivateRules [

	rules do: #deactivate.
	areRulesActive := false
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

{ #category : 'api' }
CMRulesApplier >> unapplyRules [

	methodProxies do: #uninstall.
	MpMethodProxy disableInstrumentation.

	self deactivateRules
]
