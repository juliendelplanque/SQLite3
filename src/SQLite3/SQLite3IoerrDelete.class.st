"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_IOERR_UNLOCK error code is an extended error code for SQLITE_IOERR indicating an I/O error within xDelete method on the sqlite3_vfs object.
"
Class {
	#name : #SQLite3IoerrDelete,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3IoerrDelete class >> errorCode [
	^ SQLITE_IOERR_DELETE
]
