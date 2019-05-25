Extension { #name : #Integer }

{ #category : #'*SQLite3' }
Integer >> asSQLite3ErrorClass [
	^ SQLite3CLibraryError subclassForErrorCode: self
]

{ #category : #'*SQLite3' }
Integer >> asSQLite3ErrorWithMessage: aString [
	^ SQLite3CLibraryError forErrorCode: self apiErrorMessage: aString
]

{ #category : #'*SQLite3' }
Integer >> asSQLite3Result [
	^ SQLite3Result forResultCode: self
]

{ #category : #'*SQLite3' }
Integer >> asSQLite3ResultIfNoneMatch: aBlock [
	^ [ 
		SQLite3Result forResultCode: self
	] on: NotFound do: aBlock
]

{ #category : #'*SQLite3' }
Integer >> sqlite3PutYourselfAtIndex: index inStatement: aStatement [
	^ aStatement at: index putInteger: self
]
