"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_NOTFOUND result code is used in two contexts. SQLITE_NOTFOUND can be returned by the sqlite3_file_control() interface to indicate that the file control opcode passed as the third argument was not recognized by the underlying VFS. SQLITE_NOTFOUND can also be returned by the xSetSystemCall() method of an sqlite3_vfs object.

The SQLITE_NOTFOUND result code is also used internally by the SQLite implementation, but those internal uses are not exposed to the application.
"
Class {
	#name : #SQLite3Notfound,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3Notfound class >> errorCode [
	^ SQLITE_NOTFOUND
]
