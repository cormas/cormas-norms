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
			package: 'Cormas-UI' with: [ spec requires: #( 'Cormas-Norms' ) ];
			package: 'Cormas-Norms-Tests' with: [ spec requires: #( 'Cormas-Norms' ) ].

		"External dependencies"
		spec baseline: 'MethodProxies' with: [ spec repository: 'github://pharo-contributions/MethodProxies' ].
		spec package: 'Cormas-Norms' with: [ spec requires: #( 'MethodProxies' ) ].

		"Groups"
		spec group: 'default' with: #( 'core' 'tests' ).
		spec group: 'core' with: #( 'Cormas-Norms' 'Cormas-UI' ).
		spec group: 'tests' with: #( 'Cormas-Norms-Tests' ) ]
]
