"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_CORRUPT result code indicates that the database file has been corrupted. See the How To Corrupt Your Database Files for further discussion on how corruption can occur.
"
Class {
	#name : #SQLite3Corrupt,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3Corrupt class >> errorCode [
	^ SQLITE_CORRUPT
]
