"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_CORRUPT_VTAB error code is an extended error code for SQLITE_CORRUPT used by virtual tables. A virtual table might return SQLITE_CORRUPT_VTAB to indicate that content in the virtual table is corrupt.
"
Class {
	#name : #SQLite3CorruptVtab,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3CorruptVtab class >> errorCode [
	^ SQLITE_CORRUPT_VTAB
]
