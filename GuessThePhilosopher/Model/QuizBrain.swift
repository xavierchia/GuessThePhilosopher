//
//  quizBrain.swift
//  GuessThePhilosopher
//
//  Created by xavier chia on 17/11/20.
//

import AVFoundation
import UIKit

struct QuizBrain {
    let totalQuestions = 5
    
    private(set) var score = 0
    private(set) var questionNum = 0
    private(set) var correctAuthor = ""
    var userAnswer = ""
    
    var progress: Double {
        return Double(questionNum) / Double(totalQuestions)
    }
    
    mutating func getQuestion() -> (author1Name: String, author1Face: UIImage, author2Name: String, author2Face: UIImage, quoteText: String) {
        questionNum += 1
        
        let quotesShuffled = quotes.shuffled()
        
        //        Get 2 random authors
        let author1Name = quotesShuffled[0].author.rawValue
        let author1Face = quotesShuffled[0].face
        let author2Name = quotesShuffled[1].author.rawValue
        let author2Face = quotesShuffled[1].face
        
        //        Store the true values
        let zeroOrOne = Int.random(in: 0...1)
        
        let quoteText = quotesShuffled[zeroOrOne].quoteTexts.randomElement() ?? ""
        correctAuthor = zeroOrOne == 0 ? author1Name : author2Name
        
        return (author1Name, author1Face, author2Name, author2Face, quoteText)
    }
    
    mutating func isCorrect(userAnswer: String) -> Bool {
        
        if userAnswer == correctAuthor {
            score += 1
            return true
        }
        
        return false
    }
    
    mutating func reset() {
        score = 0
        questionNum = 0
        correctAuthor = ""
        userAnswer = ""
    }
    
    func isGameOver() -> Bool {
        return questionNum == totalQuestions
    }
    
    let praises = [
        "Author says well done",
        "Author is proud of you",
        "Author is amazed",
        "Author says wow",
        "Author says good job",
        "Author thinks you're out of this world",
        "Author thinks you're mind blowing",
        "Author says perfect",
        "Author says brilliant",
        "Author says stupendous"
    ]
    
    let shames = [
        "Author is disappointed",
        "Author is sad",
        "Author is shocked",
        "Author is rolling in his grave",
        "Author judges you",
        "Author feels neglected",
        "Author feels ignored",
        "Author feels unloved",
        "Author feels unrecognized",
        "Author feels unappreciated"
    ]
    
    let quotes = [
        Quote(author: Author.Socrates,
              face: #imageLiteral(resourceName: "Socrates"),
              quoteTexts: [
            "An unexamined life is not worth living.",
            "One thing only I know, and that is that I know nothing.",
            "I am the wisest man alive, for I know one thing, and that is that I know nothing.",
            "To find yourself, think for yourself.",
            "True knowledge exists in knowing that you know nothing.",
            "I know that I am intelligent, because I know that I know nothing.",
            "Beware the barrenness of a busy life.",
            "When the debate is over, slander becomes the tool of the loser.",
            "Education is the kindling of a flame, not the filling of a vessel.",
            "There is only one good, knowledge, and one evil, ignorance."
        ]),
        Quote(author: Author.Nietzsche,
              face: #imageLiteral(resourceName: "Nietzsche"),
              quoteTexts: [
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
        Quote(author: Author.Plato,
              face: #imageLiteral(resourceName: "Plato"),
              quoteTexts: [
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
        Quote(author: Author.LaoZi,
              face: #imageLiteral(resourceName: "LaoZi"),
              quoteTexts: [
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
        Quote(author: Author.Sartre,
              face: #imageLiteral(resourceName: "Sartre"),
              quoteTexts: [
            "Freedom is what you do with what's been done to you.",
            "If you are lonely when you are alone, you are in bad company.",
            "Everything has been figured out, except how to live.",
            "Commitment is an act, not a word.",
            "Life begins on the other side of despair.",
            "Only the guy who isn't rowing has time to rock the boat.",
            "Like all dreamers, I mistook disenchantment for truth.",
            "Hell is other people!",
            "Better to die on one's feet than to live on one's knees.",
            "We are our choices."
        ]),
        Quote(author: Author.Confucius,
              face: #imageLiteral(resourceName: "Confucius"),
              quoteTexts: [
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
        ]),
        Quote(author: Author.Machiavelli,
              face: #imageLiteral(resourceName: "Machiavelli"),
              quoteTexts: [
            "It is better to be feared than loved, if you cannot be both.",
            "Men judge generally more by the eye than by the hand, for everyone can see and few can feel. Every one sees what you appear to be, few really know what you are.",
            "The first method for estimating the intelligence of a ruler is to look at the men he has around him.",
            "Where the willingness is great, the difficulties cannot be great.",
            "Never was anything great achieved without danger.",
            "One who deceives will always find those who allow themselves to be deceived.",
            "If an injury has to be done to a man it should be so severe that his vengeance need not be feared.",
            "He who wishes to be obeyed must know how to command.",
            "Hatred is gained as much by good works as by evil.",
            "There is no other way to guard yourself against flattery than by making men understand that telling you the truth will not offend you."
        ]),
        Quote(author: Author.AlbertCamus,
              face: #imageLiteral(resourceName: "Albert"),
              quoteTexts: [
            "The struggle itself towards the heights is enough to fill a man's heart. One must imagine Sisyphus happy.",
            "In the depth of winter, I finally learned that within me there lay an invincible summer.",
            "Autumn is a second spring when every leaf is a flower.",
            "Don't walk behind me; I may not lead. Don't walk in front of me; I may not follow. Just walk beside me and be my friend.",
            "Life is the sum of all your choices.",
            "I rebel; therefore I exist.",
            "Men must live and create. Live to the point of tears.",
            "An intellectual is someone whose mind watches itself.",
            "The only way to deal with an unfree world is to become so absolutely free that your very existence is an act of rebellion.",
            "Freedom is nothing but a chance to be better."
        ]),
        Quote(author: Author.JohnLocke,
              face: #imageLiteral(resourceName: "Locke"),
              quoteTexts: [
            "What worries you, masters you.",
            "I have always thought the actions of men the best interpreters of their thoughts.",
            "Every man has a property in his own person. This nobody has a right to, but himself.",
            "The reason why men enter into society is the preservation of their property.",
            "No man's knowledge here can go beyond his experience.",
            "Government has no other end, but the preservation of property.",
            "Fortitude is the guard and support of the other virtues.",
            "All wealth is the product of labor.",
            "The discipline of desire is the background of character.",
            "The only defense against the world is a thorough knowledge of it."
        ]),
        Quote(author: Author.Dostoevsky,
              face: #imageLiteral(resourceName: "Dost"),
              quoteTexts: [
            "Man grows used to everything, the scoundrel.",
            "The soul is healed by being with children.",
            "To live without Hope is to Cease to live.",
            "The degree of civilization in a society can be judged by entering its prisons.",
            "What is hell? I maintain that it is the suffering of being unable to love.",
            "Love in action is a harsh and dreadful thing compared with love in dreams.",
            "The greatest happiness is to know the source of unhappiness.",
            "Nothing is easier than to denounce the evildoer; nothing is more difficult than to understand him.",
            "Man is sometimes extraordinarily, passionately, in love with suffering.",
            "To go wrong in one's own way is better than to go right in someone else's."
        ])
    ]
}
