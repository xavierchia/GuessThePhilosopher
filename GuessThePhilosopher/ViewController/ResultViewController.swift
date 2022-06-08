//
//  ResultViewController.swift
//  GuessThePhilosopher
//
//  Created by xavier chia on 20/11/20.
//

import UIKit

class ResultViewController: UIViewController {
    let soundPlayer = SoundPlayer()
    var viewModel: ResultViewModel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var againButton: UIButton!
    
    @IBAction func againButtonTouchDown(_ sender: UIButton) {
        againButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        againButton.frame.origin.y += 5
    }
    @IBAction func againButtonTouchUp(_ sender: UIButton) {
        resetAgainButton()
        againButton.frame.origin.y -= 5
        soundPlayer.playSound(Sound.start)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func infoButtonPressed(_ sender: UIButton) {
        print("Info button pressed")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        soundPlayer.playSound(Sound.finish)
        resetAgainButton()

        if let viewModel = viewModel {
            setupView(viewModel: viewModel)
        }
    }
    
    func setupView(viewModel: ResultViewModel) {
        scoreLabel.text = viewModel.scoreLabelText
        adviceLabel.text = viewModel.resultType.advice
        view.backgroundColor = viewModel.resultType.color
    }
    
    func resetAgainButton() {
        againButton.layer.shadowColor = #colorLiteral(red: 0.3465779424, green: 0.6556648612, blue: 0.005139762536, alpha: 1)
        againButton.layer.shadowRadius = 0.0
        againButton.layer.shadowOffset = CGSize(width: 0, height: 5)
        againButton.layer.shadowOpacity = 1.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }

}
