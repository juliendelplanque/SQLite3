Extension { #name : #Integer }

{ #category : #'*SQLite3' }
Integer >> sqlite3PutYourselfAtIndex: index inStatement: aStatement [
	^ aStatement at: index putInteger: self
]
