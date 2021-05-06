Class {
	#name : #PopularToday,
	#superclass : #QuestionRetriever,
	#category : #'TP-Refactoring-Model'
}

{ #category : #retrieving }
PopularToday >> retrieveQuestions: aUser [
	| popularTCol averageVotes questionRet |
	popularTCol := cuoora questionsToday.
	averageVotes := cuoora questionsAverageVotes.
	questionRet := self makingTemp: ( popularTCol select: [ :question | question positiveVotes size >= averageVotes ] ). 
	^ self questionRet: aUser with: questionRet.

	
]
