//
//  ViewController.swift
//  GuessThePhilosopher
//
//  Created by xavier chia on 12/11/20.
//

import UIKit

class StartViewController: UIViewController {
    
    @IBOutlet weak var beginButton: UIButton!
    
    @IBAction func beginButtonTouchDown(_ sender: UIButton) {
        beginButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        beginButton.frame.origin.y += 5
    }
    @IBAction func beginButtonTouchUp(_ sender: UIButton) {
        resetBeginButton()
        beginButton.frame.origin.y -= 5
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resetBeginButton()
    }
    
    func resetBeginButton() {
        beginButton.layer.shadowColor = #colorLiteral(red: 0.3465779424, green: 0.6556648612, blue: 0.005139762536, alpha: 1)
        beginButton.layer.shadowRadius = 0.0
        beginButton.layer.shadowOffset = CGSize(width: 0, height: 5)
        beginButton.layer.shadowOpacity = 1.0
    }

}


