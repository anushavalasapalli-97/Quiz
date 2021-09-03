//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Kalyanam Bhargava Ram on 9/2/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation


struct Question {
    var question: String
    var answers: [String]
    var correctAnswer: String
    
    init(q:String,a:[String],ca:String) {
        question = q
        answers = a
        correctAnswer = ca
    }
}
