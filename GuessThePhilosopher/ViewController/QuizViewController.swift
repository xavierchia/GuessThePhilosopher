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
    @IBOutlet weak var checkButton: UIButton!
    
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var bottomViewLabel: UILabel!
    @IBOutlet weak var bottomViewTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var quoteText: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        prepareStyling()
        populateQuestionText()
    }
    
    
    @IBAction func closeButtonPressed(_ sender: UIButton) {
        print("BUTTON PRESSSED")
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func checkButtonPressed(_ sender: UIButton) {
        
        if sender.titleLabel?.text == QuizButtonText.CHECK.rawValue {
            raiseBottomView()
        } else if sender.titleLabel?.text == QuizButtonText.CONTINUE.rawValue {
            lowerBottomView()
        }
        
    }
    
    @IBAction func authorButtonPressed(_ sender: UIButton) {
        leftButton.borderAndShadowMe()
        rightButton.borderAndShadowMe()
        sender.buttonSelectedStyling()
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
            self.bottomView.alpha = 0
            self.bottomViewLabel.alpha = 0
            self.checkButton.setTitle(QuizButtonText.CHECK.rawValue, for: .normal)
        } completion: { (complete: Bool) in
            self.bottomViewTopConstraint.constant += self.bottomView.bounds.height
            self.bottomView.alpha = 1
            self.bottomViewLabel.alpha = 1
        }
    }
    
    func prepareStyling() {
        progressView.transform = CGAffineTransform(scaleX: 1, y: 3)
        leftButton.borderAndShadowMe()
        rightButton.borderAndShadowMe()
        checkButton.shadowMe()
    }
    
    func populateQuestionText() {
        let question = quizBrain.getQuestion()
        quoteText.text = question.quoteText
        leftButton.setTitle(question.author1, for: .normal)
        rightButton.setTitle(question.author2, for: .normal)
    }
}




