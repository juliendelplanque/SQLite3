"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_ROW result code returned by sqlite3_step() indicates that another row of output is available.
"
Class {
	#name : #SQLite3RowResult,
	#superclass : #SQLite3Result,
	#category : #'SQLite3-Results'
}

{ #category : #accessing }
SQLite3RowResult class >> resultCode [
	^ SQLITE_ROW
]

{ #category : #testing }
SQLite3RowResult >> isRow [
	^ true
]
