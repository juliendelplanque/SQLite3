"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_IOERR_SHMMAP error code is an extended error code for SQLITE_IOERR indicating an I/O error within the xShmMap method on the sqlite3_io_methods object while trying to map a shared memory segment into the process address space.
"
Class {
	#name : #SQLite3IoerrShmmap,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3IoerrShmmap class >> errorCode [
	^ SQLITE_IOERR_SHMMAP
]
