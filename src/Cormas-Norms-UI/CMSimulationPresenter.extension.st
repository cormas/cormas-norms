Extension { #name : 'CMSimulationPresenter' }

{ #category : '*Cormas-Norms-UI' }
CMSimulationPresenter >> settingsPresenter [

	<fancyNotebookPageOrder: 30>
			
	| rulesApplier |
	rulesApplier := CMRulesApplier new
		rules: { 
			CMCanEatFruitMockRule new.
			CMCannotEatFruitMockRule new };
		yourself.
	
	^ SpNotebookPage
		  title: 'Model Norms'
		  icon: (self iconNamed: #history)
		  provider: [ CMNormsPresenter on: rulesApplier ]
]
