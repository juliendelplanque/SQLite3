"
Unit tests for UDBCSQLiteBaseConnection
"
Class {
	#name : #SQLite3ConnectionBasicTest,
	#superclass : #TestCase,
	#instVars : [
		'db',
		'db2',
		'res',
		'res2'
	],
	#category : #'SQLite3-Tests-Connections'
}

{ #category : #tests }
SQLite3ConnectionBasicTest >> noTestColumnNamesBobbyGo [
	"In this test, Bobby Tables strikes naive SQL string construction."
	"20190302, pierce: #basicExecute: uses prepare/step/finalize internally and is no longer susceptible to injection attacks. "
	| tables bobby |
	
	res := db basicExecute: 'create table x (xk integer, xv integer);'.
	self assert: (res = 0).
	res := db basicExecute: 'create table students (sk integer, sname varchar);'.
	self assert: (res = 0).

	tables := db tableNames.
	self assert: (tables size = 2).
	self assert: (tables first = 'x').	
	self assert: (tables second = 'students').	

	bobby := 'x); drop table students; --'.	
	res := db basicExecute: 'pragma table_info(', bobby, ')'.
	self assert: (res = 0).

	tables := db tableNames.
	self assert: (tables size = 1).
	self assert: (tables first = 'x').	


]

{ #category : #running }
SQLite3ConnectionBasicTest >> setUp [ 

	super setUp.
	db := SQLite3Connection on: ':memory:'.
	db open.

]

{ #category : #running }
SQLite3ConnectionBasicTest >> tearDown [
	
	[ db close ] on: SQLite3Misuse do: [ ].
	super tearDown.

]

{ #category : #tests }
SQLite3ConnectionBasicTest >> testBadOpen [
	| invalidFilename |
	invalidFilename := Smalltalk os isWindows
		ifTrue: [ '/&*no' ]
		ifFalse: [ '/nosuchfile' ].
	db2 := SQLite3Connection on: invalidFilename.
	self should: [ db2 open ] raise: SQLite3Cantopen.
	self assert: db2 isOpen = false
]

{ #category : #tests }
SQLite3ConnectionBasicTest >> testBasicExecuteOk [

	res := db basicExecute: 'create table x (xk integer, xv integer);'.
	self assert: (res = 0).
	res := db basicExecute: 'drop table x;'.
	self assert: (res = 0).
	
]

{ #category : #tests }
SQLite3ConnectionBasicTest >> testBasicExecuteSyntaxError [

	self should: [ db basicExecute: 'create table,;' ]
		raise: SQLite3Error
]

{ #category : #tests }
SQLite3ConnectionBasicTest >> testBooleanColumnTypeMismatch [
	| s | 
	
	res := db basicExecute: 'create table x (xk integer primary key, xv notboolean);'.
	self assert: (res = 0).

	s := db prepare: 'select xv from x'.
	s basicExecute: [  :row |
		self should: [ row booleanAt: 0 ] raise: SQLite3GenericError ].
	s finalize.
	
]

{ #category : #tests }
SQLite3ConnectionBasicTest >> testBooleanObject [
	| s | 
	
	res := db basicExecute: 'create table x (xk integer primary key, xv boolean);'.
	self assert: (res = 0).

	res := db basicExecute: 'begin'.
	self assert: (res = 0).
	s := db prepare: 'insert into x values (NULL, ?)'.
	s at: 1 putBoolean: true.
	s step. s finalize.
	res := db basicExecute: 'commit'.
	self assert: (res = 0).
	
	s := db prepare: 'select xv from x'.
	s basicExecute: [  :row |
		| v |
		v := row booleanAt: 0.
		self assert: v equals: true ].
	s finalize.
	
]

{ #category : #tests }
SQLite3ConnectionBasicTest >> testBooleanWriteIntegerOneThenRead [
	| s | 
	
	res := db basicExecute: 'create table x (xk integer primary key, xv boolean);'.
	self assert: (res = 0).

	res := db basicExecute: 'begin'.
	self assert: (res = 0).
	s := db prepare: 'insert into x values (NULL, ?)'.
	s at: 1 putInteger: 1.
	s step. s finalize.
	res := db basicExecute: 'commit'.
	self assert: (res = 0).
	
	s := db prepare: 'select xv from x'.
	s basicExecute: [  :row |
		| v |
		v := row booleanAt: 0.
		self assert: v equals: true ].
	s finalize.
	
]

{ #category : #tests }
SQLite3ConnectionBasicTest >> testBooleanWriteIntegerTwoThenRead [
	| s | 
	
	res := db basicExecute: 'create table x (xk integer primary key, xv boolean);'.
	self assert: (res = 0).

	res := db basicExecute: 'begin'.
	self assert: (res = 0).
	s := db prepare: 'insert into x values (NULL, ?)'.
	s at: 1 putInteger: 2.
	s step. s finalize.
	res := db basicExecute: 'commit'.
	self assert: (res = 0).
	
	s := db prepare: 'select xv from x'.
	s basicExecute: [  :row |
		self should: [ row booleanAt: 0 ] raise: SQLite3GenericError ].
	s finalize.
	
]

{ #category : #tests }
SQLite3ConnectionBasicTest >> testBooleanWriteIntegerZeroThenRead [
	| s | 
	
	res := db basicExecute: 'create table x (xk integer primary key, xv boolean);'.
	self assert: (res = 0).

	res := db basicExecute: 'begin'.
	self assert: (res = 0).
	s := db prepare: 'insert into x values (NULL, ?)'.
	s at: 1 putInteger: 0.
	s step. s finalize.
	res := db basicExecute: 'commit'.
	self assert: (res = 0).
	
	s := db prepare: 'select xv from x'.
	s basicExecute: [  :row |
		| v |
		v := row booleanAt: 0.
		self assert: v equals: false ].
	s finalize.
	
]

{ #category : #tests }
SQLite3ConnectionBasicTest >> testBooleanWriteNilThenRead [
	| s | 
	
	res := db basicExecute: 'create table x (xk integer primary key, xv boolean);'.
	self assert: (res = 0).

	res := db basicExecute: 'begin'.
	self assert: (res = 0).
	s := db prepare: 'insert into x values (NULL, ?)'.
	s putNilAt: 1.
	s step. s finalize.
	res := db basicExecute: 'commit'.
	self assert: (res = 0).
	
	s := db prepare: 'select xv from x'.
	s basicExecute: [  :row |
		| v |
		v := row booleanAt: 0.
		self assert: v equals: nil ].
	s finalize.
	
]

{ #category : #tests }
SQLite3ConnectionBasicTest >> testBooleanWriteSQLNullThenRead [
	| s | 
	
	res := db basicExecute: 'create table x (xk integer primary key, xv boolean);'.
	self assert: (res = 0).

	res := db basicExecute: 'begin'.
	self assert: (res = 0).
	s := db prepare: 'insert into x values (NULL, NULL)'.
	s step. s finalize.
	res := db basicExecute: 'commit'.
	self assert: (res = 0).
	
	s := db prepare: 'select xv from x'.
	s basicExecute: [  :row |
		| v |
		v := row booleanAt: 0.
		self assert: v equals: nil ].
	s finalize.
	
]

{ #category : #tests }
SQLite3ConnectionBasicTest >> testBooleanWriteStringFalseThenRead [
	| s | 
	
	res := db basicExecute: 'create table x (xk integer primary key, xv boolean);'.
	self assert: (res = 0).

	res := db basicExecute: 'begin'.
	self assert: (res = 0).
	s := db prepare: 'insert into x values (NULL, ?)'.
	s at: 1 putString: 'false'.
	s step. s finalize.
	res := db basicExecute: 'commit'.
	self assert: (res = 0).
	
	s := db prepare: 'select xv from x'.
	s basicExecute: [  :row |
		| v |
		v := row booleanAt: 0.
		self assert: v equals: false ].
	s finalize.
	
]

{ #category : #tests }
SQLite3ConnectionBasicTest >> testBooleanWriteStringTrueThenRead [
	| s | 
	
	res := db basicExecute: 'create table x (xk integer primary key, xv boolean);'.
	self assert: (res = 0).

	res := db basicExecute: 'begin'.
	self assert: (res = 0).
	s := db prepare: 'insert into x values (NULL, ?)'.
	s at: 1 putString: 'true'.
	s step. s finalize.
	res := db basicExecute: 'commit'.
	self assert: (res = 0).
	
	s := db prepare: 'select xv from x'.
	s basicExecute: [  :row |
		| v |
		v := row booleanAt: 0.
		self assert: v equals: true ].
	s finalize.
	
]

{ #category : #tests }
SQLite3ConnectionBasicTest >> testBooleanWriteStringTwoThenRead [
	| s | 
	
	res := db basicExecute: 'create table x (xk integer primary key, xv boolean);'.
	self assert: (res = 0).

	res := db basicExecute: 'begin'.
	self assert: (res = 0).
	s := db prepare: 'insert into x values (NULL, ?)'.
	s at: 1 putString: '2'.
	s step. s finalize.
	res := db basicExecute: 'commit'.
	self assert: (res = 0).
	
	s := db prepare: 'select xv from x'.
	s basicExecute: [  :row |
		self should: [ row booleanAt: 0 ] raise: SQLite3GenericError ].
	s finalize.
	
]

{ #category : #tests }
SQLite3ConnectionBasicTest >> testBooleanWriteThenRead [
	| s | 
	
	res := db basicExecute: 'create table x (xk integer primary key, xv boolean);'.
	self assert: (res = 0).

	res := db basicExecute: 'begin'.
	self assert: (res = 0).
	s := db prepare: 'insert into x values (NULL, ?)'.
	s at: 1 putBoolean: true.
	s step. s finalize.
	res := db basicExecute: 'commit'.
	self assert: (res = 0).
	
	s := db prepare: 'select xv from x'.
	s basicExecute: [  :row |
		| v |
		v := row booleanAt: 0.
		self assert: v equals: true ].
	s finalize.
	
]

{ #category : #tests }
SQLite3ConnectionBasicTest >> testColumnNames [
	| columns |
	
	res := db basicExecute: 'create table x (xk integer, xv integer);'.
	self assert: (res = 0).
	columns := db columnNamesFor: 'x'.
	self assert: (columns size = 2).
	self assert: (columns first = 'xk').
	self assert: (columns second = 'xv').
	

]

{ #category : #tests }
SQLite3ConnectionBasicTest >> testColumnNamesBobbyStop [
	"In this test, Bobby Tables strikes again, but fails, because #columnNamesFor: uses parameter binding."
	| columns tables |
	
	res := db basicExecute: 'create table x (xk integer, xv integer);'.
	self assert: (res = 0).
	res := db basicExecute: 'create table students (sk integer, sname varchar);'.
	self assert: (res = 0).

	tables := db tableNames.
	self assert: (tables size = 2).
	self assert: (tables first = 'x').	
	self assert: (tables second = 'students').	
	
	columns := db columnNamesFor: 'x; drop table students; --'.
	self assert: (columns isNil).

	tables := db tableNames.
	self assert: (tables size = 2).
	self assert: (tables first = 'x').	
	self assert: (tables second = 'students').	


]

{ #category : #tests }
SQLite3ConnectionBasicTest >> testColumnNamesNoSuchTable [
	| columns |
	
	res := db basicExecute: 'create table x (xk integer, xv integer);'.
	self assert: (res = 0).
	columns := db columnNamesFor: 'y'.
	self assert: (columns isNil).
]

{ #category : #tests }
SQLite3ConnectionBasicTest >> testDataValuesAvailable [
	| s | 
	
	res := db basicExecute: 'create table x (xk integer primary key, iv integer, tv text);'.
	self assert: (res = 0).

	res := db basicExecute: 'insert into x values (NULL, 1, "duh");'.	
	self assert: (res = 0).
	
	s := db prepare: 'select * from x'.
	s basicExecute: [  :row |
		self assert: (row dataValuesAvailable = 3) ].
	s finalize.
	
]

{ #category : #tests }
SQLite3ConnectionBasicTest >> testDateAndTime [
	| data s | 
	
	data := DateAndTime year: 2015 month: 4 day: 1.
	
	res := db basicExecute: 'create table x (xv datetime);'.
	self assert: (res = 0).

	res := db basicExecute: 'begin'.
	self assert: (res = 0).
	s := db prepare: 'insert into x values (?)'.
	s at: 1 putDateTime: data.
	s step. s finalize.
	res := db basicExecute: 'commit'.
	self assert: (res = 0).
	
	s := db prepare: 'select xv from x'.
	s basicExecute: [  :row |
		| v |
		v := row dateTimeAt: 0.
		self assert: ((v year) = 2015).
		self assert: ((v month) = 4).
		self assert: ((v dayOfMonth) = 1) ].
	s finalize.
	
]

{ #category : #tests }
SQLite3ConnectionBasicTest >> testDeclaredColumnTypes [
	| columns |
	
	res := db basicExecute: 'create table x (xk integer, xv blob, xb boolean);'.
	self assert: (res = 0).
	columns := db declaredColumnTypesFor: 'x'.
	self assert: (columns size = 3).
	self assert: (columns first = 'integer').
	self assert: (columns second = 'blob').
	self assert: (columns third = 'boolean').
	

]

{ #category : #tests }
SQLite3ConnectionBasicTest >> testDefaultMultilingualStrings [
	| s idx | 
	
	res := db basicExecute: 'create table x (xk integer primary key, xm1 text default ''中文'', xm2 text default ''áěšřčá'');'.
	self assert: (res = 0).

	res := db basicExecute: 'begin'.
	self assert: (res = 0).
	(db prepare: 'insert into x (xk) values (NULL)')
		step;
		finalize.
	res := db basicExecute: 'commit'.
	self assert: (res = 0).
	
	s := db prepare: 'select xm1, xm2 from x order by xk'.
	s basicExecute: [  :row |
		self assert: (row stringAt: 0) equals: '中文' .
		self assert: (row stringAt: 1) equals: 'áěšřčá' ].
	s finalize.
	
]

{ #category : #tests }
SQLite3ConnectionBasicTest >> testDoubleClose [
	
	db close.
	[ db close ] on: SQLite3Misuse do: [ ]
	"#tearDown will close the db again, and is similarly guarded."
]

{ #category : #tests }
SQLite3ConnectionBasicTest >> testFloat [
	| s |	
	res := db basicExecute: 'create table x (xk integer primary key, xv real);'.
	self assert: (res = 0).
	res := db basicExecute: 'insert into x values (NULL, 1.141);'.
	self assert: (res = 0).
	
	s := db prepare: 'select * from x'.
	s basicExecute: [ :row |
		self assert: (row nameOfColumn: 1) equals: 'xv'.
		self assert: (row floatAt: 1) equals: 1.141 ].
	s finalize.

]

{ #category : #tests }
SQLite3ConnectionBasicTest >> testInteger [
	"The large integer comes from Glorp's testInt8."
	| s |	
		
	res := db basicExecute: 'create table x (xk integer primary key, xv integer);'.
	self assert: (res = 0).

	s := db prepare: 'insert into x values (NULL, ?)'.
	s at: 1 putInteger: 3212321555.
	s step. 		
	s finalize.	
	
	s := db prepare: 'select * from x'.
	s basicExecute: [ :row |
		self assert: (row nameOfColumn: 1) equals: 'xv'.
		self assert: (row integerAt: 1) equals: 3212321555 ].
	s finalize.

]

{ #category : #tests }
SQLite3ConnectionBasicTest >> testMultilingualStrings [
	| data s idx | 
	
	data := OrderedCollection with: 'English' with: '中文' with: 'にほんご', 'áěšřčá'.
	
	res := db basicExecute: 'create table x (xk integer primary key, xv varchar);'.
	self assert: (res = 0).

	res := db basicExecute: 'begin'.
	self assert: (res = 0).
	s := db prepare: 'insert into x values (NULL, ?)'.
	data do: [ :ea |
		s at: 1 putString: ea.
		s step; clearBindings; reset ].
	s finalize.
	res := db basicExecute: 'commit'.
	self assert: (res = 0).
	
	idx := 1.
	s := db prepare: 'select xv from x order by xk asc'.
	s basicExecute: [  :row |
		self assert: (row stringAt: 0) equals: (data at: idx).
		idx := idx + 1 ].
	s finalize.
	
]

{ #category : #tests }
SQLite3ConnectionBasicTest >> testMultilingualTableName [
	| s | 
	
	res := db basicExecute: 'create table 表一 (xk integer primary key, xm1 text default ''中文'');'.
	self assert: (res = 0).

	res := db basicExecute: 'begin'.
	self assert: (res = 0).
	(db prepare: 'insert into 表一 (xk) values (NULL)')
		step;
		finalize.
	res := db basicExecute: 'commit'.
	self assert: (res = 0).
	
	s := db prepare: 'select xm1 from 表一 order by xk'.
	s basicExecute: [  :row |
		self assert: (row stringAt: 0) equals: '中文' ].
	s finalize.
	
]

{ #category : #tests }
SQLite3ConnectionBasicTest >> testObjectBlob [
	| bytes s | 
	
	bytes := #[255 0 1].
	
	res := db basicExecute: 'create table x (xk integer primary key, xv blob);'.
	self assert: (res = 0).

	res := db basicExecute: 'begin'.
	self assert: (res = 0).
	s := db prepare: 'insert into x values (NULL, ?)'.
	s at: 1 putByteArray: bytes.
	s step. s finalize.
	res := db basicExecute: 'commit'.
	self assert: (res = 0).
	
	s := db prepare: 'select xv from x'.
	s basicExecute: [  :row |
		| v |
		v := row byteArrayAt: 0.
		self assert: v size equals: 3.
		self assert: v first equals: 255.
		self assert: v second equals: 0.
		self assert: v third equals: 1 ].
	s finalize.
	
]

{ #category : #tests }
SQLite3ConnectionBasicTest >> testPrepareStep [
	| s i sql | 
	
	res := db basicExecute: 'create table x (xk integer primary key, iv integer, tv text);'.
	self assert: (res = 0).

	res := db basicExecute: 'begin'.
	self assert: (res = 0).
	s := db prepare: 'insert into x values (NULL, ?, ?)'.
	sql := s sqlText.
	self assert: (sql = 'insert into x values (NULL, ?, ?)').
	1 to: 10 do: [ :x |
		s at: 1 putInteger: x * x.
		s at: 2 putString: x asString, ' * ', x asString.
		s step. s clearBindings. s reset. ].		
	s finalize.
	res := db basicExecute: 'commit'.
	self assert: (res = 0).
	
	s := db prepare: 'select * from x'.
	sql := s sqlText.
	self assert: (sql = 'select * from x').
	s basicExecute: [  :row |
		i := row integerAt: 0.
		self assert: (row integerAt: 1) equals: (i * i).
		self assert: (row stringAt: 2) equals: (i asString, ' * ', i asString) ].
	s finalize.
	
]

{ #category : #tests }
SQLite3ConnectionBasicTest >> testPrepareStepSelective [
	| s i sql count | 
	
	res := db basicExecute: 'create table x (xk integer primary key, iv integer, tv text);'.
	self assert: (res = 0).

	res := db basicExecute: 'begin'.
	self assert: (res = 0).
	s := db prepare: 'insert into x values (NULL, ?, ?)'.
	sql := s sqlText.
	self assert: (sql = 'insert into x values (NULL, ?, ?)').
	1 to: 10 do: [ :x |
		s at: 1 putInteger: x * x.
		s at: 2 putString: x asString, ' * ', x asString.
		s step. s clearBindings. s reset. ].		
	s finalize.
	res := db basicExecute: 'commit'.
	self assert: (res = 0).
	
	count := 0.
	s := db prepare: 'select * from x where iv < ?'.
	sql := s sqlText.
	self assert: (sql = 'select * from x where iv < ?').
	s at: 1 putInteger: 27.
	s basicExecute: [  :row |
		count := count + 1.
		i := row integerAt: 0.
		self assert: (row integerAt: 1) equals: (i * i).
		self assert: (row stringAt: 2) equals: (i asString, ' * ', i asString) ].
	s finalize.
	self assert: (count = 5)
]

{ #category : #tests }
SQLite3ConnectionBasicTest >> testResultSetColumnIntrospection [
	| s | 

	res := db basicExecute: 'create table x (xk integer primary key, iv integer, tv text);'.
	self assert: (res = 0).

	res := db basicExecute: 'insert into x values (NULL, 1, "duh");'.	
	self assert: (res = 0).
	
	s := db prepare: 'select * from x'.
	s basicExecute: [  :row |
		self assert: ((row nameOfColumn: 0) = 'xk').
		self assert: ((row valueOfColumn: 0) = 1).
		self assert: ((row nameOfColumn: 1) = 'iv').
		self assert: ((row valueOfColumn: 1) = 1).
		self assert: ((row nameOfColumn: 2) = 'tv').
		self assert: ((row valueOfColumn: 2) = 'duh') ].
	s finalize.
	
]

{ #category : #tests }
SQLite3ConnectionBasicTest >> testScaledDecimal [
	"This test is a simplified version of GlorpNumericTest>>tesNumeric."
	| s number float |
	
	number := Number readFrom: '12345678s'.
	float := number asFloat.

	res := db basicExecute: 'create table x (xk integer primary key, xv real);'.
	self assert: (res = 0).
	
	s := db prepare: 'insert into x values (NULL, ?)'.
	s at: 1 putFloat: number.
	s step. 		
	s finalize.	
	
	s := db prepare: 'select * from x'.
	s basicExecute: [ :row |
		self assert: (row nameOfColumn: 1) equals: 'xv'.
		self assert: (row floatAt: 1) equals: float ].
	s finalize.

]

{ #category : #tests }
SQLite3ConnectionBasicTest >> testTableNames [
	| tables |
	
	res := db basicExecute: 'create table x (xk integer, xv integer);'.
	self assert: (res = 0).
	tables := db tableNames.
	self assert: (tables size = 1).
	self assert: (tables first = 'x')
	

]

{ #category : #tests }
SQLite3ConnectionBasicTest >> testTableNamesOfEmptyDatabase [
	| tables |
	
	tables := db tableNames.
	self assert: (tables size = 0).
	

]

{ #category : #tests }
SQLite3ConnectionBasicTest >> testTime [
	"UDBCSQLite3 converts a given Time instance into a DateAndTime and stores that."
	| data today s | 
	
	data := Time noon.
	today := DateAndTime today.
	
	res := db basicExecute: 'create table x (xv time);'.
	self assert: (res = 0).

	res := db basicExecute: 'begin'.
	self assert: (res = 0).
	s := db prepare: 'insert into x values (?)'.
	s at: 1 putDateTime: data.
	s step. s finalize.
	res := db basicExecute: 'commit'.
	self assert: (res = 0).
	
	s := db prepare: 'select xv from x'.
	s basicExecute: [  :row |
		| v |
		v := row dateTimeAt: 0.
		self assert: ((v year) = today year).
		self assert: ((v month) = today month).
		self assert: ((v dayOfMonth) = today dayOfMonth).
		self assert: ((v hour) = data hour). 
		self assert: ((v minute) = data minute). 
		self assert: ((v second) = data second) ].
	s finalize.
	
]

{ #category : #tests }
SQLite3ConnectionBasicTest >> testTracing [
	| sql callback expected actual  |
	
	(SystemVersion current major >= 7) ifTrue: [ self skip ].
	"This test invokes a callback from SQLite to Pharo. It works in Pharo 6 and earlier but not in Pharo 7."
	
	sql := #('create table if not exists x (xk integer primary key, iv integer, tv text)'
			'insert into x values (NULL, 1, ''two'')'
			'drop table x').
			
	expected := String streamContents: [ :s |
		s nextPutAll: sql first; cr;
			nextPutAll: sql second; cr;
			nextPutAll: sql third; cr ].
	
	actual := WriteStream on: String new.
	
	callback := FFICallback 	
						signature: #(void (ExternalAddress appData, String sqlText))
						block: [ :appdata :sqltext |
							"We ignore appdata in this test, because we're passing a null pointer in."
							actual nextPutAll: sqltext; cr ].
	
	"The null pointer appears as appdata in the callback."
	db traceUsing: callback with: ExternalAddress new. 
	
	res := db basicExecute: sql first.
	self assert: (res = 0).
	
	res := db basicExecute: sql second.
	self assert: (res = 0).

	res := db basicExecute: sql third.
	self assert: (res = 0).

	self assert: (actual contents = expected)
	

]
