"
I represent a set of results returned by the database. I produce UDBCSQLite3Row instances lazily.

"
Class {
	#name : #SQLite3Cursor,
	#superclass : #Object,
	#instVars : [
		'statement',
		'moreRows',
		'rowClass',
		'connection'
	],
	#category : #'SQLite3-Database'
}

{ #category : #'instance creation' }
SQLite3Cursor class >> on: aSQLite3Connection [
	^ self new
		connection: aSQLite3Connection;
		yourself
]

{ #category : #API }
SQLite3Cursor >> close [

	statement ifNotNil: [ statement finalize ].
	statement := nil
]

{ #category : #accessing }
SQLite3Cursor >> connection [
	^ connection
]

{ #category : #accessing }
SQLite3Cursor >> connection: anObject [
	connection := anObject
]

{ #category : #private }
SQLite3Cursor >> execute: aSQLString with: anObject [
	anObject sqlite3BeArgumentForExecutionOf: aSQLString by: self
]

{ #category : #private }
SQLite3Cursor >> execute: anSQLText withCollection: aCollection [
	self prepareStatement: anSQLText.
	aCollection doWithIndex: [ :object :i | 
		object sqlite3PutYourselfAtIndex: i inStatement: statement ].
	moreRows := statement step isRow
]

{ #category : #private }
SQLite3Cursor >> execute: aStatement withKey: keyObject withValue: valueObject [
	| col |

	col := aStatement bindParameterIndex: keyObject.
	(col = 0) ifFalse: [
		valueObject sqlite3PutYourselfAtIndex: col inStatement: aStatement. ]

		

]

{ #category : #private }
SQLite3Cursor >> execute: anSQLText withKeysAndValues: anObject [
	
	self prepareStatement: anSQLText.
	anObject keysAndValuesDo: [ :k :v | 
		self execute: statement withKey: k withValue: v ].
	moreRows := statement step isRow

]

{ #category : #initialization }
SQLite3Cursor >> initialize [
	"Initializes the receiver"
	
	super initialize.
	moreRows := true.
	rowClass := SQLite3Row

]

{ #category : #API }
SQLite3Cursor >> next [
	^ self nextOfClass: self rowClass

]

{ #category : #API }
SQLite3Cursor >> nextOfClass: aRowClass [
	| numberOfColumns resultRow |
	statement ifNil: [
		SQLite3GenericError signal: 'This cursor does not contain a prepared statement.' ].
	moreRows
		ifFalse: [ ^ nil ].
	
	numberOfColumns := statement dataValuesAvailable.
	numberOfColumns = 0
		ifTrue: [ ^ nil ].
	
	resultRow := aRowClass new.
	0 to: numberOfColumns - 1 do: [ :columnIndex | 
	resultRow
		atColumnNamed: (statement nameOfColumn: columnIndex)
		put: (statement valueOfColumn: columnIndex) ].
	moreRows := statement step isRow.
	^ resultRow
]

{ #category : #API }
SQLite3Cursor >> onlyRow [
	^ self onlyRow: [ ]

"For the common case where there is exactly one row expected. Returns nil if there is no row."

]

{ #category : #API }
SQLite3Cursor >> onlyRow: ifNoneBlock [
	| rows |
	
	rows := self rows.
	^ (rows isEmpty)
		ifTrue: [ ifNoneBlock value ]
		ifFalse: [ rows first ]

"For the common case where there is exactly one row expected. Returns the evaluation of ifNoneBlock if there is no row."

]

{ #category : #private }
SQLite3Cursor >> prepareStatement: anSQLText [

	statement := self connection prepare: anSQLText.
	statement clearBindings.
	statement reset

]

{ #category : #accessing }
SQLite3Cursor >> rowClass [
	^ rowClass
]

{ #category : #accessing }
SQLite3Cursor >> rowClass: anObject [
	rowClass := anObject
]

{ #category : #API }
SQLite3Cursor >> rows [
	^ self rowsOfClass: self rowClass

]

{ #category : #API }
SQLite3Cursor >> rowsOfClass: aRowClass [
	| rows  |
	rows := OrderedCollection new.
	[ moreRows ]
		whileTrue: [ rows add: (self nextOfClass: aRowClass) ].
	^ rows
]

{ #category : #accessing }
SQLite3Cursor >> statement [
	^ statement
]

{ #category : #accessing }
SQLite3Cursor >> statement: anObject [
	statement := anObject
]
