Class {
	#name : #Social,
	#superclass : #QuestionRetriever,
	#category : #'TP-Refactoring-Model'
}

{ #category : #retrieving }
Social >> retrieveQuestions: aUser [
	| followingCol questionRet |
	followingCol := OrderedCollection new.
	aUser following do: [ :follow | followingCol addAll: follow questions ].
	questionRet := self makingTemp: followingCol.
	^ self questionRet: aUser with: questionRet.
]
