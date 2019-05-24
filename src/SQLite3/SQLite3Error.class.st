Class {
	#name : #SQLite3Error,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3Error class >> errorCode [
	^ SQLITE_ERROR
]
