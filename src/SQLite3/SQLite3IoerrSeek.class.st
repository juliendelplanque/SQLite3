"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_IOERR_SEEK error code is an extended error code for SQLITE_IOERR indicating an I/O error within the xRead or xWrite methods on the sqlite3_io_methods object while trying to seek a file descriptor to the beginning point of the file where the read or write is to occur.
"
Class {
	#name : #SQLite3IoerrSeek,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3IoerrSeek class >> errorCode [
	^ SQLITE_IOERR_SEEK
]
