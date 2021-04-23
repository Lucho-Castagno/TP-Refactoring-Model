Class {
	#name : #Answer,
	#superclass : #Poste,
	#instVars : [
		'question',
		'user'
	],
	#category : #'TP-Refactoring-Model'
}

{ #category : #'instance creation' }
Answer class >> new: anAnswer user: aUser question: aQuestion [
	^ self new
		description: anAnswer;
		user: aUser;
		question: aQuestion;
		yourself
]

{ #category : #accessing }
Answer >> isTopAnswer [
	^ self positiveVotes >=  ((question sum: [:answer | answer positiveVotes size ]) / question answer size )
]

{ #category : #private }
Answer >> question: aQuestion [
	question := aQuestion 
]
