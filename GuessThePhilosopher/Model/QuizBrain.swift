//
//  quizBrain.swift
//  GuessThePhilosopher
//
//  Created by xavier chia on 17/11/20.
//

struct QuizBrain {
    var currentStatus = QuizStatus.waiting
    
    let quotes = [
        Quote(author: Authors.Aristotle, quoteTexts: [
            "It is during our darkest moments that we must focus to see the light.",
            "We are what we repeatedly do. Excellence, then, is not an act, but a habit.",
            "Courage is the first of human qualities, because it is the quality which guarantees the others.",
            "Knowing yourself is the beginning of all wisdom.",
            "It is the mark of an educated mind to be able to entertain a thought without accepting it.",
            "Pleasure in the job puts perfection in the work.",
            "Happiness is an expression of the soul in considered actions.",
            "The high-minded man must care more for the truth than for what people think",
            "Educating the mind without educating the heart is no education at all",
            "Friendship is a single soul dwelling in two bodies."
        ]),
        Quote(author: Authors.Nietzsche, quoteTexts: [
            "There are no beautiful surface without a terrible depth.",
            "Sometimes people don't want to hear the truth because they don't want their illusions destroyed.",
            "The tree that would grow to heaven must send its roots to hell.",
            "To live is to suffer, to survive is to find some meaning in the suffering.",
            "He who has a why to live can bear almost any how",
            "No one can construct for you the bridge upon which precisely you must cross the stream of life, no one but you yourself alone.",
            "They muddy the water, to make it seem deep.",
            "And those who were seen dancing were thought to be insane by those who could not hear the music.",
            "The snake which cannot cast its skin has to die. As well the minds which are prevented from changing their opinions; they cease to be mind.",
            "No price is too high to pay for the privilege of owning yourself."
        ]),
        Quote(author: Authors.Plato, quoteTexts: [
            "Good people do not need laws to tell them to act responsibly, while bad people will find a way around the laws.",
            "The greatest wealth is to live content with little.",
            "Wise men speak because they have something to say; fools because they have to say something.",
            "Never discourage anyone who continually makes progress, no matter how slow.",
            "People are like dirt. They can nourish you and help you grow as a person, or they can stunt your growth and make you wilt and die.",
            "Good actions give strength to ourselves and inspire good actions in others.",
            "False words are not only evil in themselves, but they infect the soul with evil.",
            "For a man to conquer himself is the first and noblest of all victories.",
            "Reality is created by the mind, we can change our reality by changing our mind.",
            "Courage is knowing what not to fear."
        ]),
        Quote(author: Authors.LaoZi, quoteTexts: [
            "Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step.",
            "When I let go of what I am, I become what I might be.",
            "Mastering others is strength. Mastering yourself is true power.",
            "Nature does not hurry, yet everything is accomplished.",
            "Being deeply loved by someone gives you strength, while loving someone deeply gives you courage.",
            "Knowing others is wisdom, knowing yourself is Enlightenment.",
            "He who knows, does not speak. He who speaks, does not know.",
            "To the mind that is still, the whole universe surrenders.",
            "If you do not change direction, you may end up where you are heading.",
            "A good traveler has no fixed plans, and is not intent on arriving."
        ]),
        Quote(author: Authors.Sartre, quoteTexts: [
            "Freedom is what you do with what's been done to you.",
            "If you are lonely when you are alone, you are in bad company.",
            "Everything has been figured out, except how to live.",
            "Commitment is an act, not a word.",
            "Life begins on the other side of despair.",
            "Only the guy who isn't rowing has time to rock the boat.",
            "Like all dreamers, I mistook disenchantment for truth.",
            "Hell is—other people!",
            "Better to die on one's feet than to live on one's knees.",
            "We are our choices."
        ]),
        Quote(author: Authors.Confucius, quoteTexts: [
            "Wheresoever you go, go with all your heart.",
            "Our greatest glory is not in never falling, but in rising every time we fall.",
            "It does not matter how slowly you go so long as you do not stop.",
            "I hear and I forget. I see and I remember. I do and I understand.",
            "Everything has its beauty, but not everyone sees it.",
            "Before you embark on a journey of revenge, dig two graves.",
            "He who conquers himself is the mightiest warrior.",
            "The man who moves a mountain begins by carrying away small stones.",
            "Life is really simple, but we insist on making it complicated.",
            "When it is obvious that the goals cannot be reached, don't adjust the goals, adjust the action steps."
        ])
    ]
    
    
    var question: (author1: String, author2: String, quoteText: String) {
        let quotesShuffled = quotes.shuffled()

        let author1 = quotesShuffled[0].author.rawValue
        let author2 = quotesShuffled[1].author.rawValue
        
        let zeroOrOne = Int.random(in: 0...1)
        let quoteText = quotesShuffled[zeroOrOne].quoteTexts.shuffled()[0]
        return (author1, author2, quoteText)
    }
}
