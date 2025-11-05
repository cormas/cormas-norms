Class {
	#name : 'CMRulesApplier',
	#superclass : 'Object',
	#instVars : [
		'rules',
		'methodProxies',
		'areRulesActive',
		'areRulesApplied'
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
	methodProxies := Dictionary new.
	rulesByMethodToInstrument := rules groupedBy: [ :rule | rule methodToInstrument ].
	rulesByMethodToInstrument keysAndValuesDo: [ :compiledMethod :cmRules |
		methodProxies
			at: compiledMethod
			put: (MpMethodProxy onMethod: compiledMethod handler: (CMMpRuleHandler onRules: cmRules)) ].

	methodProxies do: #install.
	MpMethodProxy enableInstrumentation.
	
	areRulesApplied := true
]

{ #category : 'api' }
CMRulesApplier >> areRulesActive [

	^ areRulesActive
]

{ #category : 'api' }
CMRulesApplier >> areRulesApplied [

	^ areRulesApplied
]

{ #category : 'api' }
CMRulesApplier >> deactivateRules [

	rules do: #deactivate.
	areRulesActive := false
]

{ #category : 'initialization' }
CMRulesApplier >> initialize [

	super initialize.
	areRulesActive := false.
	methodProxies := Dictionary new.
	rules := {  }.
	areRulesApplied := false
]

{ #category : 'accessing' }
CMRulesApplier >> rules: cmRules [

	rules := cmRules
]

{ #category : 'api' }
CMRulesApplier >> unapplyRules [

	methodProxies do: #uninstall.
	MpMethodProxy disableInstrumentation.

	areRulesApplied := false
]
