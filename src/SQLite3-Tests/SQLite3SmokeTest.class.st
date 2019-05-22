Class {
	#name : #SQLite3SmokeTest,
	#superclass : #TestCase,
	#instVars : [
		'connection'
	],
	#category : #'SQLite3-Tests'
}

{ #category : #'tables data' }
SQLite3SmokeTest >> agentsRows [
	^ #(('A007' 'Ramasundar' 'Bangalore' 0.15 '077-25814763' '')
('A003' 'Alex ' 'London' 0.13 '075-12458969' '')
('A008' 'Alford' 'New York' 0.12 '044-25874365' '')
('A011' 'Ravi Kumar' 'Bangalore' 0.15 '077-45625874' '')
('A010' 'Santakumar' 'Chennai' 0.14 '007-22388644' '')
('A012' 'Lucida' 'San Jose' 0.12 '044-52981425' '')
('A005' 'Anderson' 'Brisban' 0.13 '045-21447739' '')
('A001' 'Subbarao' 'Bangalore' 0.14 '077-12346674' '')
('A002' 'Mukesh' 'Mumbai' 0.11 '029-12358964' '')
('A006' 'McDen' 'London' 0.15 '078-22255588' '')
('A004' 'Ivan' 'Torento' 0.15 '008-22544166' '')
('A009' 'Benjamin' 'Hampshair' 0.11 '008-22536178' ''))
]

{ #category : #'tables data' }
SQLite3SmokeTest >> customersRows [
	^ #(('C00013' 'Holmes' 'London' 'London' 'UK' '2' '6000.00' '5000.00' '7000.00' '4000.00' 'BBBBBBB' 'A003')
('C00001' 'Micheal' 'New York' 'New York' 'USA' '2' '3000.00' '5000.00' '2000.00' '6000.00' 'CCCCCCC' 'A008')
('C00020' 'Albert' 'New York' 'New York' 'USA' '3' '5000.00' '7000.00' '6000.00' '6000.00' 'BBBBSBB' 'A008')
('C00025' 'Ravindran' 'Bangalore' 'Bangalore' 'India' '2' '5000.00' '7000.00' '4000.00' '8000.00' 'AVAVAVA' 'A011')
('C00024' 'Cook' 'London' 'London' 'UK' '2' '4000.00' '9000.00' '7000.00' '6000.00' 'FSDDSDF' 'A006')
('C00015' 'Stuart' 'London' 'London' 'UK' '1' '6000.00' '8000.00' '3000.00' '11000.00' 'GFSGERS' 'A003')
('C00002' 'Bolt' 'New York' 'New York' 'USA' '3' '5000.00' '7000.00' '9000.00' '3000.00' 'DDNRDRH' 'A008')
('C00018' 'Fleming' 'Brisban' 'Brisban' 'Australia' '2' '7000.00' '7000.00' '9000.00' '5000.00' 'NHBGVFC' 'A005')
('C00021' 'Jacks' 'Brisban' 'Brisban' 'Australia' '1' '7000.00' '7000.00' '7000.00' '7000.00' 'WERTGDF' 'A005')
('C00019' 'Yearannaidu' 'Chennai' 'Chennai' 'India' '1' '8000.00' '7000.00' '7000.00' '8000.00' 'ZZZZBFV' 'A010')
('C00005' 'Sasikant' 'Mumbai' 'Mumbai' 'India' '1' '7000.00' '11000.00' '7000.00' '11000.00' '147-25896312' 'A002')
('C00007' 'Ramanathan' 'Chennai' 'Chennai' 'India' '1' '7000.00' '11000.00' '9000.00' '9000.00' 'GHRDWSD' 'A010')
('C00022' 'Avinash' 'Mumbai' 'Mumbai' 'India' '2' '7000.00' '11000.00' '9000.00' '9000.00' '113-12345678''A002')
('C00004' 'Winston' 'Brisban' 'Brisban' 'Australia' '1' '5000.00' '8000.00' '7000.00' '6000.00' 'AAAAAAA' 'A005')
('C00023' 'Karl' 'London' 'London' 'UK' '0' '4000.00' '6000.00' '7000.00' '3000.00' 'AAAABAA' 'A006')
('C00006' 'Shilton' 'Torento' 'Torento' 'Canada' '1' '10000.00' '7000.00' '6000.00' '11000.00' 'DDDDDDD' 'A004')
('C00010' 'Charles' 'Hampshair' 'Hampshair' 'UK' '3' '6000.00' '4000.00' '5000.00' '5000.00' 'MMMMMMM' 'A009')
('C00017' 'Srinivas' 'Bangalore' 'Bangalore' 'India' '2' '8000.00' '4000.00' '3000.00' '9000.00' 'AAAAAAB' 'A007')
('C00012' 'Steven' 'San Jose' 'San Jose' 'USA' '1' '5000.00' '7000.00' '9000.00' '3000.00' 'KRFYGJK' 'A012')
('C00008' 'Karolina' 'Torento' 'Torento' 'Canada' '1' '7000.00' '7000.00' '9000.00' '5000.00' 'HJKORED' 'A004')
('C00003' 'Martin' 'Torento' 'Torento' 'Canada' '2' '8000.00' '7000.00' '7000.00' '8000.00' 'MJYURFD' 'A004')
('C00009' 'Ramesh' 'Mumbai' 'Mumbai' 'India' '3' '8000.00' '7000.00' '3000.00' '12000.00' 'Phone No' 'A002')
('C00014' 'Rangarappa' 'Bangalore' 'Bangalore' 'India' '2' '8000.00' '11000.00' '7000.00' '12000.00' 'AAAATGF' 'A001')
('C00016' 'Venkatpati' 'Bangalore' 'Bangalore' 'India' '2' '8000.00' '11000.00' '7000.00' '12000.00' 'JRTVFDD' 'A007')
('C00011' 'Sundariya' 'Chennai' 'Chennai' 'India' '3' '7000.00' '11000.00' '7000.00' '11000.00' 'PPHGRTS' 'A010'))

]

