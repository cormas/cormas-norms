Class {
	#name : 'CMRulesApplier',
	#superclass : 'Object',
	#instVars : [
		'rules',
		'methodProxies',
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

	rules do: #activate
]

{ #category : 'api' }
CMRulesApplier >> applyRules [

	methodProxies do: #install.
	MpMethodProxy enableInstrumentation.

	areRulesApplied := true
]

{ #category : 'api' }
CMRulesApplier >> areRulesActive [

	^ self error: 'Should not be used'
]

{ #category : 'api' }
CMRulesApplier >> areRulesApplied [

	self flag:
		'Think of a better way of knowing if the rules are applied. '.
	^ areRulesApplied
]

{ #category : 'api' }
CMRulesApplier >> deactivateRules [

	rules do: #deactivate
]

{ #category : 'initialization' }
CMRulesApplier >> initialize [

	super initialize.
	methodProxies := Dictionary new.
	rules := {  }.
	areRulesApplied := false
]

{ #category : 'accessing' }
CMRulesApplier >> rules [
	^ rules
]

{ #category : 'accessing' }
CMRulesApplier >> rules: aCollection [

	| rulesByMethodToInstrument |
	rules := aCollection.
	
	rulesByMethodToInstrument := rules groupedBy: [ :rule | rule methodToInstrument ].
	rulesByMethodToInstrument keysAndValuesDo: [ :compiledMethod :cmRules |
		methodProxies
			at: compiledMethod
			put: (MpMethodProxy onMethod: compiledMethod handler: (CMMpRuleHandler onRules: cmRules)) ].

]

{ #category : 'api' }
CMRulesApplier >> unapplyRules [

	methodProxies do: #uninstall.
	MpMethodProxy disableInstrumentation.

	areRulesApplied := false
]
