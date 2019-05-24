"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_IOERR_MMAP error code is an extended error code for SQLITE_IOERR indicating an I/O error within the xFetch or xUnfetch methods on the sqlite3_io_methods object while trying to map or unmap part of the database file into the process address space.
"
Class {
	#name : #SQLite3IoerrMmap,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3IoerrMmap class >> errorCode [
	^ SQLITE_IOERR_MMAP
]
