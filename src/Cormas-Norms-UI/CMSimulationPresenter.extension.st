Extension { #name : 'CMSimulationPresenter' }

{ #category : '*Cormas-Norms-UI' }
CMSimulationPresenter >> settingsNorms [

	<fancyNotebookPageOrder: 30>

	| normsApplier |
	normsApplier := CMNormsApplier onNorms: modelClass new modelNorms.

	whenWindowsIsClosedHooks add: [ normsApplier unapplyNorms ].

	^ SpNotebookPage
		  title: 'Model Norms'
		  icon: (self iconNamed: #history)
		  provider: [ CMNormsPresenter on: normsApplier ]
]
