Extension { #name : #SQLite3Library }

{ #category : #'*SQLite3-Deprecated' }
SQLite3Library class >> current [
	self
		deprecated: 'Please use #uniqueInstance instead'
		transformWith: '`@receiver current' -> '`@receiver uniqueInstance'.
	^ self uniqueInstance
]
