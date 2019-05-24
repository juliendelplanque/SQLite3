Extension { #name : #String }

{ #category : #'*SQLite3' }
String >> sqlite3PutYourselfAtIndex: index inStatement: aStatement [
	^ aStatement at: index putString: self
]
