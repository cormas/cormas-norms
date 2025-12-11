Class {
	#name : 'CMEphemeron',
	#superclass : 'Association',
	#type : 'ephemeron',
	#category : 'Cormas-Norms',
	#package : 'Cormas-Norms'
}

{ #category : 'finalization' }
CMEphemeron >> mourn [

	'deactivateRules' traceCr.

	key ifNil: [ ^ self ].
	key unapplyNorms.
	key := nil
]
