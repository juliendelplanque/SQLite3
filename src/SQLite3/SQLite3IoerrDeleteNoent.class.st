"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_IOERR_DELETE_NOENT error code is an extended error code for SQLITE_IOERR indicating that the xDelete method on the sqlite3_vfs object failed because the file being deleted does not exist.
"
Class {
	#name : #SQLite3IoerrDeleteNoent,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3IoerrDeleteNoent class >> errorCode [
	^ SQLITE_IOERR_DELETE_NOENT
]
