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

{ #category : #'as yet unclassified' }
SQLite3Row >> at: aKey [
	self
		deprecated: 'Please use #atColumnNamed: instead'
		transformWith: '`@receiver at: `@statements' 
						-> '`@receiver atColumnNamed: `@statements'.
	^ self atColumnNamed: aKey
]

{ #category : #'as yet unclassified' }
SQLite3Row >> at: aKey ifAbsent: aBlock [
	self
		deprecated: 'Please use #atColumnNamed:ifAbsent: instead'
		transformWith: '`@receiver at: `@statements1 ifAbsent: `@statements2' 
						-> '`@receiver atColumnNamed: `@statements1 ifAbsent: `@statements2'.
	^ self atColumnNamed: aKey ifAbsent: aBlock
]

{ #category : #'as yet unclassified' }
SQLite3Row >> at: aKey put: anObject [
	self
		deprecated: 'Please use #atColumnNamed:put instead'
		transformWith: '`@receiver at: `@statements1 put: `@statements2' 
						-> '`@receiver atColumnNamed: `@statements1 put: `@statements2'.
	^ self atColumnNamed: aKey put: anObject
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

{ #category : #'as yet unclassified' }
SQLite3Row >> atName: aKey [ 
	self
		deprecated: 'Please use #atColumnNamed: instead'
		transformWith: '`@receiver atName: `@statements' 
						-> '`@receiver atColumnNamed: `@statements'.
	^ self atColumnNamed: aKey
]

{ #category : #'as yet unclassified' }
SQLite3Row >> atName: aKey put: anObject [
	self
		deprecated: 'Please use #atColumnNamed:put instead'
		transformWith: '`@receiver atName: `@statements1 put: `@statements2' 
						-> '`@receiver atColumnNamed: `@statements1 put: `@statements2'.
	^ self atColumnNamed: aKey put: anObject
]

{ #category : #accessing }
SQLite3Row >> columnNames [
	^ self data keys
]

{ #category : #accessing }
SQLite3Row >> data [

	 ^data
]

{ #category : #'as yet unclassified' }
SQLite3Row >> dataCount [
	self
		deprecated: 'Please use #size instead'
		transformWith: '`@receiver dataCount' 
						-> '`@receiver size'.
	^ self size
]

{ #category : #'as yet unclassified' }
SQLite3Row >> dataCount: anObject [
	self error: 'Should not set size by hand.'
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

{ #category : #accessing }
SQLite3Row >> size [
	^ self data size
]

{ #category : #accessing }
SQLite3Row >> values [
	^ self data values
]
