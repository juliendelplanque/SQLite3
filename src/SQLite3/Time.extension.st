Extension { #name : #Time }

{ #category : #'*SQLite3' }
Time >> sqlite3PutYourselfAtIndex: index inStatement: aStatement [
	^ aStatement at: index putDateTime: self
]
