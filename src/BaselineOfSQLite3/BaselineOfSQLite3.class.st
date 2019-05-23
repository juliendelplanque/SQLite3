Class {
	#name : #BaselineOfSQLite3,
	#superclass : #BaselineOf,
	#category : #BaselineOfSQLite3
}

{ #category : #baselines }
BaselineOfSQLite3 >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			spec
				package: 'SQLite3';
				package: 'SQLite3-Tests' with: [ spec requires: 'SQLite3' ];
				package: 'SQLite3-Deprecated' with: [ spec requires: 'SQLite3' ] ]
]
