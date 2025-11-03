Class {
	#name : 'CMEphemeron',
	#superclass : 'Association',
	#type : 'ephemeron',
	#category : 'Cormas-Norms',
	#package : 'Cormas-Norms'
}

{ #category : 'finalization' }
CMEphemeron >> mourn [

	key ifNil: [ ^ self ].
	key deactivateRules.
	'deactivateRules' traceCr.
	key := nil
]
