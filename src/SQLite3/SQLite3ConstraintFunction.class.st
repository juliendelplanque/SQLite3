"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_CONSTRAINT_FUNCTION error code is not currently used by the SQLite core. However, this error code is available for use by extension functions.
"
Class {
	#name : #SQLite3ConstraintFunction,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3ConstraintFunction class >> errorCode [
	^ SQLITE_CONSTRAINT_FUNCTION
]
