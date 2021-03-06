"
I represent the SQLite API 'sqlite3' C-level type.
"
Class {
	#name : #SQLite3DatabaseExternalObject,
	#superclass : #FFIOpaqueObject,
	#category : #'SQLite3-UFFI-Support'
}

{ #category : #'instance finalization' }
SQLite3DatabaseExternalObject class >> finalizeResourceData: resourceData [
	SQLite3Library uniqueInstance 
		ffiCall: #(int sqlite3_close (ExternalAddress resourceData))
]
