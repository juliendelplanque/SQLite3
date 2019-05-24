Extension { #name : #DateAndTime }

{ #category : #'*SQLite3' }
DateAndTime >> sqlite3PutYourselfAtIndex: index inStatement: aStatement [
	^ aStatement at: index putDateTime: self
]
