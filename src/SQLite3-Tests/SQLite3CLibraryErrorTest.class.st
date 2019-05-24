"
A SQLite3CLibraryErrorTest is a test class for testing the behavior of SQLite3CLibraryError
"
Class {
	#name : #SQLite3CLibraryErrorTest,
	#superclass : #TestCase,
	#pools : [
		'SQLite3Constants'
	],
	#category : #'SQLite3-Tests-Errors'
}

{ #category : #tests }
SQLite3CLibraryErrorTest >> testSubclassForErrorCode [
	self assert: (SQLite3CLibraryError subclassForErrorCode: BUSY) equals: SQLite3Busy.
	self assert: (SQLite3CLibraryError subclassForErrorCode: LOCKED) equals: SQLite3Locked.
	self assert: (SQLite3CLibraryError subclassForErrorCode: MISUSE) equals: SQLite3Misuse.
	
	self should: [ SQLite3CLibraryError subclassForErrorCode: -100000 ] raise: NotFound.
]
