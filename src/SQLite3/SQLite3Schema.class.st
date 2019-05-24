"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_SCHEMA result code indicates that the database schema has changed. This result code can be returned from sqlite3_step() for a prepared statement that was generated using sqlite3_prepare() or sqlite3_prepare16(). If the database schema was changed by some other process in between the time that the statement was prepared and the time the statement was run, this error can result.

If a prepared statement is generated from sqlite3_prepare_v2() then the statement is automatically re-prepared if the schema changes, up to SQLITE_MAX_SCHEMA_RETRY times (default: 50). The sqlite3_step() interface will only return SQLITE_SCHEMA back to the application if the failure persists after these many retries.
"
Class {
	#name : #SQLite3Schema,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3Schema class >> errorCode [
	^ SQLITE_SCHEMA
]
