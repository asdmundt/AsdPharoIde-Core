Class {
	#name : #ASDPORComponent,
	#superclass : #WAComponent,
	#category : #'AsdPharoIde-Core-Core'
}

{ #category : #actions }
ASDPORComponent >> addSelf [
	self subclassResponsibility
]

{ #category : #convenience }
ASDPORComponent >> display: aComponentInstance [
	"Set a component instance as the component to display by the root component."

	self rootComponent componentToDisplay: aComponentInstance
]

{ #category : #convenience }
ASDPORComponent >> displayInstanceOf: aComponentClass [
	"Set a component class as the component to display by the root component."

	self rootComponent displayInstanceOf: aComponentClass
]

{ #category : #convenience }
ASDPORComponent >> displayInstanceOfWithSessionState: aComponentClass [
	"Set a component class as the component to display by the root component."

	self rootComponent displayInstanceOfWithSessionState: aComponentClass
]

{ #category : #convenience }
ASDPORComponent >> displayInstanceOfWithSessionStateAndAdd: aComponentClass [
	"Set a component class as the component to display by the root component."

	self rootComponent displayInstanceOfWithSessionStateAndAdd: aComponentClass
]

{ #category : #accessing }
ASDPORComponent >> rootComponent [
	^ self session rootComponent
]
