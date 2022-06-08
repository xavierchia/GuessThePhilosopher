//
//  QuizViewModel.swift
//  GuessThePhilosopher
//
//  Created by david lam on 8/6/22.
//

import Foundation

class QuizViewModel {
    private(set) var state = QuizButtonText.CHECK

    func toggleState() {
        switch state {
        case .CHECK:
            self.state = .CONTINUE
        case .CONTINUE:
            self.state = .CHECK
        }
    }
    
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
