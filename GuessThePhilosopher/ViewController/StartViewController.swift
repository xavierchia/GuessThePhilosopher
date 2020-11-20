//
//  ViewController.swift
//  GuessThePhilosopher
//
//  Created by xavier chia on 12/11/20.
//

import UIKit

class StartViewController: UIViewController {
    
    @IBOutlet weak var beginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        beginButton.backgroundColor = #colorLiteral(red: 0.3452036977, green: 0.8009640574, blue: 0.006656988058, alpha: 1)
        beginButton.layer.shadowColor = #colorLiteral(red: 0.3465779424, green: 0.6556648612, blue: 0.005139762536, alpha: 1)
        beginButton.layer.shadowRadius = 0.0
        beginButton.layer.shadowOffset = CGSize(width: 0, height: 5)
        beginButton.layer.shadowOpacity = 1.0
    }

}


