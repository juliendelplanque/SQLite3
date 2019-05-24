"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_CONSTRAINT_COMMITHOOK error code is an extended error code for SQLITE_CONSTRAINT indicating that a commit hook callback returned non-zero that thus caused the SQL statement to be rolled back.
"
Class {
	#name : #SQLite3ConstraintCommithook,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3ConstraintCommithook class >> errorCode [
	^ SQLITE_CONSTRAINT_COMMITHOOK
]
