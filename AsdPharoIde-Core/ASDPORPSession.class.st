Class {
	#name : #ASDPORPSession,
	#superclass : #WASession,
	#instVars : [
		'currentUser',
		'rootComponent',
		'task',
		'model',
		'first',
		'loginError',
		'classBrowser',
		'selectedPackage',
		'selectedClass',
		'selectedMessageCategory',
		'selectedMethod'
	],
	#category : #'AsdPharoIde-Core-Utils'
}

{ #category : #accessing }
ASDPORPSession >> classBrowser [

	^ classBrowser
]

{ #category : #accessing }
ASDPORPSession >> classBrowser: anObject [

	classBrowser := anObject
]

{ #category : #accessing }
ASDPORPSession >> currentUser [
	^ currentUser
]

{ #category : #accessing }
ASDPORPSession >> currentUser: anObject [
	currentUser := anObject
]

{ #category : #accessing }
ASDPORPSession >> first [
	^ first
]

{ #category : #accessing }
ASDPORPSession >> first: anObject [
	first := anObject
]

{ #category : #initialize }
ASDPORPSession >> initialize [
	super initialize.
	self model: ASDPORPlanung current.
]

{ #category : #testing }
ASDPORPSession >> isLogged [
	^ self currentUser notNil
]

{ #category : #accessing }
ASDPORPSession >> loginError [
	^ loginError
]

{ #category : #accessing }
ASDPORPSession >> loginError: anObject [
	loginError := anObject
]

{ #category : #accessing }
ASDPORPSession >> model [
	^ model
]

{ #category : #accessing }
ASDPORPSession >> model: anObject [
	model := anObject
]

{ #category : #operations }
ASDPORPSession >> reset [
	currentUser := nil.
	self requestContext redirectTo: self application url.
	self unregister
]

{ #category : #operations }
ASDPORPSession >> resetStates [

]

{ #category : #accessing }
ASDPORPSession >> rootComponent [
	^ rootComponent
]

{ #category : #accessing }
ASDPORPSession >> rootComponent: aRootComponent [
	rootComponent := aRootComponent
]

{ #category : #accessing }
ASDPORPSession >> selectedClass [

	^ selectedClass
]

{ #category : #accessing }
ASDPORPSession >> selectedClass: anObject [

	selectedPackage := nil.
	selectedClass := anObject.
	selectedMessageCategory := nil.
	selectedMethod := nil
]

{ #category : #accessing }
ASDPORPSession >> selectedMessageCategory [

	^ selectedMessageCategory
]

{ #category : #accessing }
ASDPORPSession >> selectedMessageCategory: anObject [

	selectedPackage := nil.
	selectedClass := nil.
	selectedMessageCategory := anObject.
	selectedMethod := nil
]

{ #category : #accessing }
ASDPORPSession >> selectedMethod [

	^ selectedMethod
]

{ #category : #accessing }
ASDPORPSession >> selectedMethod: anObject [

	selectedPackage := nil.
	selectedClass := nil.
	selectedMessageCategory := nil.
	selectedMethod := anObject
]

{ #category : #accessing }
ASDPORPSession >> selectedPackage [

	^ selectedPackage
]

{ #category : #accessing }
ASDPORPSession >> selectedPackage: anObject [

	selectedPackage := anObject.
	selectedClass := nil.
	selectedMessageCategory := nil.
	selectedMethod := nil.
]

{ #category : #operations }
ASDPORPSession >> setLoginError [

self loginError: true
]
