Class {
	#name : #QuestionRetriever,
	#superclass : #Object,
	#instVars : [
		'cuoora'
	],
	#category : #'TP-Refactoring-Model'
}

{ #category : #'instance creation' }
QuestionRetriever class >> new: cuoora [
	^ self new cuoora: cuoora
]

{ #category : #accesing }
QuestionRetriever >> cuoora: aCuooraInstance [
	cuoora := aCuooraInstance 
]

{ #category : #methods }
QuestionRetriever >> makingTemp: aCollection [
	| temp |
	temp := aCollection asSortedCollection:[ :aQuestion :anotherQuestion | aQuestion positiveVotes size > anotherQuestion positiveVotes size ].
	^ temp last: (100 min: temp size).
]

{ #category : #methods }
QuestionRetriever >> questionRet: aUser with: aCollection [
	^ aCollection reject: [ :question | question user = aUser ].
]

{ #category : #retrieving }
QuestionRetriever >> retrieveQuestions: aUser [
	self subclassResponsibility.

]
