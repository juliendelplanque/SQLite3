"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

When attempting to open a file, the SQLITE_NOTADB error indicates that the file being opened does not appear to be an SQLite database file.
"
Class {
	#name : #SQLite3Notadb,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3Notadb class >> errorCode [
	^ SQLITE_NOTADB
]
