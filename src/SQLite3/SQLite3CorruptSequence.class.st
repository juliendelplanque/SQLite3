"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_CORRUPT_SEQUENCE result code means that the schema of the sqlite_sequence table is corrupt. The sqlite_sequence table is used to help implement the AUTOINCREMENT feature. The sqlite_sequence table should have the following format:

  CREATE TABLE sqlite_sequence(name,seq);
  
If SQLite discovers that the sqlite_sequence table has any other format, it returns the SQLITE_CORRUPT_SEQUENCE error.
"
Class {
	#name : #SQLite3CorruptSequence,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3CorruptSequence class >> errorCode [
	^ SQLITE_CORRUPT_SEQUENCE
]
