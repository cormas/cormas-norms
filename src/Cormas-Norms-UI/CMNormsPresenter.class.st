Class {
	#name : 'CMNormsPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'model',
		'list'
	],
	#category : 'Cormas-Norms-UI',
	#package : 'Cormas-Norms-UI'
}

{ #category : 'examples' }
CMNormsPresenter class >> example [
	<example>
	self new open
]

{ #category : 'layout' }
CMNormsPresenter >> defaultLayout [

	^ SpBoxLayout newVertical
		add: list;
		yourself
]

{ #category : 'examples' }
CMNormsPresenter >> example [
	<script: 'self example'>
]

{ #category : 'initialization - deprecated' }
CMNormsPresenter >> initializePresenter [

	list := self newList
]
