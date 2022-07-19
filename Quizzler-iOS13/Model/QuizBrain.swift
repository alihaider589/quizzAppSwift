//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Ali Haider on 15/07/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation


struct QuizBrain {
    
    let quizQuestions = [
        Question(q: "A slug's blood is green.", a: "True"),
        Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
        Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
        Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
        Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
        Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
        Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
        Question(q: "Google was originally called 'Backrub'.", a: "True"),
        Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
        Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
        Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
        Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
        
    ]
    
    var questionNumber = 0
    var scoreCount = 0
    
    mutating func checkAnswer(answer userAnswer: String)->Bool{
        if userAnswer == quizQuestions[questionNumber].answer{
            scoreCount += 1
            return true
        }else{
            return false
        }
        
    }
    
    func getQuestionText ()-> String {
        return quizQuestions[questionNumber].text
    }
    
    func getProgress ()-> Float {
        let progress = Float(questionNumber) / Float(quizQuestions.count)
        return progress
    }
    
    mutating func nextQuestion()->Bool{
        if questionNumber < quizQuestions.count - 1 {
            questionNumber += 1
            return false
        }else{
            questionNumber = 0
            
            return true
        }
    }
    
    func getScore ()->Int{
        return scoreCount
    }
    
}


struct MCQQuizBrain{
    let quizQuestions = [
        MCQ(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        MCQ(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        MCQ(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        MCQ(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        MCQ(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        MCQ(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        MCQ(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        MCQ(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        MCQ(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        MCQ(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
    ]
    
    var questionNumber = 0
    var scoreCount = 0
    
    mutating func checkAnswer(answer userAnswer: String)->Bool{
        if userAnswer == quizQuestions[questionNumber].cAnswer {
            scoreCount += 1
            return true
        }else{
            return false
        }
       
    }
    
    func getQuestionText ()-> String {
        return quizQuestions[questionNumber].text
    }
    
    func getButtonTitles ()->[String]{
        return quizQuestions[questionNumber].answer
    }
    
    func getProgress ()-> Float {
        let progress = Float(questionNumber) / Float(quizQuestions.count)
        return progress
    }
    
    mutating func nextQuestion()->Bool{
        if questionNumber < quizQuestions.count - 1 {
            questionNumber += 1
            return false
        }else{
            questionNumber = 0
            
            return true
        }
    }
    
    func getScore ()->Int{
        return scoreCount
    }
}
