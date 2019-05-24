"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_IOERR_LOCK error code is an extended error code for SQLITE_IOERR indicating an I/O error in the advisory file locking logic. Usually an SQLITE_IOERR_LOCK error indicates a problem obtaining a PENDING lock. However it can also indicate miscellaneous locking errors on some of the specialized VFSes used on Macs.
"
Class {
	#name : #SQLite3IoerrLock,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3IoerrLock class >> errorCode [
	^ SQLITE_IOERR_LOCK
]
