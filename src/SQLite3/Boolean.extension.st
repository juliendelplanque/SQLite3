Extension { #name : #Boolean }

{ #category : #'*SQLite3' }
Boolean >> sqlite3PutYourselfAtIndex: index inStatement: aStatement [
	^ aStatement at: index putBoolean: self
]
