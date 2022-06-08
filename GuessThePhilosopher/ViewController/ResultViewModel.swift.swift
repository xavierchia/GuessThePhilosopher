//
//  ResultViewModel.swift.swift
//  GuessThePhilosopher
//
//  Created by david lam on 8/6/22.
//

import Foundation

struct ResultViewModel {
    let scoreLabelText: String
    let resultType: Category
    
    init(quizBrain: QuizBrain) {
        scoreLabelText = "\(Int(quizBrain.score)) / \(Int(quizBrain.totalQuestions))"
        resultType = quizBrain.result
    }
}
