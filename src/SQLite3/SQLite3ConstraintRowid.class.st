"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_CONSTRAINT_ROWID error code is an extended error code for SQLITE_CONSTRAINT indicating that a rowid is not unique.
"
Class {
	#name : #SQLite3ConstraintRowid,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3ConstraintRowid class >> errorCode [
	^ SQLITE_CONSTRAINT_ROWID
]
