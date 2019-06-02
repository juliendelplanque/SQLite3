Extension { #name : #AbstractFileReference }

{ #category : #'*SQLite3' }
AbstractFileReference >> sqlite3ConnectionDo: aBlock [
	^ (SQLite3Connection on: self asFileReference)
			do: aBlock
]

{ #category : #'*SQLite3' }
AbstractFileReference >> sqlite3PathString [
	^ self pathString
]
