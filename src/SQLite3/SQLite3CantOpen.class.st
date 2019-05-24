Class {
	#name : #SQLite3CantOpen,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3CantOpen class >> errorCode [
	^ CANTOPEN
]
