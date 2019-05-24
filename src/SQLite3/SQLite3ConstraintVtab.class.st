"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_CONSTRAINT_VTAB error code is not currently used by the SQLite core. However, this error code is available for use by application-defined virtual tables.
"
Class {
	#name : #SQLite3ConstraintVtab,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3ConstraintVtab class >> errorCode [
	^ SQLITE_CONSTRAINT_VTAB
]
