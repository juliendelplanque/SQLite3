Class {
	#name : #SQLite3Constraint,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3Constraint class >> errorCode [
	^ SQLITE_CONSTRAINT
]
