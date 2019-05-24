"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_IOERR_SHMOPEN error code is an extended error code for SQLITE_IOERR indicating an I/O error within the xShmMap method on the sqlite3_io_methods object while trying to open a new shared memory segment.
"
Class {
	#name : #SQLite3IoerrShmopen,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3IoerrShmopen class >> errorCode [
	^ SQLITE_IOERR_SHMOPEN
]
