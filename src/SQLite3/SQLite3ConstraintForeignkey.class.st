"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_CONSTRAINT_FOREIGNKEY error code is an extended error code for SQLITE_CONSTRAINT indicating that a foreign key constraint failed.
"
Class {
	#name : #SQLite3ConstraintForeignkey,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3ConstraintForeignkey class >> errorCode [
	^ SQLITE_CONSTRAINT_FOREIGNKEY
]
