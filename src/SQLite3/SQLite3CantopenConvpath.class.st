"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_CANTOPEN_CONVPATH error code is an extended error code for SQLITE_CANTOPEN used only by Cygwin VFS and indicating that the cygwin_conv_path() system call failed while trying to open a file. See also: SQLITE_IOERR_CONVPATH
"
Class {
	#name : #SQLite3CantopenConvpath,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3CantopenConvpath class >> errorCode [
	^ SQLITE_CANTOPEN_CONVPATH
]
