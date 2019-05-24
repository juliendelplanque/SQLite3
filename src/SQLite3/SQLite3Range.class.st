"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_RANGE error indices that the parameter number argument to one of the sqlite3_bind routines or the column number in one of the sqlite3_column routines is out of range.
"
Class {
	#name : #SQLite3Range,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3Range class >> errorCode [
	^ SQLITE_RANGE
]
