Extension { #name : #SQLite3CLibraryError }

{ #category : #'*SQLite3-Deprecated' }
SQLite3CLibraryError >> resultCode [
	self
		deprecated: 'Please use #errorCode instead'
		transformWith: '`@receiver resultCode' 
						-> '`@receiver errorCode'.
	^ self errorCode
]

{ #category : #'*SQLite3-Deprecated' }
SQLite3CLibraryError >> resultCode: anObject [
	self error: 'Do not use anymore, the class-side has the responsability to return the right error code.'
]
