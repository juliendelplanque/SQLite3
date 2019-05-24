"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_IOERR_TRUNCATE error code is an extended error code for SQLITE_IOERR indicating an I/O error in the VFS layer while trying to truncate a file to a smaller size.
"
Class {
	#name : #SQLite3IoerrTruncate,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3IoerrTruncate class >> errorCode [
	^ SQLITE_IOERR_TRUNCATE
]
