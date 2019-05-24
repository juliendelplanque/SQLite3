"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_AUTH error is returned when the authorizer callback indicates that an SQL statement being prepared is not authorized.
"
Class {
	#name : #SQLite3Auth,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3Auth class >> errorCode [
	^ SQLITE_AUTH
]
