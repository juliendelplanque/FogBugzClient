"
Command allowing to create a new case on fogbugz.
"
Class {
	#name : #CRFBNewCaseCommand,
	#superclass : #CRFBTokenCommand,
	#instVars : [
		'case'
	],
	#category : #'CaseReporter-FogBugz-Commands'
}

{ #category : #accessing }
CRFBNewCaseCommand >> case [
	^ case
]

{ #category : #accessing }
CRFBNewCaseCommand >> case: anObject [
	case := anObject
]

{ #category : #accessing }
CRFBNewCaseCommand >> commandName [
	^ 'new'
]

{ #category : #filling }
CRFBNewCaseCommand >> fillPostContentDictionary: aDictionary [
	super fillPostContentDictionary: aDictionary.
	aDictionary
		at: 'sTitle' put: self case title;
		at: 'sEvent' put: self case content asString;
		at: 'sCategory' put: self case category name;
		at: 'sProject' put: self case project name;
		at: 'sArea' put: self case area name;
		at: 'sMilestone' put: self case milestone name;
		at: 'sStatus' put: self case status name;
		at: 'sPersonAssignedTo' put: self case assignee name;
		at: 'sPriority' put: self case priority name
]
