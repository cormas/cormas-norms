Class {
	#name : 'BaselineOfCormasNorms',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfCormasNorms',
	#package : 'BaselineOfCormasNorms'
}

{ #category : 'baselines' }
BaselineOfCormasNorms >> baseline: spec [
	<baseline>
	
	spec for: #common do: [
		"Packages"
		spec
			package: 'Cormas-Norms';
			package: 'Cormas-Norms-Tests' with: [ spec requires: #('Cormas-Norms') ] ]
]
