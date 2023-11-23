Class {
	#name : #ASDPORPage,
	#superclass : #ASDPORComponent,
	#category : #'AsdPharoIde-Core-Core'
}

{ #category : #testing }
ASDPORPage class >> isAbstract [
	^ self = ASDPORPage
]

{ #category : #accessing }
ASDPORPage class >> pageName [
	"Title of the page that will be used in menus and URLs."

	^ self subclassResponsibility
]

{ #category : #accessing }
ASDPORPage class >> pagesToDisplay [
	^ (self allSubclasses reject: #isAbstract) sorted: #priority ascending
]

{ #category : #accessing }
ASDPORPage class >> pathName [
	"Use to define the URL name"

	^ self pageName copyWithout: $  
]

{ #category : #accessing }
ASDPORPage class >> priority [
	^ self subclassResponsibility
]

{ #category : #accessing }
ASDPORPage >> pathName [
	^ self class pathName
]
