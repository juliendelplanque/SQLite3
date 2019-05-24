"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_IOERR_WRITE error code is an extended error code for SQLITE_IOERR indicating an I/O error in the VFS layer while trying to write into a file on disk. This error might result from a hardware malfunction or because a filesystem came unmounted while the file was open. This error should not occur if the filesystem is full as there is a separate error code (SQLITE_FULL) for that purpose.
"
Class {
	#name : #SQLite3IoerrWrite,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3IoerrWrite class >> errorCode [
	^ SQLITE_IOERR_WRITE
]
