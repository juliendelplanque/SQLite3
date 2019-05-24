Extension { #name : #UndefinedObject }

{ #category : #'*SQLite3' }
UndefinedObject >> sqlite3PutYourselfAtIndex: index inStatement: aStatement [
	^ aStatement at: index putNil: self
]
