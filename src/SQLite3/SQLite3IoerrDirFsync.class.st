"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_IOERR_DIR_FSYNC error code is an extended error code for SQLITE_IOERR indicating an I/O error in the VFS layer while trying to invoke fsync() on a directory. The unix VFS attempts to fsync() directories after creating or deleting certain files to ensure that those files will still appear in the filesystem following a power loss or system crash. This error code indicates a problem attempting to perform that fsync().
"
Class {
	#name : #SQLite3IoerrDirFsync,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3IoerrDirFsync class >> errorCode [
	^ SQLITE_IOERR_DIR_FSYNC
]
