"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_CONSTRAINT_UNIQUE error code is an extended error code for SQLITE_CONSTRAINT indicating that a UNIQUE constraint failed.
"
Class {
	#name : #SQLite3ConstraintUnique,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3ConstraintUnique class >> errorCode [
	^ SQLITE_CONSTRAINT_UNIQUE
]
