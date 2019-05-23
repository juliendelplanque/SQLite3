"
I represent the SQLite API 'sqlite3_stmt' C-level type.

"
Class {
	#name : #SQLite3StatementExternalObject,
	#superclass : #FFIOpaqueObject,
	#category : #'SQLite3-UFFI-Support'
}

{ #category : #'instance finalization' }
SQLite3StatementExternalObject class >> finalizeResourceData: aHandle [
	SQLite3Library uniqueInstance 
		ffiCall: #(int sqlite3_finalize (ExternalAddress aHandle))
]
