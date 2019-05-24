"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_IOERR_ACCESS error code is an extended error code for SQLITE_IOERR indicating an I/O error within the xAccess method on the sqlite3_vfs object.
"
Class {
	#name : #SQLite3IoerrAccess,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3IoerrAccess class >> errorCode [
	^ SQLITE_IOERR_ACCESS
]
