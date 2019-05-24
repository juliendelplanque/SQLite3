Extension { #name : #Date }

{ #category : #'*SQLite3' }
Date >> sqlite3PutYourselfAtIndex: index inStatement: aStatement [
	^ aStatement at: index putDateTime: self
]
