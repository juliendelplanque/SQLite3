"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_ABORT_ROLLBACK error code is an extended error code for SQLITE_ABORT indicating that an SQL statement aborted because the transaction that was active when the SQL statement first started was rolled back. Pending write operations always fail with this error when a rollback occurs. A ROLLBACK will cause a pending read operation to fail only if the schema was changed within the transaction being rolled back.
"
Class {
	#name : #SQLite3AbortRollback,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3AbortRollback class >> errorCode [
	^ SQLITE_ABORT_ROLLBACK
]
