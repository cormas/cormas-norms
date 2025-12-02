Extension { #name : 'CMSimulationPresenter' }

{ #category : '*Cormas-Norms-UI' }
CMSimulationPresenter >> settingsNorms [

	<fancyNotebookPageOrder: 30>

	| rulesApplier |
	rulesApplier := CMRulesApplier new
		rules: modelClass new modelRules;
		yourself.

	whenWindowsIsClosedHooks add: [ rulesApplier unapplyRules ].

	^ SpNotebookPage
		  title: 'Model Norms'
		  icon: (self iconNamed: #history)
		  provider: [ CMNormsPresenter on: rulesApplier ]
]
