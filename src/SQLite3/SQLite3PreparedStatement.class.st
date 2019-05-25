"
I represent an SQLite prepared statement.
"
Class {
	#name : #SQLite3PreparedStatement,
	#superclass : #Object,
	#instVars : [
		'connection',
		'handle'
	],
	#category : #'SQLite3-Database'
}

{ #category : #'public - accessing' }
SQLite3PreparedStatement >> at: aColumn putBoolean: aBoolean [

	^ self library 
		with: handle 
		at: aColumn 
		putInteger: aBoolean asBit
		
"See http://www.sqlite.org/datatype3.html."
]

{ #category : #'public - accessing' }
SQLite3PreparedStatement >> at: aColumn putByteArray: anObject [
	^ self library with: handle at: aColumn putBlob: anObject
]

{ #category : #'public - accessing' }
SQLite3PreparedStatement >> at: aColumn putDateTime: aDateTime [
	| s |
	
	s := SQLite3DateTimeString streamContents: [ :stream | aDateTime asDateAndTime printOn: stream ].
	^ self library with: handle at: aColumn putString: s
]

{ #category : #'public - accessing' }
SQLite3PreparedStatement >> at: aColumn putFloat: anNumber [
	^ self library with: handle at: aColumn putFloat: anNumber asFloat
]

{ #category : #'public - accessing' }
SQLite3PreparedStatement >> at: aColumn putInteger: anInteger [

	^ self library with: handle at: aColumn putInteger: anInteger
]

{ #category : #'public - accessing' }
SQLite3PreparedStatement >> at: aColumn putString: aString [
	^ self library with: handle at: aColumn putString: aString
]

{ #category : #public }
SQLite3PreparedStatement >> basicExecute: aBlock [
	| result |
	result := self step. 
	result isDone
		ifTrue: [ aBlock value: self ]
		ifFalse: [
			[ result isRow ] whileTrue: [
				aBlock value: self.
				result := self step ]]
]

{ #category : #'public - accessing' }
SQLite3PreparedStatement >> bindParameterCount [
	^ self library bindParameterCount: handle
]

{ #category : #'public - accessing' }
SQLite3PreparedStatement >> bindParameterIndex: aName [
	^ self library bindParameterIndex: handle for: aName
]

{ #category : #'public - accessing' }
SQLite3PreparedStatement >> booleanAt: aColumn [ 
	^self library booleanFrom: handle at: aColumn
]

{ #category : #'public - accessing' }
SQLite3PreparedStatement >> byteArrayAt: aColumn [
	^ self library blobFrom: handle at: aColumn

]

{ #category : #public }
SQLite3PreparedStatement >> clearBindings [
	connection clearBindings: self
]

{ #category : #'private - accessing' }
SQLite3PreparedStatement >> connection: anObject [
	connection := anObject
]

{ #category : #'public - accessing' }
SQLite3PreparedStatement >> dataValuesAvailable [
	^ self library dataValuesAvailable: handle
]

{ #category : #'public - accessing' }
SQLite3PreparedStatement >> dateTimeAt: aColumn [	
	^ DateAndTime fromString: (self library stringFrom: handle at: aColumn)
]

{ #category : #initialization }
SQLite3PreparedStatement >> finalize [
	| result |
	
	result := connection finalize: self sqlText.
	"Let FFIExternalResourceManager take care."
	"UDBCSQLite3Library current apiFinalize: handle."
	handle := nil.
	^ 0
]

{ #category : #'public - accessing' }
SQLite3PreparedStatement >> floatAt: aColumn [

	^self library floatFrom: handle at: aColumn
]

{ #category : #'private - accessing' }
SQLite3PreparedStatement >> handle [
	^ handle
]

{ #category : #initialization }
SQLite3PreparedStatement >> initialize [

	super initialize.
	handle := SQLite3StatementExternalObject new.
	handle autoRelease
]

{ #category : #'public - accessing' }
SQLite3PreparedStatement >> integerAt: aColumn [ 
	^self library integerFrom: handle at: aColumn
]

{ #category : #private }
SQLite3PreparedStatement >> library [
	^ SQLite3Library uniqueInstance
]

{ #category : #'public - accessing' }
SQLite3PreparedStatement >> nameOfColumn: aColumn [
	^ self library nameFor: handle at: aColumn
]

{ #category : #'public - accessing' }
SQLite3PreparedStatement >> nilAt: aColumn [
	self flag: #TODO. "Strange ? What is column does not exists?"
	^ nil  
]

{ #category : #'public - accessing' }
SQLite3PreparedStatement >> putNilAt: aColumn [
	^ self library with: handle putNullAt: aColumn
]

{ #category : #public }
SQLite3PreparedStatement >> reset [
	connection reset: self
]

{ #category : #operating }
SQLite3PreparedStatement >> sqlText [ 
	^ self library sqlText: handle
]

{ #category : #public }
SQLite3PreparedStatement >> step [
	^ connection step: handle
]

{ #category : #operating }
SQLite3PreparedStatement >> stringAt: aColumn [	 
	^ self library stringFrom: handle at: aColumn
]

{ #category : #public }
SQLite3PreparedStatement >> typeOfColumn: aColumn [
	^ self library typeFor: handle at: aColumn
]

{ #category : #public }
SQLite3PreparedStatement >> valueOfColumn: aColumn [
	self flag: #TODO. "Refactor to avoid perform..."
	^ self perform: (self typeOfColumn: aColumn) with: aColumn

]
