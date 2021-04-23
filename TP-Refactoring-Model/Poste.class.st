Class {
	#name : #Poste,
	#superclass : #Object,
	#instVars : [
		'timeStamp',
		'description',
		'votes',
		'user'
	],
	#category : #'TP-Refactoring-Model'
}

{ #category : #adding }
Poste >> addVote: aVote [
	votes add: aVote
]

{ #category : #accessing }
Poste >> description [
	^ description
]

{ #category : #private }
Poste >> description: anObject [
	description := anObject
]

{ #category : #initialize }
Poste >> initialize [
	votes := OrderedCollection new.
	timeStamp := DateAndTime now.
]

{ #category : #methods }
Poste >> negativeVotes [
	^ votes select:[ :vote | vote isLike = false ].
	
]

{ #category : #methods }
Poste >> positiveVotes [
	^ votes select:[ :vote | vote isLike ].
]

{ #category : #accessing }
Poste >> timestamp [
	^ timeStamp
]

{ #category : #private }
Poste >> timestamp: anObject [
	timeStamp := anObject
]

{ #category : #accessing }
Poste >> user [
	^ user
]

{ #category : #private }
Poste >> user: anObject [
	user := anObject
]

{ #category : #accessing }
Poste >> votes [
	^ votes
]
