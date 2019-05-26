Extension { #name : #SequenceableCollection }

{ #category : #'*SQLite3' }
SequenceableCollection >> sqlite3BeArgumentForExecutionOf: aSQLString by: aSQLite3Cursor [
	aSQLite3Cursor execute: aSQLString withCollection: self
]
