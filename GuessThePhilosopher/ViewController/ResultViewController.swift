//
//  ResultViewController.swift
//  GuessThePhilosopher
//
//  Created by xavier chia on 20/11/20.
//

import UIKit

class ResultViewController: UIViewController {
    var quizBrain = QuizBrain()
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var againButton: UIButton!
    
    @IBAction func againButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quizBrain.playSound(Sound.finish)
        
        scoreLabel.text = "\(Int(quizBrain.score)) / \(Int(quizBrain.totalQuestions))"
        adviceLabel.text = quizBrain.result.advice
        view.backgroundColor = quizBrain.result.color
        
        againButton.layer.shadowColor = #colorLiteral(red: 0.3465779424, green: 0.6556648612, blue: 0.005139762536, alpha: 1)
        againButton.layer.shadowRadius = 0.0
        againButton.layer.shadowOffset = CGSize(width: 0, height: 5)
        againButton.layer.shadowOpacity = 1.0

        // Do any additional setup after loading the view.
    }

}
