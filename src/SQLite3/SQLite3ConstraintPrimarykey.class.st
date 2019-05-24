"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_CONSTRAINT_PRIMARYKEY error code is an extended error code for SQLITE_CONSTRAINT indicating that a PRIMARY KEY constraint failed.
"
Class {
	#name : #SQLite3ConstraintPrimarykey,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3ConstraintPrimarykey class >> errorCode [
	^ SQLITE_CONSTRAINT_PRIMARYKEY
]
