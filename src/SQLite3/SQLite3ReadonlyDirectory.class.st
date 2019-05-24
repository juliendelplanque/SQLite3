"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_READONLY_DIRECTORY result code indicates that the database is read-only because process does not have permission to create a journal file in the same directory as the database and the creation of a journal file is a prerequisite for writing.
"
Class {
	#name : #SQLite3ReadonlyDirectory,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3ReadonlyDirectory class >> errorCode [
	^ SQLITE_READONLY_DIRECTORY
]
