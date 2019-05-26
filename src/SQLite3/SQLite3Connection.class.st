"
I represent a connection to an SQLite database.
I provide an abstraction over the SQLite C API.
"
Class {
	#name : #SQLite3Connection,
	#superclass : #Object,
	#instVars : [
		'dbFilename',
		'dbHandle',
		'isOpen',
		'library',
		'statementClass'
	],
	#category : #'SQLite3-Model'
}

{ #category : #examples }
SQLite3Connection class >> memory [

	^self on: ':memory:'
]

{ #category : #'instance creation' }
SQLite3Connection class >> on: aFilename [

	^(self new) 
		on: aFilename;
		yourself

]

{ #category : #'instance creation' }
SQLite3Connection class >> openOn: aFilename [

	^(self new) 
		on: aFilename; 
		open; 
		yourself

]

{ #category : #'public API - operating' }
SQLite3Connection >> basicExecute: anSQLText [ 
	^ (self prepare: anSQLText) step; finalize

"20190302, pierce: This used to invoke sqlite3_exec() which is an SQLite-internal convenience wrapper around prepare/step/finalize. It is now rewritten as seen to handle UTF8-encoded input properly. Rewriting this method breaks the Bobby Tables test which relies on naive SQL string construction to work."
	
]

{ #category : #'public API - transactional' }
SQLite3Connection >> beginTransaction [
	^ self basicExecute: 'begin'	
]

{ #category : #'public API - introspection' }
SQLite3Connection >> changes [
	^ library changes: dbHandle
]

{ #category : #'public API - operating' }
SQLite3Connection >> clearBindings: aStatement [
	library clearBindings: aStatement handle on: dbHandle
	
]

{ #category : #'public API - open/close' }
SQLite3Connection >> close [

	"Let FFIExternalResourceManager take care."
	"dbHandle ifNotNil: [ library close: dbHandle ]."
	dbHandle := nil.
	isOpen := false.
]

{ #category : #'public API - introspection' }
SQLite3Connection >> columnNamesFor: aTableName [
	
	self isOpen
		ifFalse: [ SQLite3NotOpen signal ]
		ifTrue: [ 
			| s tableExists |
			s := self prepare: 'select count(*) from sqlite_master where type = "table" and tbl_name = ?'.
			s at: 1 putString: aTableName.
	  		s basicExecute: [ :row | tableExists := ((row integerAt: 0) = 1) ].
	  		s finalize.
			tableExists ifTrue: [ 
				| columns |
				columns := OrderedCollection new.
				s := self prepare: 'pragma table_info(', aTableName, ')'.
				s basicExecute: [ :row | columns add: (row stringAt: 1) ].
				s finalize.
				^ columns ].
			^ nil ]
		
]

{ #category : #'public API - transactional' }
SQLite3Connection >> commitTransaction [
	^ self basicExecute: 'commit'	
]

{ #category : #'public API - introspection' }
SQLite3Connection >> declaredColumnTypesFor: aTableName [
	
	self isOpen
		ifFalse: [ SQLite3NotOpen signal ]
		ifTrue: [ 
			| s tableExists |
			s := self prepare: 'select count(*) from sqlite_master where type = "table" and tbl_name = ?'.
			s at: 1 putString: aTableName.
	  		s basicExecute: [ :row | tableExists := ((row integerAt: 0) = 1) ].
	  		s finalize.
			tableExists ifTrue: [ 
				| columns |
				columns := OrderedCollection new.
				s := self prepare: 'pragma table_info(', aTableName, ')'.
				s basicExecute: [ :row | columns add: (row stringAt: 2) ].
				s finalize.
				^ columns ].
			^ nil ]
		
]

{ #category : #'public API - extensions' }
SQLite3Connection >> disableExtensions [
	^ library disableLoadExtension: dbHandle 
]

{ #category : #'public API - extensions' }
SQLite3Connection >> enableExtensions [
	^ library enableLoadExtension: dbHandle 
]

{ #category : #'public API - operating' }
SQLite3Connection >> execute: anSQLText [	
	^ self execute: anSQLText with: #()
]

{ #category : #'public API - operating' }
SQLite3Connection >> execute: anSQLText value: anObject [

	^ (SQLite3Cursor on: self)
			execute: anSQLText with: (Array with: anObject)

]

{ #category : #'public API - operating' }
SQLite3Connection >> execute: anSQLText value: object1 value: object2 [

	^ (SQLite3Cursor on: self)
			execute: anSQLText with: (Array with: object1 with: object2)

]

{ #category : #'public API - operating' }
SQLite3Connection >> execute: anSQLText value: object1 value: object2 value: object3 [

	^ (SQLite3Cursor on: self)
			execute: anSQLText with: (Array with: object1 with: object2 with: object3)
]

{ #category : #'public API - operating' }
SQLite3Connection >> execute: anSQLText value: object1 value: object2 value: object3 value: object4 [

	^ (SQLite3Cursor on: self)
			execute: anSQLText with: (Array with: object1 with: object2 with: object3 with: object4)

]

{ #category : #'public API - operating' }
SQLite3Connection >> execute: anSQLText with: anObject [
	^ (SQLite3Cursor on: self) execute: anSQLText with: anObject

]

{ #category : #'public API - operating' }
SQLite3Connection >> finalize: anSQLText [ 
	"no-op"	
]

{ #category : #initialization }
SQLite3Connection >> initialize [
	super initialize.
	isOpen := false.
	library := SQLite3Library uniqueInstance.
	dbHandle := SQLite3DatabaseExternalObject new.
	dbHandle autoRelease.
	statementClass := SQLite3PreparedStatement
]

{ #category : #testing }
SQLite3Connection >> isOpen [
	^ isOpen
]

{ #category : #'public API - extensions' }
SQLite3Connection >> loadExtension: aFilename [
	^ library loadExtension: dbHandle with: aFilename 
]

{ #category : #private }
SQLite3Connection >> on: aFilename [

	dbFilename := aFilename.
	^ self
]

{ #category : #'public API - open/close' }
SQLite3Connection >> open [
	library open: dbFilename via: dbHandle.
	isOpen := true
]

{ #category : #'public API - operating' }
SQLite3Connection >> prepare: anSQLText [ 
	| s |
	
	s := self statementClass new.
	s connection: self.
	library prepare: s handle on: dbHandle with: anSQLText.
	^ s
	
]

{ #category : #printing }
SQLite3Connection >> printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $(.
	dbFilename printOn: aStream.
	aStream nextPut: $).
]

{ #category : #'public API - cleaning' }
SQLite3Connection >> reset: aStatement [ 
	library reset: aStatement handle on: dbHandle
	
]

{ #category : #'public API - transactional' }
SQLite3Connection >> rollbackTransaction [
	^ self basicExecute: 'rollback'	
]

{ #category : #private }
SQLite3Connection >> signal: exceptionClass [
	library signal: exceptionClass on: dbHandle
]

{ #category : #accessing }
SQLite3Connection >> statementClass [
	^ statementClass
]

{ #category : #private }
SQLite3Connection >> step: preparedStatementHandle [
	^ library step: preparedStatementHandle on: dbHandle
]

{ #category : #'public API - introspection' }
SQLite3Connection >> tableNames [
	| tables s |
	
	self isOpen
		ifFalse: [ SQLite3NotOpen signal ]
		ifTrue: [ 
			tables := OrderedCollection new.
			s := self prepare: 'select tbl_name from sqlite_master where type = "table"'.
	  		s basicExecute: [ :row |
				(row dataValuesAvailable > 0) ifTrue: [ tables add: (row stringAt: 0) ]].
	  		s finalize.
			^ tables ]
]

{ #category : #'public API - introspection' }
SQLite3Connection >> totalChanges [
	^ library totalChanges: dbHandle
]

{ #category : #'public API - tracing' }
SQLite3Connection >> traceUsing: callback with: appdata [
	library trace: dbHandle with: callback with: appdata
	
]
