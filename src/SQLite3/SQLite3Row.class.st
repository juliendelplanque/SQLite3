"
I represent a row of results returned by the database.

"
Class {
	#name : #SQLite3Row,
	#superclass : #Object,
	#instVars : [
		'data'
	],
	#category : #'SQLite3-Model'
}

{ #category : #converting }
SQLite3Row >> asArray [
	^ self values asArray
]

{ #category : #accessing }
SQLite3Row >> atColumnNamed: aKey [ 
	^ self data at: aKey
]

{ #category : #accessing }
SQLite3Row >> atColumnNamed: aKey ifAbsent: aBlock [
	^ self data at: aKey ifAbsent: aBlock
]

{ #category : #accessing }
SQLite3Row >> atColumnNamed: aKey put: anObject [
	^  self data at: aKey put: anObject
]

{ #category : #accessing }
SQLite3Row >> atIndex: anIndex [
	^ self data values at: anIndex
]

{ #category : #accessing }
SQLite3Row >> columnNames [
	^ self data keys
]

{ #category : #accessing }
SQLite3Row >> data [

	 ^data
]

{ #category : #accessing }
SQLite3Row >> first [
	^ self data values first

]

{ #category : #initialization }
SQLite3Row >> initialize [
	"Initializes the receiver"
	
	super initialize.
	data := OrderedDictionary new
]

{ #category : #accessing }
SQLite3Row >> last [
	^ self data values last

]

{ #category : #printing }
SQLite3Row >> printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $(.
	self columnNames do: [ :columnName |
		aStream nextPutAll: columnName.
		aStream nextPutAll: ' : '.
		(self atColumnNamed: columnName) printOn: aStream ] separatedBy: [ aStream nextPutAll: ', ' ].
	aStream nextPut: $).
]

{ #category : #accessing }
SQLite3Row >> size [
	^ self data size
]

{ #category : #accessing }
SQLite3Row >> values [
	^ self data values
]
