//
//  QuestionsList.swift
//  PersonalityQuiz
//
//  Created by Иван Гребенюк on 31.03.2022.
//

import Foundation

struct QuestionsList {
    
    var animalsQuestions: [Question] = [
        Question(text: "Which food do you like most?",
                 type: .single,
                 answers: [
                    Answer(text: "Steak", definition: .dog),
                    Answer(text: "Fish", definition: .cat),
                    Answer(text: "Carrots", definition: .rabbit),
                    Answer(text: "Corn", definition: .turtle)
                 ].shuffled()),
        Question(text: "Where would you like to live?",
                 type: .multiple,
                 answers: [
                    Answer(text: "Green fields", definition: .rabbit),
                    Answer(text: "City", definition: .cat),
                    Answer(text: "Sea shore", definition: .turtle),
                    Answer(text: "Farm", definition: .dog)
                 ].shuffled()),
        Question(text: "Which activities do you enjoy?",
                 type: .multiple,
                 answers: [
                    Answer(text: "Swimming", definition: .turtle),
                    Answer(text: "Sleeping", definition: .cat),
                    Answer(text: "Cuddling", definition: .rabbit),
                    Answer(text: "Eating", definition: .dog)
                 ]),
        Question(text: "What cartoon do you like most?",
                 type: .single,
                 answers: [
                    Answer(text: "Tom & Jerry", definition: .cat),
                    Answer(text: "Teenage Mutant Ninja Turtles", definition: .turtle),
                    Answer(text: "Isle of Dogs", definition: .dog),
                    Answer(text: "Bugs bunny", definition: .rabbit)
                 ]),
        Question(text: "How much do you enjoy car rides?",
                 type: .ranged,
                 answers: [
                    Answer(text: "I dislike them", definition: .cat),
                    Answer(text: "I get a little nervous", definition: .rabbit),
                    Answer(text: "I barely notice them", definition: .turtle),
                    Answer(text: "I adore them", definition: .dog)
                 ])
    ].shuffled()
    
    var sportsQuestions = [
        Question(text: "What is your favoite weekend activity?",
                 type: .single,
                 answers: [
                    Answer(text: "Steak", definition: .dog),
                    Answer(text: "Fish", definition: .cat),
                    Answer(text: "Carrots", definition: .rabbit),
                    Answer(text: "Corn", definition: .turtle)
                 ].shuffled()),
        Question(text: "SPORTS! Where would you like to live?",
                 type: .multiple,
                 answers: [
                    Answer(text: "Green fields", definition: .rabbit),
                    Answer(text: "City", definition: .cat),
                    Answer(text: "Sea shore", definition: .turtle),
                    Answer(text: "Farm", definition: .dog)
                 ].shuffled()),
        Question(text: "SPORTS! Which activities do you enjoy?",
                 type: .multiple,
                 answers: [
                    Answer(text: "Swimming", definition: .turtle),
                    Answer(text: "Sleeping", definition: .cat),
                    Answer(text: "Cuddling", definition: .rabbit),
                    Answer(text: "Eating", definition: .dog)
                 ]),
        Question(text: "SPORTS! What cartoon do you like most?",
                 type: .single,
                 answers: [
                    Answer(text: "Tom & Jerry", definition: .cat),
                    Answer(text: "Teenage Mutant Ninja Turtles", definition: .turtle),
                    Answer(text: "Isle of Dogs", definition: .dog),
                    Answer(text: "Bugs bunny", definition: .rabbit)
                 ]),
        Question(text: "SPORTS! How much do you enjoy car rides?",
                 type: .ranged,
                 answers: [
                    Answer(text: "I dislike them", definition: .cat),
                    Answer(text: "I get a little nervous", definition: .rabbit),
                    Answer(text: "I barely notice them", definition: .turtle),
                    Answer(text: "I adore them", definition: .dog)
                 ])
    ].shuffled()
}
