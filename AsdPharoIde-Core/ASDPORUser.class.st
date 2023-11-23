Class {
	#name : #ASDPORUser,
	#superclass : #ASDPORModel,
	#instVars : [
		'gmail',
		'pwdGmail',
		'password',
		'vorname',
		'nachname',
		'admin',
		'logged',
		'indexInstall',
		'indexLoggedUser',
		'benutzerName',
		'instReady',
		'isInstallReady'
	],
	#category : #'AsdPharoIde-Core-Model'
}

{ #category : #'instance creation' }
ASDPORUser class >> benutzerName: login password: password [
	^ self new
		benutzerName: login;
		password: password;
		yourself
]

{ #category : #'instance creation' }
ASDPORUser class >> benutzerName: login password: password admin: anAdmin [
	^ self new
		benutzerName: login;
		password: password;
		admin: anAdmin;
		yourself
]

{ #category : #voyage }
ASDPORUser class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #'instance creation' }
ASDPORUser class >> login: login password: password [
	^ self new
benutzerName: login;
		password: password;
		yourself
]

{ #category : #'instance creation' }
ASDPORUser class >> login: login password: password admin: anAdmin [
	^ self new
		benutzerName: login;
		password: password;
		admin: anAdmin;
		yourself
]

{ #category : #accessing }
ASDPORUser >> admin [
	^ admin
]

{ #category : #accessing }
ASDPORUser >> admin: anObject [
	admin := anObject
]

{ #category : #accessing }
ASDPORUser >> benutzerName [
	^ benutzerName
]

{ #category : #accessing }
ASDPORUser >> benutzerName: anObject [
	benutzerName := anObject
]

{ #category : #'magritte descriptions' }
ASDPORUser >> benutzerNameDescription [
	<magritteDescription>
	^ MAStringDescription new
		priority: 30;
		label: 'Benutzer';
		accessor: #benutzerName;
		beRequired;
		requiredErrorMessage: 'Bitte Ihren Benutzernamen eingeben';
		comment: 'Bitte Ihren Benutzernamen eingeben';
		componentClass: MDLMATextInputComponent;
		yourself
]

{ #category : #'magritte descriptions' }
ASDPORUser >> descriptionContainer [
	<magritteContainer>
	^ super descriptionContainer
		componentRenderer: MDLMAFormRenderer;
		yourself
]

{ #category : #accessing }
ASDPORUser >> gmail [
	^ gmail
]

{ #category : #accessing }
ASDPORUser >> gmail: anObject [
	gmail := anObject
]

{ #category : #'magritte descriptions' }
ASDPORUser >> gmailDescription [
	<magritteDescription>
	^ MAStringDescription new
		priority: 10;
		label: 'Gmail Adr.';
		accessor: #gmail;
		comment: 'bitte Ihre Email Adresse eingeben';
		componentClass: MDLMATextInputComponent;
		yourself
]

{ #category : #accessing }
ASDPORUser >> indexInstall [
	^ indexInstall ifNil: [ indexInstall := 1 ]
]

{ #category : #accessing }
ASDPORUser >> indexInstall: anObject [
	indexInstall := anObject
]

{ #category : #accessing }
ASDPORUser >> indexLoggedUser [
	^ indexLoggedUser
]

{ #category : #accessing }
ASDPORUser >> indexLoggedUser: anObject [
	indexLoggedUser := anObject
]

{ #category : #initialization }
ASDPORUser >> initialize [
	super initialize.
	self logged: false.
	self admin: false.
	self indexLoggedUser: nil.
]

{ #category : #accessing }
ASDPORUser >> instReady [
	^ instReady ifNil: [instReady := false]
]

{ #category : #accessing }
ASDPORUser >> instReady: anObject [
	instReady := anObject
]

{ #category : #testing }
ASDPORUser >> isAdmin [ 
^ self admin
]

{ #category : #accessing }
ASDPORUser >> isInstallReady [
	^ isInstallReady
]

{ #category : #testing }
ASDPORUser >> isLogged [
	^ self logged
]

{ #category : #accessing }
ASDPORUser >> logged [
	^ logged
]

{ #category : #accessing }
ASDPORUser >> logged: anObject [
	logged := anObject
]

{ #category : #accessing }
ASDPORUser >> nachname [
	^ nachname
]

{ #category : #accessing }
ASDPORUser >> nachname: anObject [
	nachname := anObject
]

{ #category : #'magritte descriptions' }
ASDPORUser >> nachnameDescription [
	<magritteDescription>
	^ MAStringDescription new
		priority: 20;
		label: 'Nachname';
		accessor: #nachname;
		beRequired;
		requiredErrorMessage: 'Bitte geben Sie Ihren Nachnamen ein';
		comment: 'Bitte Ihren Nachnamen eingeben';
		componentClass: MDLMATextInputComponent;
		yourself
]

{ #category : #accessing }
ASDPORUser >> password [
	^ password
]

{ #category : #accessing }
ASDPORUser >> password: anObject [
	password := anObject
]

{ #category : #'magritte descriptions' }
ASDPORUser >> passwordDescription [
	<magritteDescription>
	^ MAStringDescription new
		priority: 40;
		label: 'Password';
		accessor: #password;
		beRequired;
		requiredErrorMessage: 'Bitte Ihr Passwort eingeben';
		comment: 'Bitte Ihr Passwort eingeben';
		componentClass: MDLMATextInputComponent;
		yourself
]

{ #category : #accessing }
ASDPORUser >> pwdGmail [
	^ pwdGmail
]

{ #category : #accessing }
ASDPORUser >> pwdGmail: anObject [
	pwdGmail := anObject
]

{ #category : #'magritte descriptions' }
ASDPORUser >> pwdGmailDescription [
	<magritteDescription>
	^ MAStringDescription new
		priority: 10;
		label: 'Password Gmail';
		accessor: #pwdGmail;
		beRequired;
		requiredErrorMessage: 'Bitte Ihr Gmail Passwort eingeben';
		comment: 'Bitte Ihr Gmail Passwort eingeben';
		componentClass: MDLMATextInputComponent;
		yourself
]

{ #category : #accessing }
ASDPORUser >> vorname [
	^ vorname
]

{ #category : #accessing }
ASDPORUser >> vorname: anObject [
	vorname := anObject
]

{ #category : #'magritte descriptions' }
ASDPORUser >> vornameDescription [
	<magritteDescription>
	^ MAStringDescription new
		priority: 10;
		label: 'Vorname';
		accessor: #vorname;
		beRequired;
		requiredErrorMessage: 'Bitte Ihren Vornamen eingeben';
		comment: 'Bitte Ihren Vornamen eingeben';
		componentClass: MDLMATextInputComponent;
		yourself
]
