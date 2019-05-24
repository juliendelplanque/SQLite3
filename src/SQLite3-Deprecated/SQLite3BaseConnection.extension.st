Extension { #name : #SQLite3BaseConnection }

{ #category : #'*SQLite3-Deprecated' }
SQLite3BaseConnection >> signal: exceptionClass with: value [
	self
		deprecated: 'Please use #signal: instead'
		transformWith: '`@receiver signal: `@statements1 with: `@statements2' 
						-> '`@receiver signal: `@statements1'.
	self signal: exceptionClass
]
