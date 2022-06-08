//
//  ResultViewModel.swift.swift
//  GuessThePhilosopher
//
//  Created by david lam on 8/6/22.
//

import Foundation

struct ResultViewModel {
    let scoreLabelText: String
    let resultType: ResultType
    
    init(finalScore: Int, totalQuestion: Int) {
        scoreLabelText = "\(finalScore) / \(totalQuestion))"
        resultType = ResultType(score: finalScore, totalQuestions: totalQuestion)
    }
}
