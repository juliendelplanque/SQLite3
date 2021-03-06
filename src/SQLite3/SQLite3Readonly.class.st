"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_READONLY result code is returned when an attempt is made to alter some data for which the current database connection does not have write permission.
"
Class {
	#name : #SQLite3Readonly,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3Readonly class >> errorCode [
	^ SQLITE_READONLY
]
