Class {
	#name : #Question,
	#superclass : #Poste,
	#instVars : [
		'title',
		'topics'
	],
	#category : #'TP-Refactoring-Model'
}

{ #category : #'instance creation' }
Question class >> newWithTitle: title description: aDescription user: aUser [
	^ self new
		title: title;
		description: aDescription;
		user: aUser;
		yourself.
]

{ #category : #'instance creation' }
Question class >> newWithTitle: title description: aDescription user: aUser topic: aTopic [
	^ self new
		title: title;
		description: aDescription;
		addTopic: aTopic;
		user: aUser;
		yourself.
]

{ #category : #adding }
Question >> addTopic: aTopic [
	topics add: aTopic.
	aTopic addQuestion: self.

]

{ #category : #'initalize-release' }
Question >> initialize [
	super initialize.
	topics := OrderedCollection new.

]

{ #category : #accessing }
Question >> title [
	^title 
]

{ #category : #accessing }
Question >> title: aTitle [
	title := aTitle 
]

{ #category : #accessing }
Question >> topics [
	^topics 
]
