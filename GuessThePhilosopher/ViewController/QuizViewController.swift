//
//  QuizViewController.swift
//  GuessThePhilosopher
//
//  Created by xavier chia on 13/11/20.
//

import UIKit

class QuizViewController: UIViewController {
    var quizBrain = QuizBrain()
    let viewModel = QuizViewModel()
    let soundPlayer = SoundPlayer()
    @IBOutlet weak var progressView: UIProgressView!
    
    
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var bottomCTA: CheckButton!
    
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var bottomViewLabel: UILabel!
    @IBOutlet weak var bottomViewTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var quoteText: UILabel!
    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var rightImage: UIImageView!
    @IBOutlet weak var leftAuthor: UILabel!
    @IBOutlet weak var rightAuthor: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        soundPlayer.playSound(Sound.start)
        progressView.transform = CGAffineTransform(scaleX: 1, y: 3)
        prepareStylingAndQuestion()
    }
    
    @IBAction func closeButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func checkButtonTouchDown(_ sender: CheckButton) {
        bottomCTA.layer.shadowOffset = CGSize(width: 0, height: 0)
        bottomCTA.frame.origin.y += 5
    }
    
    @IBAction func checkButtonTouchUp(_ sender: UIButton) {

        progressView.progress = Float(quizBrain.progress)
        bottomCTA.frame.origin.y -= 5

        switch viewModel.state {
        case .CHECK:
            if quizBrain.isCorrect(userAnswer: quizBrain.userAnswer) {
                handleCorrectAnswer()
            } else {
                handleIncorrectAnswer()
            }
            
            authorButtonsEnabled(false)
            raiseBottomView()
            
        case .CONTINUE:
            if quizBrain.isGameOver() {
                gameOver()
            }
            prepareStylingAndQuestion()
            lowerBottomView()
        }
        
        viewModel.toggleState()
    }
    
    //MARK: - Question Correct, Wrong or Game Over
    func handleCorrectAnswer() {
        correctResponseStyling()
        bottomViewLabel.text = viewModel.getPositiveFeedback(quizBrain: quizBrain)
        soundPlayer.playSound(Sound.correct)
    }
    
    func handleIncorrectAnswer () {
        incorrectResponseStyling()
        bottomViewLabel.text = viewModel.getNegativeFeedback(quizBrain: quizBrain)
        soundPlayer.playSound(Sound.wrong)
    }
    
    func gameOver() {
        self.performSegue(withIdentifier: "quizToResult", sender: self)
    }
    
    
    //MARK: - Preparation
    func prepareStylingAndQuestion() {
        resetAuthorButtonsStyling()
        authorButtonsEnabled(true)
        bottomCTA.isEnabled = false
        populateQuestionText()
    }
    
    //MARK: - Question Text
    func populateQuestionText() {
        let question = quizBrain.getQuestion()
        quoteText.text = question.quoteText
        leftButton.setTitle(question.author1Name, for: .normal)
        leftAuthor.text = question.author1Name
        leftImage.image = question.author1Face

        rightButton.setTitle(question.author2Name, for: .normal)
        rightAuthor.text = question.author2Name
        rightImage.image = question.author2Face
    }
    
    //MARK: - Author Button
    @IBAction func authorButtonPressed(_ sender: UIButton) {
        resetAuthorButtonsStyling()
        sender.buttonSelectedStyling()
        bottomCTA.isEnabled = true
        quizBrain.userAnswer = sender.currentTitle ?? ""
    }
    
    func resetAuthorButtonsStyling() {
        leftButton.authorDefaultStyling()
        rightButton.authorDefaultStyling()
    }
    
    func authorButtonsEnabled(_ enabled: Bool) {
        leftButton.isUserInteractionEnabled = enabled
        rightButton.isUserInteractionEnabled = enabled
    }
    
    //MARK: - Responses
    func correctResponseStyling() {
        bottomView.backgroundColor = #colorLiteral(red: 0.7215686275, green: 0.9490196078, blue: 0.5529411765, alpha: 1)
        bottomViewLabel.textColor = #colorLiteral(red: 0.3529411765, green: 0.6509803922, blue: 0.01960784314, alpha: 1)
        
        bottomCTA.layer.shadowOffset = CGSize(width: 0, height: 5)
    }
    
    func incorrectResponseStyling() {
        bottomView.backgroundColor = #colorLiteral(red: 0.9924690127, green: 0.7565234303, blue: 0.7588754296, alpha: 1)
        bottomViewLabel.textColor = #colorLiteral(red: 0.9260372519, green: 0.04186752439, blue: 0.1039779559, alpha: 1)
        
        bottomCTA.backgroundColor = #colorLiteral(red: 0.9850447774, green: 0.295574367, blue: 0.2933387756, alpha: 1)
        bottomCTA.layer.shadowColor = #colorLiteral(red: 0.9186751246, green: 0.1684108377, blue: 0.1682819128, alpha: 1)
        bottomCTA.layer.shadowOffset = CGSize(width: 0, height: 5)
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
            self.view.layoutIfNeeded()
            self.bottomCTA.setTitle(QuizButtonText.CONTINUE.rawValue, for: .normal)
        }
    }
    
    func lowerBottomView() {
        UIView.animate(withDuration: 0.2) {
            self.bottomViewTransparent(true)
            self.bottomCTA.setTitle(QuizButtonText.CHECK.rawValue, for: .normal)
        } completion: { (complete: Bool) in
            self.bottomViewTopConstraint.constant += self.bottomView.bounds.height
            self.bottomViewTransparent(false)
        }
    }
    
    //MARK: - Segue Preparation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "quizToResult" {
            let destinationVC = segue.destination as! UINavigationController
            let resultVC = destinationVC.viewControllers.first as! ResultViewController
            let resultViewModel = ResultViewModel(finalScore: quizBrain.score,
                                                  totalQuestion: quizBrain.totalQuestions)
            resultVC.viewModel = resultViewModel
            quizBrain.reset()
            progressView.progress = Float(quizBrain.progress)
        }
    }

}




