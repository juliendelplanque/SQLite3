Extension { #name : #AbstractFileReference }

{ #category : #'*SQLite3' }
AbstractFileReference >> sqlite3ConnectionDo: aBlock [
	^ (SQLite3Connection on: self asFileReference)
			do: aBlock
]

{ #category : #'*SQLite3' }
AbstractFileReference >> sqlite3ConnectionExecute: aString [
	^ self sqlite3ConnectionDo: [ :connection |
		(connection execute: aString) rows ]
]

{ #category : #'*SQLite3' }
AbstractFileReference >> sqlite3ConnectionExecute: aString value: object1 [
	^ self sqlite3ConnectionDo: [ :connection |
		(connection execute: aString value: object1) rows ]
]

{ #category : #'*SQLite3' }
AbstractFileReference >> sqlite3ConnectionExecute: aString value: object1 value: object2 [
	^ self sqlite3ConnectionDo: [ :connection |
		(connection execute: aString value: object1 value: object2) rows ]
]

{ #category : #'*SQLite3' }
AbstractFileReference >> sqlite3ConnectionExecute: aString value: object1 value: object2 value: object3 [
	^ self sqlite3ConnectionDo: [ :connection |
		(connection execute: aString value: object1 value: object2 value: object3) rows ]
]

{ #category : #'*SQLite3' }
AbstractFileReference >> sqlite3ConnectionExecute: aString value: object1 value: object2 value: object3 value: object4 [
	^ self sqlite3ConnectionDo: [ :connection |
		(connection execute: aString value: object1 value: object2 value: object3 value: object4) rows ]
]

{ #category : #'*SQLite3' }
AbstractFileReference >> sqlite3PathString [
	^ self pathString
]
