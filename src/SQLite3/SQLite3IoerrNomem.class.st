"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_IOERR_NOMEM error code is sometimes returned by the VFS layer to indicate that an operation could not be completed due to the inability to allocate sufficient memory. This error code is normally converted into SQLITE_NOMEM by the higher layers of SQLite before being returned to the application.
"
Class {
	#name : #SQLite3IoerrNomem,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3IoerrNomem class >> errorCode [
	^ SQLITE_IOERR_NOMEM
]
