"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_ERROR_RETRY is used internally to provoke sqlite3_prepare_v2() (or one of its sibling routines for creating prepared statements) to try again to prepare a statement that failed with an error on the previous attempt.
"
Class {
	#name : #SQLite3ErrorRetry,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3ErrorRetry class >> errorCode [
	^ SQLITE_ERROR_RETRY
]
