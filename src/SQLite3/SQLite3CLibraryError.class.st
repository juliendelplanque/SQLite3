"
I represent an error converted from a SQLite3 C library's error code.
"
Class {
	#name : #SQLite3CLibraryError,
	#superclass : #SQLite3AbstractError,
	#instVars : [
		'apiErrorMessage'
	],
	#pools : [
		'SQLite3Constants'
	],
	#category : #'SQLite3-Errors'
}

{ #category : #'instance creation' }
SQLite3CLibraryError class >> apiErrorMessage: aString [
	^ self new
		apiErrorMessage: aString;
		yourself
]

{ #category : #accessing }
SQLite3CLibraryError class >> errorCode [
	"Returns the error code as defined by SQLite C library."
	^ self subclassResponsibility
]

{ #category : #'instance creation' }
SQLite3CLibraryError class >> forErrorCode: anInteger apiErrorMessage: aString [
	^ (self subclassForErrorCode: anInteger) new
			apiErrorMessage: aString;
			yourself
]

{ #category : #accessing }
SQLite3CLibraryError class >> subclassForErrorCode: anInteger [
	^ self subclasses detect: [ :subclass |
		subclass errorCode = anInteger ]
]

{ #category : #accessing }
SQLite3CLibraryError >> apiErrorMessage [
	^ apiErrorMessage
]

{ #category : #accessing }
SQLite3CLibraryError >> apiErrorMessage: anObject [
	apiErrorMessage := anObject
]

{ #category : #accessing }
SQLite3CLibraryError >> errorCode [
	^ self class errorCode
]

{ #category : #accessing }
SQLite3CLibraryError >> messageText [
	^String streamContents: [ :stream |
		stream nextPut: $(.
		self errorCode printOn: stream.
		stream nextPutAll: ') '.
		self apiErrorMessage printOn: stream  ]
]
