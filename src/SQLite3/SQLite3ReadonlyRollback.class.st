"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_READONLY_ROLLBACK error code is an extended error code for SQLITE_READONLY. The SQLITE_READONLY_ROLLBACK error code indicates that a database cannot be opened because it has a hot journal that needs to be rolled back but cannot because the database is readonly.
"
Class {
	#name : #SQLite3ReadonlyRollback,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3ReadonlyRollback class >> errorCode [
	^ SQLITE_READONLY_ROLLBACK
]
