Class {
	#name : #ASDPORPageModules,
	#superclass : #ASDPORPageLogin,
	#category : #'AsdPharoIde-Core-Core'
}

{ #category : #testing }
ASDPORPageModules class >> isAbstract [
	^ self = ASDPORPageModules
]

{ #category : #accessing }
ASDPORPageModules class >> pageName [
	"Title of the page that will be used in menus and URLs."

	^ self subclassResponsibility
]

{ #category : #accessing }
ASDPORPageModules class >> pagesToDisplay [
	^ (self allSubclasses reject: #isAbstract) sorted: #priority ascending
]

{ #category : #accessing }
ASDPORPageModules class >> pathName [
	"Use to define the URL name"

	^ self pageName copyWithout: $  
]

{ #category : #accessing }
ASDPORPageModules class >> priority [
	^ self subclassResponsibility
]

{ #category : #accessing }
ASDPORPageModules >> pathName [
	^ self class pathName
]
