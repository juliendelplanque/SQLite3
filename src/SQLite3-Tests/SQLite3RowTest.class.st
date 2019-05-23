"
A SQLite3RowTest is a test class for testing the behavior of SQLite3Row
"
Class {
	#name : #SQLite3RowTest,
	#superclass : #TestCase,
	#instVars : [
		'row',
		'emptyRow'
	],
	#category : #'SQLite3-Tests-Database'
}

{ #category : #running }
SQLite3RowTest >> setUp [
	super setUp.
	emptyRow := SQLite3Row new.
	row := SQLite3Row new.
	row
		atColumnNamed: 'foo' put: 1;
		atColumnNamed: 'bar' put: true;
		atColumnNamed: 'pi' put: '3.14'
]

{ #category : #test }
SQLite3RowTest >> testAsArray [
	self assert: emptyRow asArray equals: #().
	
	self assert: row asArray equals: #(1 true '3.14')
]

{ #category : #test }
SQLite3RowTest >> testAtColumnNamed [
	self should: [ emptyRow atColumnNamed: 'foo' ] raise: KeyNotFound.

	self assert: (row atColumnNamed: 'foo') equals: 1.
	self assert: (row atColumnNamed: 'bar') equals: true.
	self assert: (row atColumnNamed: 'pi') equals: '3.14'.
	
	self should: [ row atColumnNamed: 'nope' ] raise: KeyNotFound.
]

{ #category : #test }
SQLite3RowTest >> testAtColumnNamedIfAbsent [
	|blockExecutedFlag|
	blockExecutedFlag := false.
	
	row atColumnNamed: 'foo' ifAbsent: [ blockExecutedFlag := true ].
	
	self deny: blockExecutedFlag.
	
	row atColumnNamed: 'nope' ifAbsent: [ blockExecutedFlag := true ].
	
	self assert: blockExecutedFlag.
]

{ #category : #test }
SQLite3RowTest >> testAtColumnNamedPut [
	self should: [ emptyRow atColumnNamed: 'foo' ] raise: KeyNotFound.
	
	emptyRow atColumnNamed: 'foo' put: 42.
	
	self assert: (emptyRow atColumnNamed: 'foo') equals: 42.

	self assert: (row atColumnNamed: 'foo') equals: 1.
	
	row atColumnNamed: 'foo' put: 2.
	
	self assert: (row atColumnNamed: 'foo') equals: 2
]

{ #category : #test }
SQLite3RowTest >> testAtIndex [
	self should: [ emptyRow atIndex: 1 ] raise: SubscriptOutOfBounds.

	self assert: (row atIndex: 1) equals: 1.
	self assert: (row atIndex: 2) equals: true.
	self assert: (row atIndex: 3) equals: '3.14'.
	
	self should: [ row atIndex: 4 ] raise: SubscriptOutOfBounds.
]

{ #category : #test }
SQLite3RowTest >> testColumnNames [
	self assert: emptyRow columnNames equals: #().
	
	self assert: row columnNames equals: #('foo' 'bar' 'pi')
]

{ #category : #test }
SQLite3RowTest >> testData [

	self assert: emptyRow data equals: OrderedDictionary new.
	self assert: row data equals: (OrderedDictionary new
											at: 'foo' put: 1;
											at: 'bar' put: true;
											at: 'pi' put: '3.14';
											yourself).
]

{ #category : #test }
SQLite3RowTest >> testFirst [
	self assert: row first equals: 1.
]

{ #category : #test }
SQLite3RowTest >> testLast [
	self assert: (row last) equals: '3.14'.
]

{ #category : #test }
SQLite3RowTest >> testSize [
	self assert: emptyRow size equals: 0.
	self assert: row size equals: 3.
]
