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
	| newsCol |
	newsCol := OrderedCollection new.
	newsCol := cuoora questionsToday.
	^ self makingTemp: newsCol.
]

{ #category : #retrieving }
QuestionRetriever >> forPopularToday: aUser [
	| popularTCol averageVotes |
	popularTCol := OrderedCollection new.
	popularTCol := cuoora questionsToday.
	averageVotes := cuoora questionsAverageVotes.
	^ self makingTemp: ( popularTCol select: [ :question | question positiveVotes size >= averageVotes ] ). 

	
]

{ #category : #retrieving }
QuestionRetriever >> forSocial: aUser [
	| followingCol |
	followingCol := OrderedCollection new.
	aUser following do: [ :follow | followingCol addAll: follow questions ].
	^ self makingTemp: followingCol.
]

{ #category : #retrieving }
QuestionRetriever >> forTopics: aUser [
	| topicsCol |
	topicsCol := OrderedCollection new.
	aUser topics do: [ :topic | topicsCol addAll: topic questions ].
	^ self makingTemp: topicsCol. 
]

{ #category : #initializing }
QuestionRetriever >> initialize [
	option := #social
]

{ #category : #methods }
QuestionRetriever >> makingTemp: aCollection [
	| temp |
	temp := aCollection asSortedCollection:[ :aQuestion :anotherQuestion | aQuestion positiveVotes size > anotherQuestion positiveVotes size ].
	^ temp last: (100 min: temp size).
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
	
	^ questionRet reject: [ :question | question user = aUser ].
]
