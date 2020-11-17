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
    
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var checkButton: UIButton!
    
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var bottomViewTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var quoteText: UILabel!
    @IBOutlet weak var leftAuthorText: UILabel!
    @IBOutlet weak var rightAuthorText: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        progressView.transform = CGAffineTransform(scaleX: 1, y: 3)
        resetButton.shadowMe()
        leftButton.borderAndShadowMe()
        rightButton.borderAndShadowMe()
        
        let question = quizBrain.question
        quoteText.text = question.quoteText
        leftAuthorText.text = question.author1
        rightAuthorText.text = question.author2
    }
    
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        print("BUTTON PRESSSED")
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func checkButtonPressed(_ sender: UIButton) {
        
        if sender.titleLabel?.text == "CHECK" {
            UIView.animate(withDuration: 0.2) {
                self.bottomViewTopConstraint.constant -= self.bottomView.bounds.height
                sender.setTitle("CONTINUE", for: .normal)
                self.view.layoutIfNeeded()
            }
        } else {
            UIView.animate(withDuration: 0.2) {
                self.bottomView.backgroundColor = UIColor.clear
                sender.setTitle("CHECK", for: .normal)
            } completion: { (complete: Bool) in
                self.bottomViewTopConstraint.constant += self.bottomView.bounds.height
                self.bottomView.backgroundColor = UIColor.red
            }
        }
    }
}


