"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_CANTOPEN_ISDIR error code is an extended error code for SQLITE_CANTOPEN indicating that a file open operation failed because the file is really a directory.
"
Class {
	#name : #SQLite3CantopenIsdir,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3CantopenIsdir class >> errorCode [
	^ SQLITE_CANTOPEN_ISDIR
]
