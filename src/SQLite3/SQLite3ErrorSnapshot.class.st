"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_ERROR_SNAPSHOT result code might be returned when attempting to start a read transaction on an historical version of the database by using the sqlite3_snapshot_open() interface. If the historical snapshot is no longer available, then the read transaction will fail with the SQLITE_ERROR_SNAPSHOT. This error code is only possible if SQLite is compiled with -DSQLITE_ENABLE_SNAPSHOT.
"
Class {
	#name : #SQLite3ErrorSnapshot,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3ErrorSnapshot class >> errorCode [
	^ SQLITE_ERROR_SNAPSHOT
]
