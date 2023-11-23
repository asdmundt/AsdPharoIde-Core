Class {
	#name : #ASDPORRootComponent,
	#superclass : #ASDPORComponent,
	#traits : 'TRootDialogRenderer',
	#classTraits : 'TRootDialogRenderer classTrait',
	#instVars : [
		'header',
		'componentToDisplay',
		'componentInstances',
		'footer',
		'showLoginError',
		'rightPanel',
		'idDialog',
		'idPlayGrount'
	],
	#category : #'AsdPharoIde-Core-Core'
}

{ #category : #testing }
ASDPORRootComponent class >> canBeRoot [
	^ true
]

{ #category : #versions }
ASDPORRootComponent class >> development [
	^ true
]

{ #category : #initialization }
ASDPORRootComponent class >> initialize [

	self environment at: #WADevelopmentConfiguration
			ifPresent: [ :class | 
			WAAdmin applicationDefaults addParent: class instance ]. "Remove development tools."
	^ (WAAdmin register: self asApplicationAt: 'asdclassbrowser')
		  preferenceAt: #sessionClass put: ASDPORPSession;
		  addLibrary: JQDeploymentLibrary;
		  addLibrary: JQUiDeploymentLibrary;
		  addLibrary: MDLLibrary;
		  addLibrary: ASDPORLibrary;
		addLibrary: MonacoFileLibrary;
		 yourself
]

{ #category : #testing }
ASDPORRootComponent class >> isRpi [
^ true
]

{ #category : #versions }
ASDPORRootComponent class >> version [

	^ '0.1.0'
	
]

{ #category : #hooks }
ASDPORRootComponent >> children [
	^ {self header.
	self componentToDisplay.
	self rightPanel.
	}
]

{ #category : #accessing }
ASDPORRootComponent >> componentInstances [
	"I return a dictionary with browsers as keys and their instances as value if they were instantiated at least once."

	^ componentInstances
]

{ #category : #accessing }
ASDPORRootComponent >> componentInstances: aDictionary [
	componentInstances := aDictionary
]

{ #category : #accessing }
ASDPORRootComponent >> componentToDisplay [
	"Component instance to display in the application."
	
	^ componentToDisplay
]

{ #category : #accessing }
ASDPORRootComponent >> componentToDisplay: aComponent [
	componentToDisplay := aComponent
]

{ #category : #components }
ASDPORRootComponent >> defaultHeader [
	^ ASDBPORHeader new
]

{ #category : #updating }
ASDPORRootComponent >> displayInstanceOf: aComponentClass [
	self session resetStates.
	"self componentToDisplay: (self componentInstances at: aComponentClass ifAbsentPut: [ aComponentClass new ])"
	self componentToDisplay: (self componentInstances at: aComponentClass ifPresent:[aComponentClass new] ifAbsentPut: [ aComponentClass new ])
]

{ #category : #updating }
ASDPORRootComponent >> displayInstanceOfWithSessionState: aComponentClass [
	"self componentToDisplay: (self componentInstances at: aComponentClass ifAbsentPut: [ aComponentClass new ])"
	self componentToDisplay: (self componentInstances at: aComponentClass ifPresent:[ aComponentClass new ] ifAbsentPut: [  aComponentClass new ])
]

{ #category : #updating }
ASDPORRootComponent >> displayInstanceOfWithSessionStateAndAdd: aComponentClass [
	"self componentToDisplay: (self componentInstances at: aComponentClass ifAbsentPut: [ aComponentClass new ])"

	self componentToDisplay: (self componentInstances at: aComponentClass ifPresent: [ (aComponentClass new) addSelf ] ifAbsentPut: [ (aComponentClass new) addSelf ])
]

{ #category : #accessing }
ASDPORRootComponent >> footer [
	^ footer
]

{ #category : #accessing }
ASDPORRootComponent >> footer: aComponent [
	footer := aComponent
]

{ #category : #actions }
ASDPORRootComponent >> goToLoginView [

	self session setLoginError.
	 self displayInstanceOf: ASDPORLoginPage
]

{ #category : #actions }
ASDPORRootComponent >> goToOverviewView [
	self displayInstanceOf: ASDPORHomePage
]

{ #category : #accessing }
ASDPORRootComponent >> hasLoginError [
	^ showLoginError ifNil: [ false ]
]

{ #category : #accessing }
ASDPORRootComponent >> header [
	^ header
]

{ #category : #accessing }
ASDPORRootComponent >> header: aComponent [
	header := aComponent
]

{ #category : #accessing }
ASDPORRootComponent >> idDialog [
	^ 'idDialog'
]

{ #category : #accessing }
ASDPORRootComponent >> idPlayGrount [
	^ 'idPlayGrount'
]

{ #category : #hooks }
ASDPORRootComponent >> initialRequest: aRequest [

	| consumer pageName theClass |
	super initialRequest: aRequest.
	consumer := self requestContext consumer.

	"If we are at end, nothing to manage"
	consumer atEnd ifTrue: [ ^ self ].
	pageName := consumer peek asLowercase. "Do not make URLs case sensitive in that case"

	"Try to find a page corresponding"
	self header possiblePages detect: [ :each | 
			each pathName asLowercase = pageName ]
			ifFound: [ :class | 
				self displayInstanceOf: class.

				"If we find a page, we pop the subpart of the path corresponding to the page."
				consumer next
				].
	self session rootComponent class development ifTrue: [ 
			Transcript show:
					'#################initialRequest####################' ].
	aRequest fields at: 'class' ifPresent: [ :className | 
			Smalltalk at: className asSymbol ifPresent: [ :class | 
					theClass := (aRequest fields includesKey: 'meta') ifTrue: [ 
							            class class ]
							            ifFalse: [ class ].
				
					self session classBrowser setClass: theClass selector: nil.
					aRequest fields at: 'method' ifPresent: [ :selector | 
							self session classBrowser setClass: theClass
									selector: selector asSymbol
							]
					]
			]
]

{ #category : #initialization }
ASDPORRootComponent >> initialize [
	super initialize.
	self header: self defaultHeader.
	self session rootComponent: self.
	self rightPanel: ASDComponentWithRightPanel new.
	self componentInstances: Dictionary new.
	self session classBrowser: ASDPOClassBrowser new.
	self displayInstanceOf: self header possiblePages first
]

{ #category : #actions }
ASDPORRootComponent >> loginErrorOccured [
        showLoginError := true
]

{ #category : #rendering }
ASDPORRootComponent >> renderContentOn: html [
	html mdlLayout
		fixedHeader;
		with: [ html render: self header.
			html mdlLayoutContent
				class: 'mdl-color-text--grey-600';
				id: 'dhtmlwindowholder';
				with: [ html mdlGrid
						noSpacing;
						with: [ "noSpacing;""html render: self footer"
							html mdlCell
								class: 'rootComponent';
								size: 12;
								stretch;
								with: [ html div
										class: 'component-centered';
										id: #main;
										with: [ html render: self componentToDisplay ].
									html render: self rightPanel ] ] ] ].
	self renderEmptyGenericDialogOn: html
]

{ #category : #rendering }
ASDPORRootComponent >> renderRightPanel: html [

	html div
		shadow: 0;
		style: 'height: 700px; display: flex;';
		with: self rightPanel 
]

{ #category : #accessing }
ASDPORRootComponent >> rightPanel [
	^ rightPanel
]

{ #category : #accessing }
ASDPORRootComponent >> rightPanel: anObject [
	rightPanel := anObject
]

{ #category : #hooks }
ASDPORRootComponent >> states [
    ^ Array with: self
]

{ #category : #actions }
ASDPORRootComponent >> tryConnectionWithLogin: login andPassword: password [
	| user |
	user := self session model userFromLogin: login andPassword: password.
	"self halt."
	user
		ifNotNil: [ :arg | 
			self session currentUser: arg.

			"arg logged: true."
			self session model addLoggedUser: arg.
			self session first: true.
			self goToOverviewView
		]	
		ifNil: [ self session loginError.
			self goToLoginView ]
]

{ #category : #updating }
ASDPORRootComponent >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.
	anHtmlRoot beHtml5.
	anHtmlRoot title: 'ASDMundt Online Ide'.
	anHtmlRoot meta
		attributeAt: 'name' put: 'viewport';
		content: 'width=device-width, initial-scale=1'.
	"self updateTabIconRoot: anHtmlRoot."
	"anHtmlRoot stylesheet url: (WAUrl absolute: 'https://code.getmdl.io/1.3.0/material.blue_grey-blue.min.css').
	anHtmlRoot javascript add: 'hljs.initHighlightingOnLoad();'."
	anHtmlRoot javascript url:
			'https://cdnjs.cloudflare.com/ajax/libs/monaco-editor/0.15.6/min/vs/loader.js'.
	anHtmlRoot stylesheet url:
			'https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.18/themes/'
			, 'base' , '/jquery-ui.css'
]

{ #category : #updating }
ASDPORRootComponent >> updateUrl: aUrl [
	super updateUrl: aUrl.
	aUrl addToPath: (self componentToDisplay pathName)
]
