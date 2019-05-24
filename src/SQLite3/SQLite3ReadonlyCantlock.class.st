"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_READONLY_CANTLOCK error code is an extended error code for SQLITE_READONLY. The SQLITE_READONLY_CANTLOCK error code indicates that SQLite is unable to obtain a read lock on a WAL mode database because the shared-memory file associated with that database is read-only.
"
Class {
	#name : #SQLite3ReadonlyCantlock,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3ReadonlyCantlock class >> errorCode [
	^ SQLITE_READONLY_CANTLOCK
]
