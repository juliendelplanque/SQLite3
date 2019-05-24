"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_NOMEM result code indicates that SQLite was unable to allocate all the memory it needed to complete the operation. In other words, an internal call to sqlite3_malloc() or sqlite3_realloc() has failed in a case where the memory being allocated was required in order to continue the operation.
"
Class {
	#name : #SQLite3Nomem,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3Nomem class >> errorCode [
	^ SQLITE_NOMEM
]
