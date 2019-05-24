"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_IOERR_READ error code is an extended error code for SQLITE_IOERR indicating an I/O error in the VFS layer while trying to read from a file on disk. This error might result from a hardware malfunction or because a filesystem came unmounted while the file was open.
"
Class {
	#name : #SQLite3IoerrRead,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3IoerrRead class >> errorCode [
	^ SQLITE_IOERR_READ
]
