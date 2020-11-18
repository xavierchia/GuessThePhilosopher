//
//  Enums.swift
//  GuessThePhilosopher
//
//  Created by xavier chia on 18/11/20.
//

enum QuizStatus {
    case correct, wrong, waiting
}

enum QuizButtonText: String {
    case CHECK
    case CONTINUE
}

enum Authors: String {
    case Aristotle
    case Nietzsche
    case Plato
    case LaoZi = "Lao Zi"
    case Sartre
    case Confucius
    case Machiavelli
}
