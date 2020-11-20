//
//  Enums.swift
//  GuessThePhilosopher
//
//  Created by xavier chia on 18/11/20.
//

enum QuizButtonText: String {
    case CHECK
    case CONTINUE
}

enum Author: String {
    case Aristotle
    case Nietzsche
    case Plato
    case LaoZi = "Lao Zi"
    case Sartre
    case Confucius
    case Machiavelli
    case AlbertCamus = "Albert Camus"
    case JohnLocke = "John Locke"
    case Dostoevsky
}

enum Sound: String {
    case correct, wrong, congrats
}
