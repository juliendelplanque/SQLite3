"
I provide SQLIte's constants.
"
Class {
	#name : #SQLite3Constants,
	#superclass : #SharedPool,
	#classVars : [
		'BLOB',
		'FLOAT',
		'INTEGER',
		'NULL',
		'SQLITE_BUSY',
		'SQLITE_CANTOPEN',
		'SQLITE_CONSTRAINT',
		'SQLITE_DONE',
		'SQLITE_ERROR',
		'SQLITE_LOCKED',
		'SQLITE_MISUSE',
		'SQLITE_OK',
		'SQLITE_ROW',
		'TEXT'
	],
	#category : #'SQLite3-UFFI-Support'
}

{ #category : #initialization }
SQLite3Constants class >> initialize [
	self initializeReturnCode.
			
	"Types."
	INTEGER := 1.
	FLOAT := 2.
	TEXT := 3.
	BLOB := 4.	
	NULL := 5.

]

{ #category : #initialization }
SQLite3Constants class >> initializeReturnCode [
	"C function return codes."
	SQLITE_OK := 0.	
	SQLITE_ERROR := 1.
	SQLITE_BUSY := 5.
	SQLITE_LOCKED := 6.
	SQLITE_CANTOPEN := 14.
	SQLITE_CONSTRAINT := 19.	
	SQLITE_MISUSE := 21.
	SQLITE_ROW := 100.
	SQLITE_DONE := 101.
]
