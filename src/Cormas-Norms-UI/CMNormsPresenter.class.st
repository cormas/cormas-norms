Class {
	#name : 'CMNormsPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'inspectButtonPresenter',
		'applyButtonPresenter',
		'normsListPresenter',
		'normsApplier'
	],
	#category : 'Cormas-Norms-UI',
	#package : 'Cormas-Norms-UI'
}

{ #category : 'examples' }
CMNormsPresenter class >> examplePresenter [
	"self examplePresenter"

	| rulesApplier presenter |
		
	rulesApplier := CMNormsApplier onNorms: { 
			CMCanEatFruitMockNorm new .
			CMCannotEatFruitMockNorm new }.
	
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

	inspectButtonPresenter action: [ normsApplier inspect ].
	self refreshApplyButton.
	self populateNormsUI
]

{ #category : 'layout' }
CMNormsPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: (SpBoxLayout newTopToBottom
				   spacing: 5;
				   add: 'Model norms' expand: false;
				   add: normsListPresenter;
				   yourself);
		  add: inspectButtonPresenter expand: false;
		  add: applyButtonPresenter expand: false;
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
	normsListPresenter := self newTable
		hideColumnHeaders;
		addColumn: checkboxColumn;
		addColumn: (SpStringTableColumn evaluated: #name);
		yourself
]

{ #category : 'initialization' }
CMNormsPresenter >> populateNormsUI [

	normsApplier norms
		ifEmpty: [
			normsListPresenter := self newText
				text: 'No Norms for this model.';
				beNotEditable;
				yourself.
			applyButtonPresenter disable.
			inspectButtonPresenter disable ]
		ifNotEmpty: [ normsListPresenter items: normsApplier norms ]. 
]

{ #category : 'actions' }
CMNormsPresenter >> refreshApplyButton [

	normsApplier areNormsApplied
		ifTrue: [ self setUnapplyModeForApplyButton ]
		ifFalse: [ self setApplyModeForApplyButton ]
]

{ #category : 'actions' }
CMNormsPresenter >> setApplyModeForApplyButton [

	applyButtonPresenter
		label: 'Apply norms';
		icon: (self iconNamed: #accept);
		action: [
				normsApplier applyNorms.
				self refreshApplyButton ]
]

{ #category : 'accessing - model' }
CMNormsPresenter >> setModelBeforeInitialization: aNormsApplier [

	normsApplier := aNormsApplier
]

{ #category : 'actions' }
CMNormsPresenter >> setUnapplyModeForApplyButton [

	applyButtonPresenter
		label: 'Unapply norms';
		icon: (self iconNamed: #cancel);
		action: [
				normsApplier unapplyNorms.
				self refreshApplyButton ]
]
