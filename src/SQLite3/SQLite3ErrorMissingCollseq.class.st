"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_ERROR_MISSING_COLLSEQ result code means that an SQL statement could not be prepared because a collating sequence named in that SQL statement could not be located.

Sometimes when this error code is encountered, the sqlite3_prepare_v2() routine will convert the error into SQLITE_ERROR_RETRY and try again to prepare the SQL statement using a different query plan that does not require the use of the unknown collating sequence.
"
Class {
	#name : #SQLite3ErrorMissingCollseq,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3ErrorMissingCollseq class >> errorCode [
	^ SQLITE_ERROR_MISSING_COLLSEQ
]
