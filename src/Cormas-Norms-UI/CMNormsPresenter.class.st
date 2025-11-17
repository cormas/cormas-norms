Class {
	#name : 'CMNormsPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'rulesApplier',
		'rulesListPresenter',
		'inspectButton'
	],
	#category : 'Cormas-Norms-UI',
	#package : 'Cormas-Norms-UI'
}

{ #category : 'examples' }
CMNormsPresenter class >> example [

	self examplePresenter open
]

{ #category : 'examples' }
CMNormsPresenter class >> examplePresenter [
	
	| rulesApplier |
		
	rulesApplier := CMRulesApplier new.
	
	rulesApplier rules: { 
		CMCanEatFruitMockRule new .
		CMCannotEatFruitMockRule new }.
	
	^ self on: rulesApplier
]

{ #category : 'instance creation' }
CMNormsPresenter class >> new [

	^ self error:
		  'Do not use new. You need to pass the rulesApplier as a model. Use the method on: instead'
]

{ #category : 'initialization' }
CMNormsPresenter >> connectPresenters [

	rulesListPresenter items: rulesApplier rules.
	inspectButton action: [ rulesApplier inspect ].
]

{ #category : 'layout' }
CMNormsPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		add: rulesListPresenter;
		add: inspectButton expand: false;
		yourself
]

{ #category : 'examples' }
CMNormsPresenter >> example [
	<script: 'self example'>
]

{ #category : 'initialization' }
CMNormsPresenter >> initializePresenters [

	| checkboxColumn |
	
	checkboxColumn := (SpCheckBoxTableColumn evaluated: #isActive)
		onActivation: #activate;
		onDeactivation: #deactivate;
		beNotExpandable;
		yourself.

	rulesListPresenter := self newTable
		hideColumnHeaders;
		addColumn: checkboxColumn;
		addColumn: (SpStringTableColumn evaluated: #name);
		yourself.
		
	inspectButton := self newButton
		label: 'Inspect it';
		icon: (self iconNamed: #smallInspectIt);
		yourself
]

{ #category : 'accessing - model' }
CMNormsPresenter >> setModelBeforeInitialization: aRulesApplier [

	rulesApplier := aRulesApplier
]
