"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_IOERR_UNLOCK error code is an extended error code for SQLITE_IOERR indicating an I/O error within xLock method on the sqlite3_io_methods object while trying to obtain a read lock.
"
Class {
	#name : #SQLite3IoerrRdlock,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3IoerrRdlock class >> errorCode [
	^ SQLITE_IOERR_RDLOCK
]
