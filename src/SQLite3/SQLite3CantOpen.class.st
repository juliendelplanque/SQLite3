"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_CANTOPEN result code indicates that SQLite was unable to open a file. The file in question might be a primary database file or one of several temporary disk files.
"
Class {
	#name : #SQLite3Cantopen,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3Cantopen class >> errorCode [
	^ SQLITE_CANTOPEN
]
