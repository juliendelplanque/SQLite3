Extension { #name : #SQLite3Library }

{ #category : #'*SQLite3-Deprecated' }
SQLite3Library class >> current [
	self
		deprecated: 'Please use #uniqueInstance instead'
		transformWith: '`@receiver current' -> '`@receiver uniqueInstance'.
	^ self uniqueInstance
]

{ #category : #'*SQLite3-Deprecated' }
SQLite3Library >> signal: exceptionClass with: value on: handle [
	self
		deprecated: 'Please use #signal:on: instead'
		transformWith: '`@receiver signal: `@statements1 with: `@statements2 on: `@statements3' 
						-> '`@receiver signal: `@statements1 on: `@statements3'.
		
	self signal: exceptionClass on: handle
]
