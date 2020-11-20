//
//  QuizViewController.swift
//  GuessThePhilosopher
//
//  Created by xavier chia on 13/11/20.
//

import UIKit



class QuizViewController: UIViewController {
    var quizBrain = QuizBrain()
    
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var leftButton: LayoutableButton!
    @IBOutlet weak var rightButton: LayoutableButton!
    @IBOutlet weak var checkButton: CheckButton!
    
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var bottomViewLabel: UILabel!
    @IBOutlet weak var bottomViewTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var quoteText: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
            
        progressView.transform = CGAffineTransform(scaleX: 1, y: 3)
        prepareStylingAndQuestion()
    }
    
    
    @IBAction func closeButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func checkButtonPressed(_ sender: UIButton) {

        progressView.progress = Float(quizBrain.questionNum / quizBrain.totalQuestions)

        if quizBrain.state == QuizButtonText.CHECK {
            
            quizBrain.state = QuizButtonText.CONTINUE
            if quizBrain.isCorrect(userAnswer: quizBrain.userAnswer) {

                questionCorrect()
            } else {

                questionWrong()
            }
            
            authorButtonsEnabled(false)
            raiseBottomView()
        } else if quizBrain.state == QuizButtonText.CONTINUE {
            
            quizBrain.state = QuizButtonText.CHECK
            
            if quizBrain.isGameOver() {
                gameOver()
            }
            prepareStylingAndQuestion()
            lowerBottomView()
        }
    }
    
    //MARK: - Question Correct, Wrong or Game Over
    func questionCorrect() {
        correctResponseStyling()
        bottomViewLabel.text = quizBrain.praises.randomElement()?.replacingOccurrences(of: "Author", with: quizBrain.correctAuthor)
        quizBrain.playSound(Sound.correct)
    }
    
    func questionWrong () {
        incorrectResponseStyling()
        bottomViewLabel.text = quizBrain.shames.randomElement()?.replacingOccurrences(of: "Author", with: quizBrain.correctAuthor)
        quizBrain.playSound(Sound.wrong)
    }
    
    func gameOver() {
        quizBrain.questionNum = 0
        progressView.progress = Float(quizBrain.questionNum / quizBrain.totalQuestions)
        self.performSegue(withIdentifier: "quizToResult", sender: self)
    }
    
    
    //MARK: - Preparation
    func prepareStylingAndQuestion() {
        resetAuthorButtonsStyling()
        authorButtonsEnabled(true)
        checkButton.isEnabled = false
        populateQuestionText()
    }
    
    //MARK: - Question Text
    func populateQuestionText() {
        let question = quizBrain.getQuestion()
        quoteText.text = question.quoteText
        leftButton.setTitle(question.author1, for: .normal)
        rightButton.setTitle(question.author2, for: .normal)
    }
    
    //MARK: - Author Button
    @IBAction func authorButtonPressed(_ sender: UIButton) {
        resetAuthorButtonsStyling()
        sender.buttonSelectedStyling()
        checkButton.isEnabled = true
        quizBrain.userAnswer = sender.currentTitle ?? ""
    }
    
    func resetAuthorButtonsStyling() {
        leftButton.authorDefaultStyling()
        rightButton.authorDefaultStyling()
    }
    
    func authorButtonsEnabled(_ isTrue: Bool) {
        if isTrue {
            leftButton.isUserInteractionEnabled = true
            rightButton.isUserInteractionEnabled = true
        } else {
            leftButton.isUserInteractionEnabled = false
            rightButton.isUserInteractionEnabled = false
        }
    }
    
    //MARK: - Responses
    func correctResponseStyling() {
        bottomView.backgroundColor = #colorLiteral(red: 0.7215686275, green: 0.9490196078, blue: 0.5529411765, alpha: 1)
        bottomViewLabel.textColor = #colorLiteral(red: 0.3529411765, green: 0.6509803922, blue: 0.01960784314, alpha: 1)
    }
    
    func incorrectResponseStyling() {
        bottomView.backgroundColor = #colorLiteral(red: 0.9924690127, green: 0.7565234303, blue: 0.7588754296, alpha: 1)
        bottomViewLabel.textColor = #colorLiteral(red: 0.9260372519, green: 0.04186752439, blue: 0.1039779559, alpha: 1)
        
        checkButton.backgroundColor = #colorLiteral(red: 0.9850447774, green: 0.295574367, blue: 0.2933387756, alpha: 1)
        checkButton.layer.shadowColor = #colorLiteral(red: 0.9186751246, green: 0.1684108377, blue: 0.1682819128, alpha: 1)
    }
    
    //MARK: - Bottom View
    func bottomViewTransparent(_ isTrue: Bool) {
        if isTrue {
            bottomView.alpha = 0
            bottomViewLabel.alpha = 0
        } else {
            bottomView.alpha = 1
            bottomViewLabel.alpha = 1
        }
    }
    
    func raiseBottomView() {
        UIView.animate(withDuration: 0.2) {
            self.bottomViewTopConstraint.constant -= self.bottomView.bounds.height
            self.checkButton.setTitle(QuizButtonText.CONTINUE.rawValue, for: .normal)
            self.view.layoutIfNeeded()
        }
    }
    
    func lowerBottomView() {
        UIView.animate(withDuration: 0.2) {
            self.bottomViewTransparent(true)
            self.checkButton.setTitle(QuizButtonText.CHECK.rawValue, for: .normal)
        } completion: { (complete: Bool) in
            self.bottomViewTopConstraint.constant += self.bottomView.bounds.height
            self.bottomViewTransparent(false)
        }
    }
    
    //MARK: - Segue Preparation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "quizToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.quizBrain.score = quizBrain.score
            quizBrain.score = 0
        }
    }

}