{ #category : #running }
SQLite3SmokeTest >> setUp [
	super setUp.
	connection := SQLite3Connection memory.
	connection open.
	
	connection execute: self w3cSampleDatabaseCreateTableAgentsQuery.
	connection execute: self w3cSampleDatabaseCreateTableCustomersQuery.
	connection execute: self w3cSampleDatabaseCreateTableOrdersQuery.
]

{ #category : #running }
SQLite3SmokeTest >> tearDown [
	connection close.
	super tearDown
]

{ #category : #tests }
SQLite3SmokeTest >> testInsertAllAgents [
	| result |
	self w3cAgentsInsertQueries linesDo: [ :sqlQuery |
		connection execute: sqlQuery ].
	
	result := connection execute: 'SELECT COUNT(*) AS nb_lines FROM AGENTS;'.
	self assert: (result rows first at: 'nb_lines') equals: 12.
	
	result := connection execute: 'SELECT AGENT_CODE, AGENT_NAME, WORKING_AREA, COMMISSION, PHONE_NO, COUNTRY AS nb_lines FROM AGENTS;'.
	self assertCollection: (result rows collect: #asArray) hasSameElements: self agentsRows
]

{ #category : #tests }
SQLite3SmokeTest >> testTableNames [
	self assertCollection: connection tableNames hasSameElements: #('CUSTOMER' 'ORDERS' 'AGENTS')
]

{ #category : #'tables data' }
SQLite3SmokeTest >> w3cAgentsInsertQueries [
	^ 'INSERT INTO AGENTS VALUES (''A007'', ''Ramasundar'', ''Bangalore'', ''0.15'', ''077-25814763'', '''');
INSERT INTO AGENTS VALUES (''A003'', ''Alex '', ''London'', ''0.13'', ''075-12458969'', '''');
INSERT INTO AGENTS VALUES (''A008'', ''Alford'', ''New York'', ''0.12'', ''044-25874365'', '''');
INSERT INTO AGENTS VALUES (''A011'', ''Ravi Kumar'', ''Bangalore'', ''0.15'', ''077-45625874'', '''');
INSERT INTO AGENTS VALUES (''A010'', ''Santakumar'', ''Chennai'', ''0.14'', ''007-22388644'', '''');
INSERT INTO AGENTS VALUES (''A012'', ''Lucida'', ''San Jose'', ''0.12'', ''044-52981425'', '''');
INSERT INTO AGENTS VALUES (''A005'', ''Anderson'', ''Brisban'', ''0.13'', ''045-21447739'', '''');
INSERT INTO AGENTS VALUES (''A001'', ''Subbarao'', ''Bangalore'', ''0.14'', ''077-12346674'', '''');
INSERT INTO AGENTS VALUES (''A002'', ''Mukesh'', ''Mumbai'', ''0.11'', ''029-12358964'', '''');
INSERT INTO AGENTS VALUES (''A006'', ''McDen'', ''London'', ''0.15'', ''078-22255588'', '''');
INSERT INTO AGENTS VALUES (''A004'', ''Ivan'', ''Torento'', ''0.15'', ''008-22544166'', '''');
INSERT INTO AGENTS VALUES (''A009'', ''Benjamin'', ''Hampshair'', ''0.11'', ''008-22536178'', '''');'
]

{ #category : #'tables data' }
SQLite3SmokeTest >> w3cCustomersInsertQueries [
	^ 'INSERT INTO CUSTOMER VALUES (''C00013'', ''Holmes'', ''London'', ''London'', ''UK'', ''2'', ''6000.00'', ''5000.00'', ''7000.00'', ''4000.00'', ''BBBBBBB'', ''A003'');
INSERT INTO CUSTOMER VALUES (''C00001'', ''Micheal'', ''New York'', ''New York'', ''USA'', ''2'', ''3000.00'', ''5000.00'', ''2000.00'', ''6000.00'', ''CCCCCCC'', ''A008'');
INSERT INTO CUSTOMER VALUES (''C00020'', ''Albert'', ''New York'', ''New York'', ''USA'', ''3'', ''5000.00'', ''7000.00'', ''6000.00'', ''6000.00'', ''BBBBSBB'', ''A008'');
INSERT INTO CUSTOMER VALUES (''C00025'', ''Ravindran'', ''Bangalore'', ''Bangalore'', ''India'', ''2'', ''5000.00'', ''7000.00'', ''4000.00'', ''8000.00'', ''AVAVAVA'', ''A011'');
INSERT INTO CUSTOMER VALUES (''C00024'', ''Cook'', ''London'', ''London'', ''UK'', ''2'', ''4000.00'', ''9000.00'', ''7000.00'', ''6000.00'', ''FSDDSDF'', ''A006'');
INSERT INTO CUSTOMER VALUES (''C00015'', ''Stuart'', ''London'', ''London'', ''UK'', ''1'', ''6000.00'', ''8000.00'', ''3000.00'', ''11000.00'', ''GFSGERS'', ''A003'');
INSERT INTO CUSTOMER VALUES (''C00002'', ''Bolt'', ''New York'', ''New York'', ''USA'', ''3'', ''5000.00'', ''7000.00'', ''9000.00'', ''3000.00'', ''DDNRDRH'', ''A008'');
INSERT INTO CUSTOMER VALUES (''C00018'', ''Fleming'', ''Brisban'', ''Brisban'', ''Australia'', ''2'', ''7000.00'', ''7000.00'', ''9000.00'', ''5000.00'', ''NHBGVFC'', ''A005'');
INSERT INTO CUSTOMER VALUES (''C00021'', ''Jacks'', ''Brisban'', ''Brisban'', ''Australia'', ''1'', ''7000.00'', ''7000.00'', ''7000.00'', ''7000.00'', ''WERTGDF'', ''A005'');
INSERT INTO CUSTOMER VALUES (''C00019'', ''Yearannaidu'', ''Chennai'', ''Chennai'', ''India'', ''1'', ''8000.00'', ''7000.00'', ''7000.00'', ''8000.00'', ''ZZZZBFV'', ''A010'');
INSERT INTO CUSTOMER VALUES (''C00005'', ''Sasikant'', ''Mumbai'', ''Mumbai'', ''India'', ''1'', ''7000.00'', ''11000.00'', ''7000.00'', ''11000.00'', ''147-25896312'', ''A002'');
INSERT INTO CUSTOMER VALUES (''C00007'', ''Ramanathan'', ''Chennai'', ''Chennai'', ''India'', ''1'', ''7000.00'', ''11000.00'', ''9000.00'', ''9000.00'', ''GHRDWSD'', ''A010'');
INSERT INTO CUSTOMER VALUES (''C00022'', ''Avinash'', ''Mumbai'', ''Mumbai'', ''India'', ''2'', ''7000.00'', ''11000.00'', ''9000.00'', ''9000.00'', ''113-12345678'',''A002'');
INSERT INTO CUSTOMER VALUES (''C00004'', ''Winston'', ''Brisban'', ''Brisban'', ''Australia'', ''1'', ''5000.00'', ''8000.00'', ''7000.00'', ''6000.00'', ''AAAAAAA'', ''A005'');
INSERT INTO CUSTOMER VALUES (''C00023'', ''Karl'', ''London'', ''London'', ''UK'', ''0'', ''4000.00'', ''6000.00'', ''7000.00'', ''3000.00'', ''AAAABAA'', ''A006'');
INSERT INTO CUSTOMER VALUES (''C00006'', ''Shilton'', ''Torento'', ''Torento'', ''Canada'', ''1'', ''10000.00'', ''7000.00'', ''6000.00'', ''11000.00'', ''DDDDDDD'', ''A004'');
INSERT INTO CUSTOMER VALUES (''C00010'', ''Charles'', ''Hampshair'', ''Hampshair'', ''UK'', ''3'', ''6000.00'', ''4000.00'', ''5000.00'', ''5000.00'', ''MMMMMMM'', ''A009'');
INSERT INTO CUSTOMER VALUES (''C00017'', ''Srinivas'', ''Bangalore'', ''Bangalore'', ''India'', ''2'', ''8000.00'', ''4000.00'', ''3000.00'', ''9000.00'', ''AAAAAAB'', ''A007'');
INSERT INTO CUSTOMER VALUES (''C00012'', ''Steven'', ''San Jose'', ''San Jose'', ''USA'', ''1'', ''5000.00'', ''7000.00'', ''9000.00'', ''3000.00'', ''KRFYGJK'', ''A012'');
INSERT INTO CUSTOMER VALUES (''C00008'', ''Karolina'', ''Torento'', ''Torento'', ''Canada'', ''1'', ''7000.00'', ''7000.00'', ''9000.00'', ''5000.00'', ''HJKORED'', ''A004'');
INSERT INTO CUSTOMER VALUES (''C00003'', ''Martin'', ''Torento'', ''Torento'', ''Canada'', ''2'', ''8000.00'', ''7000.00'', ''7000.00'', ''8000.00'', ''MJYURFD'', ''A004'');
INSERT INTO CUSTOMER VALUES (''C00009'', ''Ramesh'', ''Mumbai'', ''Mumbai'', ''India'', ''3'', ''8000.00'', ''7000.00'', ''3000.00'', ''12000.00'', ''Phone No'', ''A002'');
INSERT INTO CUSTOMER VALUES (''C00014'', ''Rangarappa'', ''Bangalore'', ''Bangalore'', ''India'', ''2'', ''8000.00'', ''11000.00'', ''7000.00'', ''12000.00'', ''AAAATGF'', ''A001'');
INSERT INTO CUSTOMER VALUES (''C00016'', ''Venkatpati'', ''Bangalore'', ''Bangalore'', ''India'', ''2'', ''8000.00'', ''11000.00'', ''7000.00'', ''12000.00'', ''JRTVFDD'', ''A007'');
INSERT INTO CUSTOMER VALUES (''C00011'', ''Sundariya'', ''Chennai'', ''Chennai'', ''India'', ''3'', ''7000.00'', ''11000.00'', ''7000.00'', ''11000.00'', ''PPHGRTS'', ''A010'');'
]

{ #category : #'tables data' }
SQLite3SmokeTest >> w3cOrdersInsertQueries [
	^ 'INSERT INTO ORDERS VALUES(''200100'', ''1000.00'', ''600.00'', ''08/01/2008'', ''C00013'', ''A003'', ''SOD'');
INSERT INTO ORDERS VALUES(''200110'', ''3000.00'', ''500.00'', ''04/15/2008'', ''C00019'', ''A010'', ''SOD'');
INSERT INTO ORDERS VALUES(''200107'', ''4500.00'', ''900.00'', ''08/30/2008'', ''C00007'', ''A010'', ''SOD'');
INSERT INTO ORDERS VALUES(''200112'', ''2000.00'', ''400.00'', ''05/30/2008'', ''C00016'', ''A007'', ''SOD''); 
INSERT INTO ORDERS VALUES(''200113'', ''4000.00'', ''600.00'', ''06/10/2008'', ''C00022'', ''A002'', ''SOD'');
INSERT INTO ORDERS VALUES(''200102'', ''2000.00'', ''300.00'', ''05/25/2008'', ''C00012'', ''A012'', ''SOD'');
INSERT INTO ORDERS VALUES(''200114'', ''3500.00'', ''2000.00'', ''08/15/2008'', ''C00002'', ''A008'', ''SOD'');
INSERT INTO ORDERS VALUES(''200122'', ''2500.00'', ''400.00'', ''09/16/2008'', ''C00003'', ''A004'', ''SOD'');
INSERT INTO ORDERS VALUES(''200118'', ''500.00'', ''100.00'', ''07/20/2008'', ''C00023'', ''A006'', ''SOD'');
INSERT INTO ORDERS VALUES(''200119'', ''4000.00'', ''700.00'', ''09/16/2008'', ''C00007'', ''A010'', ''SOD'');
INSERT INTO ORDERS VALUES(''200121'', ''1500.00'', ''600.00'', ''09/23/2008'', ''C00008'', ''A004'', ''SOD'');
INSERT INTO ORDERS VALUES(''200130'', ''2500.00'', ''400.00'', ''07/30/2008'', ''C00025'', ''A011'', ''SOD'');
INSERT INTO ORDERS VALUES(''200134'', ''4200.00'', ''1800.00'', ''09/25/2008'', ''C00004'', ''A005'', ''SOD'');
INSERT INTO ORDERS VALUES(''200108'', ''4000.00'', ''600.00'', ''02/15/2008'', ''C00008'', ''A004'', ''SOD'');
INSERT INTO ORDERS VALUES(''200103'', ''1500.00'', ''700.00'', ''05/15/2008'', ''C00021'', ''A005'', ''SOD'');
INSERT INTO ORDERS VALUES(''200105'', ''2500.00'', ''500.00'', ''07/18/2008'', ''C00025'', ''A011'', ''SOD'');
INSERT INTO ORDERS VALUES(''200109'', ''3500.00'', ''800.00'', ''07/30/2008'', ''C00011'', ''A010'', ''SOD'');
INSERT INTO ORDERS VALUES(''200101'', ''3000.00'', ''1000.00'', ''07/15/2008'', ''C00001'', ''A008'', ''SOD'');
INSERT INTO ORDERS VALUES(''200111'', ''1000.00'', ''300.00'', ''07/10/2008'', ''C00020'', ''A008'', ''SOD'');
INSERT INTO ORDERS VALUES(''200104'', ''1500.00'', ''500.00'', ''03/13/2008'', ''C00006'', ''A004'', ''SOD'');
INSERT INTO ORDERS VALUES(''200106'', ''2500.00'', ''700.00'', ''04/20/2008'', ''C00005'', ''A002'', ''SOD'');
INSERT INTO ORDERS VALUES(''200125'', ''2000.00'', ''600.00'', ''10/10/2008'', ''C00018'', ''A005'', ''SOD'');
INSERT INTO ORDERS VALUES(''200117'', ''800.00'', ''200.00'', ''10/20/2008'', ''C00014'', ''A001'', ''SOD'');
INSERT INTO ORDERS VALUES(''200123'', ''500.00'', ''100.00'', ''09/16/2008'', ''C00022'', ''A002'', ''SOD'');
INSERT INTO ORDERS VALUES(''200120'', ''500.00'', ''100.00'', ''07/20/2008'', ''C00009'', ''A002'', ''SOD'');
INSERT INTO ORDERS VALUES(''200116'', ''500.00'', ''100.00'', ''07/13/2008'', ''C00010'', ''A009'', ''SOD'');
INSERT INTO ORDERS VALUES(''200124'', ''500.00'', ''100.00'', ''06/20/2008'', ''C00017'', ''A007'', ''SOD''); 
INSERT INTO ORDERS VALUES(''200126'', ''500.00'', ''100.00'', ''06/24/2008'', ''C00022'', ''A002'', ''SOD'');
INSERT INTO ORDERS VALUES(''200129'', ''2500.00'', ''500.00'', ''07/20/2008'', ''C00024'', ''A006'', ''SOD'');
INSERT INTO ORDERS VALUES(''200127'', ''2500.00'', ''400.00'', ''07/20/2008'', ''C00015'', ''A003'', ''SOD'');
INSERT INTO ORDERS VALUES(''200128'', ''3500.00'', ''1500.00'', ''07/20/2008'', ''C00009'', ''A002'', ''SOD'');
INSERT INTO ORDERS VALUES(''200135'', ''2000.00'', ''800.00'', ''09/16/2008'', ''C00007'', ''A010'', ''SOD'');
INSERT INTO ORDERS VALUES(''200131'', ''900.00'', ''150.00'', ''08/26/2008'', ''C00012'', ''A012'', ''SOD'');
INSERT INTO ORDERS VALUES(''200133'', ''1200.00'', ''400.00'', ''06/29/2008'', ''C00009'', ''A002'', ''SOD'');'
]

{ #category : #'create table statements' }
SQLite3SmokeTest >> w3cSampleDatabaseCreateTableAgentsQuery [
	"Copied from https://www.w3resource.com/sql/sql-table.php"
	^ 'CREATE TABLE  "AGENTS" 
   (	
    "AGENT_CODE" CHAR(6) NOT NULL PRIMARY KEY, 
	"AGENT_NAME" CHAR(40), 
	"WORKING_AREA" CHAR(35), 
	"COMMISSION" NUMBER(10,2), 
	"PHONE_NO" CHAR(15), 
	"COUNTRY" VARCHAR2(25) 
	 );
'
]

{ #category : #'create table statements' }
SQLite3SmokeTest >> w3cSampleDatabaseCreateTableCustomersQuery [
	"Copied from https://www.w3resource.com/sql/sql-table.php"
	^ 'CREATE TABLE  "CUSTOMER" 
   (	"CUST_CODE" VARCHAR2(6) NOT NULL PRIMARY KEY, 
	"CUST_NAME" VARCHAR2(40) NOT NULL, 
	"CUST_CITY" CHAR(35), 
	"WORKING_AREA" VARCHAR2(35) NOT NULL, 
	"CUST_COUNTRY" VARCHAR2(20) NOT NULL, 
	"GRADE" NUMBER, 
	"OPENING_AMT" NUMBER(12,2) NOT NULL, 
	"RECEIVE_AMT" NUMBER(12,2) NOT NULL, 
	"PAYMENT_AMT" NUMBER(12,2) NOT NULL, 
	"OUTSTANDING_AMT" NUMBER(12,2) NOT NULL, 
	"PHONE_NO" VARCHAR2(17) NOT NULL, 
	"AGENT_CODE" CHAR(6) NOT NULL REFERENCES AGENTS
);   
'
]

{ #category : #'create table statements' }
SQLite3SmokeTest >> w3cSampleDatabaseCreateTableOrdersQuery [
	"Copied from https://www.w3resource.com/sql/sql-table.php"
	^ 'CREATE TABLE  "ORDERS" 
   (
        "ORD_NUM" NUMBER(6,0) NOT NULL PRIMARY KEY, 
	"ORD_AMOUNT" NUMBER(12,2) NOT NULL, 
	"ADVANCE_AMOUNT" NUMBER(12,2) NOT NULL, 
	"ORD_DATE" DATE NOT NULL, 
	"CUST_CODE" VARCHAR2(6) NOT NULL REFERENCES CUSTOMER, 
	"AGENT_CODE" CHAR(6) NOT NULL REFERENCES AGENTS, 
	"ORD_DESCRIPTION" VARCHAR2(60) NOT NULL
   );
'
]
