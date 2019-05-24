"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_READONLY_RECOVERY error code is an extended error code for SQLITE_READONLY. The SQLITE_READONLY_RECOVERY error code indicates that a WAL mode database cannot be opened because the database file needs to be recovered and recovery requires write access but only read access is available.
"
Class {
	#name : #SQLite3ReadonlyRecovery,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3ReadonlyRecovery class >> errorCode [
	^ SQLITE_READONLY_RECOVERY
]
