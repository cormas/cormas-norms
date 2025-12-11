Extension { #name : 'CMSimulationPresenter' }

{ #category : '*Cormas-Norms-UI' }
CMSimulationPresenter >> settingsNorms [

	<fancyNotebookPageOrder: 30>

	| rulesApplier |
	rulesApplier := CMNormsApplier onNorms: modelClass new modelNorms.

	whenWindowsIsClosedHooks add: [ rulesApplier unapplyNorms ].

	^ SpNotebookPage
		  title: 'Model Norms'
		  icon: (self iconNamed: #history)
		  provider: [ CMNormsPresenter on: rulesApplier ]
]
