Extension { #name : #Fraction }

{ #category : #'*SQLite3' }
Fraction >> sqlite3PutYourselfAtIndex: index inStatement: aStatement [
	^ aStatement at: index putFloat: self
]
