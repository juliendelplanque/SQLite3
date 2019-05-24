Extension { #name : #ByteArray }

{ #category : #'*SQLite3' }
ByteArray >> sqlite3PutYourselfAtIndex: index inStatement: aStatement [
	^ aStatement at: index putByteArray:  self
]
