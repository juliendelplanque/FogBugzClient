Extension { #name : #FogBugzClient }

{ #category : #'*FogBugz-Calypso' }
FogBugzClient class >> getWorkingClientByAskingUser [
	| potentialCredentials client |
	client := nil.
	potentialCredentials := FogBugzClient credentials.
	[ client isNil ] whileTrue: [
		potentialCredentials ifNil: [ potentialCredentials := FGBLoginDialogModel getCredentials ].
		potentialCredentials ifNil: [ FGBUserCancelledLogin signal ].
		[ client := FogBugzClient loginUser: potentialCredentials key password: potentialCredentials value.
		  FogBugzClient credentials: potentialCredentials ]
			on: Error
			do: [ :err |
				potentialCredentials := nil.
				UIManager default alert: err messageText title: 'Could not log into Fogbugz.' ] ].
	^ client
]