Extension { #name : #Object }

{ #category : #'*SQLite3' }
Object >> sqlite3PutYourselfAtIndex: index inStatement: aStatement [
	^ aStatement at: index putObject: self
]
