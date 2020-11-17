//
//  quizBrain.swift
//  GuessThePhilosopher
//
//  Created by xavier chia on 17/11/20.
//

enum QuizStatus {
    case correct, wrong, waiting
}

struct QuizBrain {
    var currentStatus = QuizStatus.waiting
    
    let quotes = [
        "Aristotle": [
            "It is during our darkest moments that we must focus to see the light.",
            "another quote20",
            "another quote30"
        ],
        "Nietzsche": [
            "There are no beautiful surface without a terrible depth.",
            "another quote12",
            "another quote13"
        ],
        "Plato": [
            "If you do not take an interest in the affairs of your government, then you are doomed to live under the rule of fools.",
            "another quote2",
            "another quote3"
        ]
    ]
    
    var question: (author1: String, author2: String, quoteText: String) {
        let quotesShuffled = quotes.shuffled()
        let author1 = Array(quotesShuffled)[0].key
        let author2 = Array(quotesShuffled)[1].key
        
        let zeroOrOne = Int.random(in: 0...1)
        let quoteText = Array(quotesShuffled)[zeroOrOne].value.shuffled()[0]
        return (author1, author2, quoteText)
    }
}
