"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_IOERR_FSYNC error code is an extended error code for SQLITE_IOERR indicating an I/O error in the VFS layer while trying to flush previously written content out of OS and/or disk-control buffers and into persistent storage. In other words, this code indicates a problem with the fsync() system call in unix or the FlushFileBuffers() system call in windows.
"
Class {
	#name : #SQLite3IoerrFsync,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3IoerrFsync class >> errorCode [
	^ SQLITE_IOERR_FSYNC
]
