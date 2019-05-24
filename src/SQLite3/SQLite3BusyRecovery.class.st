"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_BUSY_RECOVERY error code is an extended error code for SQLITE_BUSY that indicates that an operation could not continue because another process is busy recovering a WAL mode database file following a crash. The SQLITE_BUSY_RECOVERY error code only occurs on WAL mode databases.
"
Class {
	#name : #SQLite3BusyRecovery,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3BusyRecovery class >> errorCode [
	^ SQLITE_BUSY_RECOVERY
]
