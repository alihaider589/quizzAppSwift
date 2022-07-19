//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Ali Haider on 14/07/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation


struct Question {
    let text : String
    let answer : String
    
    init(q:String, a:String) {
        text = q
        answer = a
    }
}

struct MCQ{
    let text : String
    let answer : [String]
    let cAnswer:String
    init(q:String, a:[String],correctAnswer:String) {
        text = q
        answer = a
        cAnswer = correctAnswer
        
    }
}
