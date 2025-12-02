Class {
	#name : 'CMNormsPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'rulesApplier',
		'rulesListPresenter',
		'inspectButtonPresenter',
		'applyButtonPresenter'
	],
	#category : 'Cormas-Norms-UI',
	#package : 'Cormas-Norms-UI'
}

{ #category : 'examples' }
CMNormsPresenter class >> examplePresenter [
	"self examplePresenter"

	| rulesApplier presenter |
		
	rulesApplier := CMRulesApplier new
		rules: { 
			CMCanEatFruitMockRule new .
			CMCannotEatFruitMockRule new };
		yourself.
	
	presenter := self on: rulesApplier.
	presenter open.
	^ presenter
]

{ #category : 'instance creation' }
CMNormsPresenter class >> new [

	self error:
		  'Do not use new. You need to pass the rulesApplier as a model. Use the method on: instead'
]

{ #category : 'initialization' }
CMNormsPresenter >> connectPresenters [

	inspectButtonPresenter action: [ rulesApplier inspect ].
	self refreshApplyButton.
	self populateRulesUI
]

{ #category : 'layout' }
CMNormsPresenter >> defaultLayout [

	^ SpPanedLayout newTopToBottom
		  positionOfSlider: 30 percent;
		  add: (SpBoxLayout newTopToBottom
				   spacing: 5;
				   add: 'Model norms' expand: false;
				   add: rulesListPresenter;
				   yourself);
		  add: (SpBoxLayout newTopToBottom
				   add: SpNullPresenter new expand: true;
				   add: inspectButtonPresenter expand: false;
				   add: applyButtonPresenter expand: false;
				   yourself);
		  yourself
]

{ #category : 'layout' }
CMNormsPresenter >> example [

	<script: 'self examplePresenter'>
	
]

{ #category : 'initialization' }
CMNormsPresenter >> initializePresenters [

	self initializeRulesListPresenter.
	inspectButtonPresenter := self newButton
		label: 'Inspect norms';
		icon: (self iconNamed: #smallInspectIt);
		yourself.
	applyButtonPresenter := self newButton
]

{ #category : 'initialization' }
CMNormsPresenter >> initializeRulesListPresenter [

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
		yourself
]

{ #category : 'initialization' }
CMNormsPresenter >> populateRulesUI [

	rulesApplier rules
		ifEmpty: [
			rulesListPresenter := self newText
				text: 'No Norms for this model.';
				beNotEditable;
				yourself.
			applyButtonPresenter disable.
			inspectButtonPresenter disable ]
		ifNotEmpty: [ rulesListPresenter items: rulesApplier rules ]. 
]

{ #category : 'actions' }
CMNormsPresenter >> refreshApplyButton [

	rulesApplier areRulesApplied
		ifTrue: [ self setUnapplyModeForApplyButton ]
		ifFalse: [ self setApplyModeForApplyButton ]
]

{ #category : 'actions' }
CMNormsPresenter >> setApplyModeForApplyButton [

	applyButtonPresenter
		label: 'Apply norms';
		icon: (self iconNamed: #accept);
		action: [
				rulesApplier applyRules.
				self refreshApplyButton ]
]

{ #category : 'accessing - model' }
CMNormsPresenter >> setModelBeforeInitialization: aRulesApplier [

	rulesApplier := aRulesApplier
]

{ #category : 'actions' }
CMNormsPresenter >> setUnapplyModeForApplyButton [

	applyButtonPresenter
		label: 'Unapply norms';
		icon: (self iconNamed: #cancel);
		action: [
				rulesApplier unapplyRules.
				self refreshApplyButton ]
]
