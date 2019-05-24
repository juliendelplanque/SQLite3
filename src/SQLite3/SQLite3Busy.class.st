"
I represent the SQLITE_BUSY condition.
"
Class {
	#name : #SQLite3Busy,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3Busy class >> errorCode [
	^ BUSY
]
