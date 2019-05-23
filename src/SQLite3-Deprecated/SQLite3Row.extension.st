Extension { #name : #SQLite3Row }

{ #category : #'*SQLite3-Deprecated' }
SQLite3Row >> at: aKey [
	self
		deprecated: 'Please use #atColumnNamed: instead'
		transformWith: '`@receiver at: `@statements' 
						-> '`@receiver atColumnNamed: `@statements'.
	^ self atColumnNamed: aKey
]

{ #category : #'*SQLite3-Deprecated' }
SQLite3Row >> at: aKey ifAbsent: aBlock [
	self
		deprecated: 'Please use #atColumnNamed:ifAbsent: instead'
		transformWith: '`@receiver at: `@statements1 ifAbsent: `@statements2' 
						-> '`@receiver atColumnNamed: `@statements1 ifAbsent: `@statements2'.
	^ self atColumnNamed: aKey ifAbsent: aBlock
]

{ #category : #'*SQLite3-Deprecated' }
SQLite3Row >> at: aKey put: anObject [
	self
		deprecated: 'Please use #atColumnNamed:put instead'
		transformWith: '`@receiver at: `@statements1 put: `@statements2' 
						-> '`@receiver atColumnNamed: `@statements1 put: `@statements2'.
	^ self atColumnNamed: aKey put: anObject
]

{ #category : #'*SQLite3-Deprecated' }
SQLite3Row >> atName: aKey [ 
	self
		deprecated: 'Please use #atColumnNamed: instead'
		transformWith: '`@receiver atName: `@statements' 
						-> '`@receiver atColumnNamed: `@statements'.
	^ self atColumnNamed: aKey
]

{ #category : #'*SQLite3-Deprecated' }
SQLite3Row >> atName: aKey put: anObject [
	self
		deprecated: 'Please use #atColumnNamed:put instead'
		transformWith: '`@receiver atName: `@statements1 put: `@statements2' 
						-> '`@receiver atColumnNamed: `@statements1 put: `@statements2'.
	^ self atColumnNamed: aKey put: anObject
]
