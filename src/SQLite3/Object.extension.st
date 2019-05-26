Extension { #name : #Object }

{ #category : #'*SQLite3' }
Object >> sqlite3BeArgumentForExecutionOf: aSQLString by: aSQLite3Cursor [
	SQLite3GenericError signal: 'Unable to execute SQL on instance of ' , self className , '.'
]

{ #category : #'*SQLite3' }
Object >> sqlite3PutYourselfAtIndex: index inStatement: aStatement [
	^ aStatement at: index putObject: self
]
