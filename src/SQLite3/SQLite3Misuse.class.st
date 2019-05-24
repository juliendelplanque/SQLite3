"
I represent the SQLITE_MISUSE condition.

"
Class {
	#name : #SQLite3Misuse,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3Misuse class >> errorCode [
	^ MISUSE
]
