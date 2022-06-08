//
//  QuizViewModel.swift
//  GuessThePhilosopher
//
//  Created by david lam on 8/6/22.
//

import Foundation

struct QuizViewModel {
    func getPositiveFeedback(quizBrain: QuizBrain) -> String? {
        return quizBrain
            .praises
            .randomElement()?
            .replacingOccurrences(of: "Author", with: quizBrain.correctAuthor)
    }
    
    func getNegativeFeedback(quizBrain: QuizBrain) -> String? {
        return quizBrain
            .shames
            .randomElement()?
            .replacingOccurrences(of: "Author", with: quizBrain.correctAuthor)
    }
}
