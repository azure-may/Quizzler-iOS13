//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    var colors = [UIColor.clear, UIColor.green, UIColor.red]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        sender.backgroundColor = colors[quizBrain.checkAnswer(sender.currentTitle!)]
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.backgroundColor = UIColor.clear
            self.updateUI()
        }
    }
    
    func updateUI() {
        let (question, progress, score) = quizBrain.fetchData()
        progressBar.progress = progress
        questionLabel.text = question
        scoreLabel.text = "SCORE: \(score)"
    }
    
}

