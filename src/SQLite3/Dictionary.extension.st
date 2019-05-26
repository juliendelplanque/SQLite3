Extension { #name : #Dictionary }

{ #category : #'*SQLite3' }
Dictionary >> sqlite3BeArgumentForExecutionOf: aSQLString by: aSQLite3Cursor [
	aSQLite3Cursor execute: aSQLString withKeysAndValues: self
]
