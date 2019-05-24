"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_IOERR_CHECKRESERVEDLOCK error code is an extended error code for SQLITE_IOERR indicating an I/O error within the xCheckReservedLock method on the sqlite3_io_methods object.
"
Class {
	#name : #SQLite3IoerrCheckreservedlock,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3IoerrCheckreservedlock class >> errorCode [
	^ SQLITE_IOERR_CHECKRESERVEDLOCK
]
