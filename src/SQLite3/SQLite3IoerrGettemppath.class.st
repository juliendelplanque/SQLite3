"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_IOERR_GETTEMPPATH error code is an extended error code for SQLITE_IOERR indicating that the VFS is unable to determine a suitable directory in which to place temporary files.
"
Class {
	#name : #SQLite3IoerrGettemppath,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3IoerrGettemppath class >> errorCode [
	^ SQLITE_IOERR_GETTEMPPATH
]
