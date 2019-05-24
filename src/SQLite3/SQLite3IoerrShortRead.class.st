"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_IOERR_SHORT_READ error code is an extended error code for SQLITE_IOERR indicating that a read attempt in the VFS layer was unable to obtain as many bytes as was requested. This might be due to a truncated file.
"
Class {
	#name : #SQLite3IoerrShortRead,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3IoerrShortRead class >> errorCode [
	^ SQLITE_IOERR_SHORT_READ
]
