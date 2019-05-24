"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_INTERRUPT result code indicates that an operation was interrupted by the sqlite3_interrupt() interface. See also: SQLITE_ABORT
"
Class {
	#name : #SQLite3Interrupt,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3Interrupt class >> errorCode [
	^ SQLITE_INTERRUPT
]
