Class {
	#name : #News,
	#superclass : #QuestionRetriever,
	#category : #'TP-Refactoring-Model'
}

{ #category : #retrieving }
News >> retrieveQuestions: aUser [
	| newsCol questionRet |
	newsCol := OrderedCollection new.
	newsCol := cuoora questionsToday.
	questionRet := self makingTemp: newsCol.
	^ self questionRet: aUser with: questionRet. 
]
