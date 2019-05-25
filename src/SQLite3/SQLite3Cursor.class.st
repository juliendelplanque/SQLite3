"
I represent a set of results returned by the database. I produce UDBCSQLite3Row instances lazily.

"
Class {
	#name : #SQLite3Cursor,
	#superclass : #Object,
	#instVars : [
		'db',
		'statement',
		'moreRows',
		'rowClass'
	],
	#category : #'SQLite3-Database'
}

{ #category : #API }
SQLite3Cursor >> close [

	statement ifNotNil: [ statement finalize ].
	statement := nil
]

{ #category : #private }
SQLite3Cursor >> execute: anSQLText with: anObject on: aDb [
	| obj |
	self flag: #TODO. "Dispatch on anObject instead of doing lot of conditional."
	
	anObject isString
		ifTrue: [ SQLite3GenericError signal: 'Unable to execute SQL on instance of String.' ].
	
	db := aDb.

	obj := anObject isNil ifTrue: [ #() ] ifFalse: [ anObject ].

	(obj isDictionary)
		ifTrue: [ self execute: anSQLText withKeysAndValues: obj ]
		ifFalse: [
			(obj isCollection)
				ifTrue: [ self execute: anSQLText withCollection: obj ]
				ifFalse: [ SQLite3GenericError signal: 'Unable to execute SQL on instance of ', obj class asString ]]
]

{ #category : #private }
SQLite3Cursor >> execute: anSQLText withCollection: aCollection [
	| i |
	self prepareStatement: anSQLText.
	i := 1.
	aCollection do: [ :v | i := self execute: statement withIndex: i withValue: v ].
	moreRows := statement step isRow
]

{ #category : #private }
SQLite3Cursor >> execute: aStatement withIndex: anInteger withValue: anObject [
	anObject sqlite3PutYourselfAtIndex: anInteger inStatement: aStatement.
	^ anInteger + 1
		

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
	| numberOfColumns resultRow resultValue |
	statement
		ifNil: [ SQLite3Misuse
				signal: 'This result set does not contain a prepared statement.' ].
	moreRows
		ifTrue: [ numberOfColumns := statement dataValuesAvailable.
			numberOfColumns = 0
				ifTrue: [ ^ nil ]
				ifFalse: [ resultRow := aRowClass new.
					0 to: numberOfColumns - 1 do: [ :columnIndex | 
						resultValue := statement valueOfColumn: columnIndex.
						resultRow
							atColumnNamed: (statement nameOfColumn: columnIndex)
							put: resultValue ].
					moreRows := statement step isRow.
					^ resultRow ] ].
	^ nil
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

	statement := db prepare: anSQLText.
	statement clearBindings.
	statement	reset

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
	| rows nc rr rv |
	statement
		ifNil: [ SQLite3Misuse
				signal: 'This result set does not contain a prepared statement.' ].
	rows := OrderedCollection new.
	[ moreRows ]
		whileTrue: [ nc := statement dataValuesAvailable.
			nc = 0
				ifFalse: [ rr := aRowClass new.
					0 to: nc - 1 do: [ :c | 
						rv := statement valueOfColumn: c.
						rr atColumnNamed: (statement nameOfColumn: c) put: rv ].
					rows add: rr ].
			moreRows := statement step isRow ].
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
