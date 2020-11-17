//
//  quizBrain.swift
//  GuessThePhilosopher
//
//  Created by xavier chia on 17/11/20.
//

import Foundation

enum QuizStatus {
    case correct, wrong, waiting
}

struct QuizBrain {
    var currentStatus = QuizStatus.waiting
}
