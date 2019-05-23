# SQLite3
[![Build Status](https://travis-ci.org/juliendelplanque/Sqlite.svg?branch=master)](https://travis-ci.org/juliendelplanque/Sqlite)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Pharo version](https://img.shields.io/badge/Pharo-6.1-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-7.0-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-8.0-%23aac9ff.svg)](https://pharo.org/download)

A clean SQLite FFI binding for Pharo for those who only want to use SQLite easily without any overlayer.

# Install

```st
Metacello new
	repository: 'github://juliendelplanque/SQLite3/src';
	baseline: 'SQLite3';
	load
```

# Acknowledgements
This project is a fork of the 'UDBC-SQLite-Base' package of [Pharo-UDBC](https://github.com/astares/Pharo-UDBC) project which itself seems to have forked part of the code of [Garage](https://github.com/pharo-rdbms/garage).

Wherever this code comes from originally, thanks to all the contributors who enhanced this project over time.
