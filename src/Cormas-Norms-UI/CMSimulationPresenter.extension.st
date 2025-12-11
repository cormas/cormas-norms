Extension { #name : 'CMSimulationPresenter' }

{ #category : '*Cormas-Norms-UI' }
CMSimulationPresenter >> settingsNorms [

	<fancyNotebookPageOrder: 30>

	| normsApplier normsInTheModel |
	normsInTheModel := modelClass package definedClasses
		select: [ :class | class inheritsFrom: CMNorm ]
		thenCollect: [ :class | class new ].
	normsInTheModel := normsInTheModel asOrderedCollection.
	normsApplier := CMNormsApplier onNorms: normsInTheModel.

	whenWindowIsClosedHooks add: [ normsApplier unapplyNorms ].
	^ SpNotebookPage
		  title: 'Model Norms'
		  icon: (self iconNamed: #history)
		  provider: [ CMNormsPresenter on: normsApplier ]
]
