"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_CONSTRAINT_NOTNULL error code is an extended error code for SQLITE_CONSTRAINT indicating that a NOT NULL constraint failed.
"
Class {
	#name : #SQLite3ConstraintNotnull,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3ConstraintNotnull class >> errorCode [
	^ SQLITE_CONSTRAINT_NOTNULL
]
