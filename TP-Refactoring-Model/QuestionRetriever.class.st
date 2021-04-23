Class {
	#name : #QuestionRetriever,
	#superclass : #Object,
	#instVars : [
		'option',
		'cuoora'
	],
	#category : #'TP-Refactoring-Model'
}

{ #category : #'instance creation' }
QuestionRetriever class >> new: cuoora [
	^ self new cuoora: cuoora
]

{ #category : #'instance creation' }
QuestionRetriever class >> new: cuoora and: aSymbol [
	^ self new cuoora: cuoora; option:aSymbol; yourself.
]

{ #category : #accesing }
QuestionRetriever >> cuoora: aCuooraInstance [
	cuoora := aCuooraInstance 
]

{ #category : #retrieving }
QuestionRetriever >> forNews: aUser [
	| newsCol temp |
	newsCol := OrderedCollection new.
	newsCol := cuoora questions select: [ :question | ( question timestamp asDate = Date today ) ].
	temp := newsCol asSortedCollection:[ :aQuestion :anotherQuestion | aQuestion positiveVotes size > anotherQuestion positiveVotes size ].
	^ temp last: (100 min: temp size).
]

{ #category : #retrieving }
QuestionRetriever >> forPopularToday: aUser [
	| popularTCol temp averageVotes |
	popularTCol := OrderedCollection new.
	popularTCol := cuoora questions select: [ :question | ( question timestamp asDate = Date today) ].
	averageVotes := ( cuoora questions collect: [ :question | question positiveVotes size ] ) averageIfEmpty: 0.
	temp := ( popularTCol select: [ :question | question positiveVotes size >= averageVotes ] ) asSortedCollection: [ :aQuestion :anotherQuestion | aQuestion positiveVotes size > anotherQuestion positiveVotes size ].
	^ temp last: ( 100 min: temp size ).
	


"(a SumNumbers: [])AverageIfEmpty: [0]"

"el cambio"
"(cuoora questions collect: [ :question | question positiveVotes size ] ) averageIfEmpty [0]"
"el original"
"( cuoora questions sum: [ :question | question positiveVotes size ] ) / popularTCol size."
]

{ #category : #retrieving }
QuestionRetriever >> forSocial: aUser [
	| followingCol temp |
	followingCol := OrderedCollection new.
	aUser following do:[ :follow | followingCol addAll: follow questions ].
	temp := followingCol asSortedCollection:[ :aQuestion :anotherQuestion | aQuestion positiveVotes size > anotherQuestion positiveVotes size ].
	^ temp last: (100 min: temp size).
]

{ #category : #retrieving }
QuestionRetriever >> forTopics: aUser [
	| topicsCol temp |
	topicsCol := OrderedCollection new.
	aUser topics do:[ :topic | topicsCol addAll: topic questions ].
	temp := topicsCol asSortedCollection:[ :aQuestion :anotherQuestion | aQuestion positiveVotes size > anotherQuestion positiveVotes size ].
	^ temp last: (100 min: temp size).
]

{ #category : #initializing }
QuestionRetriever >> initialize [
	option := #social
]

{ #category : #accesing }
QuestionRetriever >> option: anOption [
	option := anOption
]

{ #category : #retrieving }
QuestionRetriever >> retrieveQuestions: aUser [
	"cambiamos el nombre de la variable qRet por questionRet, ademas, las variables a, b y q fueron cambiadas por aQuestion, anotherQuestion y question respectivamente que estan ahora dentro de los metodos forSocial, forTopics, forNews y forPopularToday"
	| questionRet |
	questionRet := OrderedCollection new.
	
	option = #social ifTrue:[
			questionRet := self forSocial: aUser.
		].
	option = #topics ifTrue:[
			questionRet := self forTopics: aUser.
		].	
	option = #news ifTrue:[
			questionRet := self forNews: aUser.
		].
	option = #popularToday ifTrue:[
			questionRet := self forPopularToday: aUser.
		].
	
	^questionRet reject:[:question | question user = aUser].
]
