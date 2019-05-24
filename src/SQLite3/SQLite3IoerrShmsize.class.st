"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_IOERR_SHMSIZE error code is an extended error code for SQLITE_IOERR indicating an I/O error within the xShmMap method on the sqlite3_io_methods object while trying to enlarge a ""shm"" file as part of WAL mode transaction processing. This error may indicate that the underlying filesystem volume is out of space.
"
Class {
	#name : #SQLite3IoerrShmsize,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3IoerrShmsize class >> errorCode [
	^ SQLITE_IOERR_SHMSIZE
]
