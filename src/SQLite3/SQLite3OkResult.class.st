"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_OK result code means that the operation was successful and that there were no errors. Most other result codes indicate an error.
"
Class {
	#name : #SQLite3OkResult,
	#superclass : #SQLite3Result,
	#category : #'SQLite3-Results'
}

{ #category : #accessing }
SQLite3OkResult class >> resultCode [
	^ SQLITE_OK
]

{ #category : #testing }
SQLite3OkResult >> isOk [
	^ true
]
