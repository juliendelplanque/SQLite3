"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_PERM result code indicates that the requested access mode for a newly created database could not be provided.
"
Class {
	#name : #SQLite3Perm,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3Perm class >> errorCode [
	^ SQLITE_PERM
]
