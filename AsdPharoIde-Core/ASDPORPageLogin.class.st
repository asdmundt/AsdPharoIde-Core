Class {
	#name : #ASDPORPageLogin,
	#superclass : #ASDPORComponent,
	#category : #'AsdPharoIde-Core-Core'
}

{ #category : #testing }
ASDPORPageLogin class >> isAbstract [
	^ self = ASDPORPageLogin
]

{ #category : #accessing }
ASDPORPageLogin class >> pageName [
	"Title of the page that will be used in menus and URLs."

	^ self subclassResponsibility
]

{ #category : #accessing }
ASDPORPageLogin class >> pagesToDisplay [
	^ (self allSubclasses reject: #isAbstract) sorted: #priority ascending
]

{ #category : #accessing }
ASDPORPageLogin class >> pathName [
	"Use to define the URL name"

	^ self pageName copyWithout: $  
]

{ #category : #accessing }
ASDPORPageLogin class >> priority [
	^ self subclassResponsibility
]

{ #category : #accessing }
ASDPORPageLogin >> pathName [
	^ self class pathName
]
