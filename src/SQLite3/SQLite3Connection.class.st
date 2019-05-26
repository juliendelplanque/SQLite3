"
I represent a connection to an SQLite database.

"
Class {
	#name : #SQLite3Connection,
	#superclass : #SQLite3BaseConnection,
	#category : #'SQLite3-Connections'
}

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

{ #category : #accessing }
SQLite3Connection >> queryEncoding [
	^ #utf8
]
