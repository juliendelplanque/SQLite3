"
This class comment was automatically generated from https://www.sqlite.org/rescode.html

The SQLITE_NOLFS error can be returned on systems that do not support large files when the database grows to be larger than what the filesystem can handle. ""NOLFS"" stands for ""NO Large File Support"".
"
Class {
	#name : #SQLite3Nolfs,
	#superclass : #SQLite3CLibraryError,
	#category : #'SQLite3-Errors'
}

{ #category : #accessing }
SQLite3Nolfs class >> errorCode [
	^ SQLITE_NOLFS
]
