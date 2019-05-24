Extension { #name : #Float }

{ #category : #'*SQLite3' }
Float >> sqlite3PutYourselfAtIndex: index inStatement: aStatement [
	^ aStatement at: index putFloat: self
]
