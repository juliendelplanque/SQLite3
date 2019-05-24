"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_IOERR_CONVPATH error code is an extended error code for SQLITE_IOERR used only by Cygwin VFS and indicating that the cygwin_conv_path() system call failed. See also: SQLITE_CANTOPEN_CONVPATH
"
Class {
	#name : #SQLite3IoerrConvpath,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3IoerrConvpath class >> errorCode [
	^ SQLITE_IOERR_CONVPATH
]
