Class {
	#name : #ASDPORPlanung,
	#superclass : #Object,
	#instVars : [
		'users',
		'loggedUsers'
	],
	#classVars : [
		'WriteMutex'
	],
	#classInstVars : [
		'uniqueInstancePlanung'
	],
	#category : #'AsdPharoIde-Core-Utils'
}

{ #category : #voyage }
ASDPORPlanung class >> createUser [
	(ASDPORUser benutzerName: 'asdmundt' password: 'pwd') save
]

{ #category : #'class initialization' }
ASDPORPlanung class >> current [
	^ uniqueInstancePlanung ifNil: [ uniqueInstancePlanung := self new ]
]

{ #category : #'data sample' }
ASDPORPlanung class >> importDemoData [
| srs objects |
	srs := SixxReadStream readOnlyFileNamed: 'export.sixx'.
	objects := OrderedCollection new.
	[ srs atEnd ] whileFalse: [ objects add: srs next ].
	srs close.
	objects inspect
]

{ #category : #'class initialization' }
ASDPORPlanung class >> initialize [
	self reset
]

{ #category : #voyage }
ASDPORPlanung class >> initializeLocalhostMongoDB [
	| repository |
	repository := VOMongoRepository database: 'por'.
	repository enableSingleton
]

{ #category : #'class initialization' }
ASDPORPlanung class >> initializeVoyageOnMemoryDB [
VOMemoryRepository new enableSingleton
]

{ #category : #voyage }
ASDPORPlanung class >> isVoyageRoot [
   "Indicates that instances of this class are top level documents
    in noSQL databases"
   ^ true
]

{ #category : #'class initialization' }
ASDPORPlanung class >> reset [

	uniqueInstancePlanung := nil.
	VORepository current reset.
	self initializeLocalhostMongoDB
]

{ #category : #'default values' }
ASDPORPlanung class >> version [
^'1.0.0'
]

{ #category : #operations }
ASDPORPlanung >> addLoggedUser: aUser [
	self loggedUsers add: aUser
]

{ #category : #operations }
ASDPORPlanung >> allUsers [
	^ ASDPORUser selectAll
]

{ #category : #initialization }
ASDPORPlanung >> initialize [

	super initialize.
	loggedUsers := OrderedCollection new.
	users := OrderedCollection new.
]

{ #category : #accessing }
ASDPORPlanung >> loggedUsers [
	
	^ loggedUsers ifNil: [ loggedUsers := OrderedCollection new ]
]

{ #category : #accessing }
ASDPORPlanung >> loggedUsers: anObject [
	loggedUsers := anObject
]

{ #category : #operations }
ASDPORPlanung >> storeObject: anObject [
	anObject save
]

{ #category : #operations }
ASDPORPlanung >> storeUser: aUser [
	aUser save.
]

{ #category : #operations }
ASDPORPlanung >> userFromLogin: aLogin andPassword: aPassword [
	^ ASDPORUser
		selectOne: [ :each | each benutzerName = aLogin & (each password = aPassword) ]
]

{ #category : #accessing }
ASDPORPlanung >> users [
	^ users ifNil: [ users := OrderedCollection new ]
]

{ #category : #accessing }
ASDPORPlanung >> users: anObject [
	users := anObject
]
