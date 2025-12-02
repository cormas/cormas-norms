Class {
	#name : 'CMNormsPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'rulesApplier',
		'rulesListPresenter',
		'inspectButton',
		'applyButton'
	],
	#category : 'Cormas-Norms-UI',
	#package : 'Cormas-Norms-UI'
}

{ #category : 'examples' }
CMNormsPresenter class >> examplePresenter [
	
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

	inspectButton action: [ rulesApplier inspect ].
	self updateApplyButton
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
				   add: inspectButton expand: false;
				   add: SpNullPresenter new expand: true;
				   add: applyButton expand: false;
				   yourself);
		  yourself
]

{ #category : 'layout' }
CMNormsPresenter >> example [

	<script: 'self examplePresenter'>
	
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
		items: rulesApplier rules;
		yourself.

	inspectButton := self newButton
		label: 'Inspect norms';
		icon: (self iconNamed: #smallInspectIt);
		yourself.

	applyButton := self newButton
]

{ #category : 'accessing - model' }
CMNormsPresenter >> setModelBeforeInitialization: aRulesApplier [

	rulesApplier := aRulesApplier
]

{ #category : 'initialization' }
CMNormsPresenter >> updateApplyButton [

	rulesApplier areRulesApplied
		ifTrue: [ self updateApplyButtonForUnapply ]
		ifFalse: [ self updateApplyButtonForApply ]
]

{ #category : 'initialization' }
CMNormsPresenter >> updateApplyButtonForApply [

	applyButton
		label: 'Apply norms';
		icon: (self iconNamed: #accept);
		action: [
				rulesApplier applyRules.
				self updateApplyButton ]
]

{ #category : 'initialization' }
CMNormsPresenter >> updateApplyButtonForUnapply [

	applyButton
		label: 'Unapply norms';
		icon: (self iconNamed: #cancel);
		action: [
				rulesApplier unapplyRules.
				self updateApplyButton ]
]
