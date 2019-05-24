"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_CONSTRAINT_CHECK error code is an extended error code for SQLITE_CONSTRAINT indicating that a CHECK constraint failed.
"
Class {
	#name : #SQLite3ConstraintCheck,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3ConstraintCheck class >> errorCode [
	^ SQLITE_CONSTRAINT_CHECK
]
