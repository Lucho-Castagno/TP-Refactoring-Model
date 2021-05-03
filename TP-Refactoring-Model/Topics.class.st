Class {
	#name : #Topics,
	#superclass : #QuestionRetriever,
	#category : #'TP-Refactoring-Model'
}

{ #category : #retrieving }
Topics >> retrieveQuestions: aUser [
	| topicsCol questionRet |
	topicsCol := OrderedCollection new.
	aUser topics do: [ :topic | topicsCol addAll: topic questions ].
	questionRet := self makingTemp: topicsCol.
	^ self questionRet: aUser with: questionRet. 
]
