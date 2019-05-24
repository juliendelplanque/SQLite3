"
I represent the SQLITE_LOCKED condition.
"
Class {
	#name : #SQLite3Locked,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3Locked class >> errorCode [
	^ LOCKED
]
