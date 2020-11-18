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
    
    @IBOutlet weak var closeQuizButton: UIButton!
    @IBOutlet weak var leftButton: LayoutableButton!
    @IBOutlet weak var rightButton: LayoutableButton!
    @IBOutlet weak var checkButton: UIButton!
    
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var bottomViewTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var quoteText: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        prepareStyling()
        populateQuestionText()
    }
    
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
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
        resetAuthorButtonStyling(leftButton)
        resetAuthorButtonStyling(rightButton)
        sender.layer.borderColor = #colorLiteral(red: 0, green: 0.7176470588, blue: 0.7607843137, alpha: 1)
        sender.layer.shadowColor = #colorLiteral(red: 0, green: 0.7176470588, blue: 0.7607843137, alpha: 1)
        sender.backgroundColor = #colorLiteral(red: 0.8549019608, green: 0.7843137255, blue: 0.6352941176, alpha: 1)
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
            self.bottomView.backgroundColor = UIColor.clear
            self.checkButton.setTitle(QuizButtonText.CHECK.rawValue, for: .normal)
        } completion: { (complete: Bool) in
            self.bottomViewTopConstraint.constant += self.bottomView.bounds.height
            self.bottomView.backgroundColor = UIColor.red
        }
    }
    
    func prepareStyling() {
        progressView.transform = CGAffineTransform(scaleX: 1, y: 3)
        closeQuizButton.shadowMe()
        leftButton.borderAndShadowMe()
        rightButton.borderAndShadowMe()
    }
    
    func resetAuthorButtonStyling(_ buttonToReset: LayoutableButton) {
        buttonToReset.layer.borderColor = #colorLiteral(red: 0.05882352941, green: 0.2980392157, blue: 0.4588235294, alpha: 1)
        buttonToReset.layer.shadowColor = #colorLiteral(red: 0.05882352941, green: 0.2980392157, blue: 0.4588235294, alpha: 1)
        buttonToReset.layer.backgroundColor = #colorLiteral(red: 0.9921568627, green: 0.7960784314, blue: 0.6196078431, alpha: 1)
    }
    
    
    func populateQuestionText() {
        let question = quizBrain.question
        quoteText.text = question.quoteText
        leftButton.setTitle(question.author1, for: .normal)
        rightButton.setTitle(question.author2, for: .normal)
        leftButton.setTitle(question.author1, for: .normal)
        rightButton.setTitle(question.author2, for: .normal)
    }
}




