"
I am an abstract class to model a result code created by sqlite3 C library.
"
Class {
	#name : #SQLite3Result,
	#superclass : #Object,
	#pools : [
		'SQLite3Constants'
	],
	#category : #'SQLite3-Results'
}

{ #category : #'instance creation' }
SQLite3Result class >> forResultCode: anInteger [
	^ (self subclassForResultCode: anInteger) new
]

{ #category : #accessing }
SQLite3Result class >> resultCode [
	"Returns the C result code corresponding to the result."
	^ self subclassResponsibility
]

{ #category : #accessing }
SQLite3Result class >> subclassForResultCode: anInteger [
	^ self subclasses detect: [ :subclass | subclass resultCode = anInteger ]
]

{ #category : #testing }
SQLite3Result >> isDone [
	^ false
]

{ #category : #testing }
SQLite3Result >> isOk [
	^ false
]

{ #category : #testing }
SQLite3Result >> isRow [
	^ false
]

{ #category : #accessing }
SQLite3Result >> resultCode [
	^ self class resultCode
]
