"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_CANTOPEN_FULLPATH error code is an extended error code for SQLITE_CANTOPEN indicating that a file open operation failed because the operating system was unable to convert the filename into a full pathname.
"
Class {
	#name : #SQLite3CantopenFullpath,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3CantopenFullpath class >> errorCode [
	^ SQLITE_CANTOPEN_FULLPATH
]
