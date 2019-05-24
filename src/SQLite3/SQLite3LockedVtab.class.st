"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_LOCKED_VTAB result code is not used by the SQLite core, but it is available for use by extensions. Virtual table implementations can return this result code to indicate that they cannot complete the current operation because of locks held by other threads or processes.

The R-Tree extension returns this result code when an attempt is made to update the R-Tree while another prepared statement is actively reading the R-Tree. The update cannot proceed because any change to an R-Tree might involve reshuffling and rebalancing of nodes, which would disrupt read cursors, causing some rows to be repeated and other rows to be omitted.
"
Class {
	#name : #SQLite3LockedVtab,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3LockedVtab class >> errorCode [
	^ SQLITE_LOCKED_VTAB
]
