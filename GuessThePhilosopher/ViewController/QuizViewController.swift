//
//  QuizViewController.swift
//  GuessThePhilosopher
//
//  Created by xavier chia on 13/11/20.
//

import UIKit

class QuizViewController: UIViewController {
    var quizBrain = QuizBrain()
    
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var bottomView: UIView!
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        print("BUTTON PRESSSED")
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func checkButtonPressed(_ sender: UIButton) {
        switch quizBrain.currentStatus {
        case QuizStatus.waiting:
            bottomView.animShow()
            quizBrain.currentStatus = QuizStatus.correct
        case QuizStatus.correct:
            bottomView.animHide()
            quizBrain.currentStatus = QuizStatus.waiting
        case QuizStatus.wrong:
            bottomView.animHide()
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        progressView.transform = CGAffineTransform(scaleX: 1, y: 3)
        resetButton.shadowMe()
        leftButton.borderAndShadowMe()
        rightButton.borderAndShadowMe()
    }
    
}

extension UIView{
    func animShow(){
        UIView.animate(withDuration: 0.2) {
            self.center.y -= self.bounds.height
        }
    }
    func animHide(){
        UIView.animate(withDuration: 0.2) {
            self.backgroundColor = UIColor.clear
        } completion: { (complete: Bool) in
            self.center.y += self.bounds.height
            self.backgroundColor = UIColor.white
        }
    }
}
