Extension { #name : #String }

{ #category : #'*SQLite3' }
String >> sqlite3BeArgumentForExecutionOf: aSQLString by: aSQLite3Cursor [
	SQLite3GenericError signal: 'Unable to execute SQL on instance of String.'
]

{ #category : #'*SQLite3' }
String >> sqlite3PutYourselfAtIndex: index inStatement: aStatement [
	^ aStatement at: index putString: self
]
