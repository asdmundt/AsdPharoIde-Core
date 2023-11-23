Class {
	#name : #ASDBPORHeader,
	#superclass : #ASDPORComponent,
	#category : #'AsdPharoIde-Core-Component'
}

{ #category : #rendering }
ASDBPORHeader >> __renderContentOn: html [
	html mdlLayout
		with: [ html mdlLayoutHeader
				with: [ html
						mdlLayoutHeaderRow: [ html mdlLayoutTitle: 'Title'.
							html mdlLayoutSpacer.
							html mdlNavigation: [ self possiblePages do: [ :aClass | html mdlNavigationLink: 'Link' ] ] ] ].
			html
				mdlLayoutDrawer: [ html mdlLayoutTitle: 'Title'.
					html mdlNavigation: [ 1 to: 5 do: [ :i | html mdlNavigationLink: 'Link' ] ] ].
			html mdlLayoutContent: [  ] ]
]

{ #category : #rendering }
ASDBPORHeader >> _renderContentOn: html [
	html mdlLayout
		with: [ html mdlLayoutHeader
				with:
					[ "style: 'background: url(''http://localhost/FrankfurtSkylineII.jpg'') ;';"
					html
						mdlLayoutHeaderRow: [ html mdlNavigationLink
								callback: [ "Just refresh" ];
								with: [ html mdlLayoutTitle: 'Mediadaten Verwaltung   ' ].
							html mdlLayoutSpacer.
							self renderButtonsOn: html ].
					html
						mdlLayoutTabBar: [ self possiblePages
								do: [ :aClass | 
									html mdlLayoutTab
										callback: [ self displayInstanceOf: aClass ];
										isActiveIf: aClass = self rootComponent componentToDisplay class;
										with: aClass pageName ] ] ] ]
]

{ #category : #accessing }
ASDBPORHeader >> possiblePages [
self session isLogged
		ifTrue: [^ ASDPORPageModules pagesToDisplay]
		ifFalse: [ ^ ASDPORPage pagesToDisplay ]
]

{ #category : #rendering }
ASDBPORHeader >> renderAccountButtonOn: html [
	html
		mdlNavigation: [ html mdlButton icon
				id: #bottomLeftButton;
				with: [ html mdlIcon: #account_circle ].
			html mdlMenu
				bottomRight;
				for: #bottomLeftButton;
				with: [ html mdlMenuItem: 'Einstellungen'.
					html mdlMenuItem
						fullBleedDivider;
						with: 'Konto'.
					html mdlMenuItem
						disabled;
						with: 'Disabled Action'.
					html mdlMenuItem: 'Yet Another Action' ] ]
]

{ #category : #rendering }
ASDBPORHeader >> renderAddButtonOn: html [
	html
		mdlNavigation: [ html mdlButton icon
				id: #bottomLeftButton;
				with: [ html mdlIcon: #account_circle ].
			html mdlMenu
				bottomRight;
				for: #bottomLeftButton;
				with: [ html mdlMenuItem: 'Einstellungen'.
					html mdlMenuItem
						fullBleedDivider;
						with: 'Konto'.
					html mdlMenuItem
						disabled;
						with: 'Disabled Action'.
					html mdlMenuItem: 'Yet Another Action' ] ]
]

{ #category : #rendering }
ASDBPORHeader >> renderButtonsOn: html [
	self session isLogged
		ifFalse: [ ^ self ].
	self renderAccountButtonOn: html
]

{ #category : #rendering }
ASDBPORHeader >> renderContentOn: html [
	html mdlLayoutHeader
		with: [ "self renderDrawerOn: html"
			html
				mdlLayoutHeaderRow: [ html mdlNavigationLink
						callback: [ "Just refresh" ];
						with: [ html mdlLayoutTitle: [ html text: 'Pharo Online IDE' ] ].
					
					html mdlLayoutSpacer.
					self renderButtonsOn: html ].
			self renderTabBarOn: html ]
]

{ #category : #rendering }
ASDBPORHeader >> renderDrawerOn: html [
	html
		mdlLayoutDrawer: [ html
				mdlNavigation: [ self possiblePages
						do: [ :aClass | 
							html mdlNavigationLink
								beCurrentIf: aClass = self rootComponent componentToDisplay class;
								callback: [ self displayInstanceOf: aClass ];
								with: aClass pageName ] ] ]
]

{ #category : #rendering }
ASDBPORHeader >> renderNavMenu: html [
	html
						mdlNavigation: [ 1 to: 5 do: [ :i | html mdlNavigationLink: 'Link' ] ]
]

{ #category : #rendering }
ASDBPORHeader >> renderTabBarOn: html [

	html mdlLayoutTabBar: [ 
		self possiblePages do: [ :aClass | 
			html mdlLayoutTab
				callback: [ self displayInstanceOf: aClass ];
				isActiveIf: aClass = self rootComponent componentToDisplay class;
				with: aClass pageName ] ]
]
