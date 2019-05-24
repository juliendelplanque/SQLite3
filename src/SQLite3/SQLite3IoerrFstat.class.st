"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_IOERR_FSTAT error code is an extended error code for SQLITE_IOERR indicating an I/O error in the VFS layer while trying to invoke fstat() (or the equivalent) on a file in order to determine information such as the file size or access permissions.
"
Class {
	#name : #SQLite3IoerrFstat,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3IoerrFstat class >> errorCode [
	^ SQLITE_IOERR_FSTAT
]
