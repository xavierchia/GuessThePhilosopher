//
//  ResultType.swift
//  GuessThePhilosopher
//
//  Created by xavier chia on 20/11/20.
//

import UIKit

struct ResultType {
    let color: UIColor
    let advice: String
    
    init(score: Int, totalQuestions: Int) {
        self.init(score: Double(score), totalQuestions: Double(totalQuestions))
    }
    
    init(score: Double, totalQuestions: Double) {
        switch (score / totalQuestions) {
        case 0..<0.5:
            color = #colorLiteral(red: 1, green: 0.2941176471, blue: 0.2941176471, alpha: 1)
            advice = "Go read a book!"
        case 0.5..<0.75:
            color = #colorLiteral(red: 0.1098039216, green: 0.6901960784, blue: 0.9647058824, alpha: 1)
            advice = "You barely made it..."
        case 0.75..<0.9:
            color = #colorLiteral(red: 0.8078431373, green: 0.5098039216, blue: 1, alpha:1)
            advice = "There's a brain in the house!"
        default:
            color = #colorLiteral(red: 0.3450980392, green: 0.8, blue: 0.007843137255, alpha: 1)
            advice = "You are a philosopher king!"
        }
    }
}
