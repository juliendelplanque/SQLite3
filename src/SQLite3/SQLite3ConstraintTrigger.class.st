"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_CONSTRAINT_TRIGGER error code is an extended error code for SQLITE_CONSTRAINT indicating that a RAISE function within a trigger fired, causing the SQL statement to abort.
"
Class {
	#name : #SQLite3ConstraintTrigger,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3ConstraintTrigger class >> errorCode [
	^ SQLITE_CONSTRAINT_TRIGGER
]
