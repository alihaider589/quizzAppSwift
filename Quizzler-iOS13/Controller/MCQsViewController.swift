//
//  MCQsViewController.swift
//  Quizzler-iOS13
//
//  Created by Ali Haider on 19/07/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class MCQsViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var mcqBrain = MCQQuizBrain()
    var totalQuestions:Float = 0
    var totalProgress:Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUi()
    }

    func updateUi(){
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(update), userInfo: nil, repeats: false)
    }
    @objc func update() {
        scoreLabel.text = "Score: \(mcqBrain.getScore())"
        questionLabel.text = mcqBrain.getQuestionText()
        let buttonTitles = mcqBrain.getButtonTitles()
        firstButton.setTitle(buttonTitles[0], for: .normal)
        secondButton.setTitle(buttonTitles[1], for: .normal)
        thirdButton.setTitle(buttonTitles[2], for: .normal)
        firstButton.backgroundColor = UIColor.clear
        secondButton.backgroundColor = UIColor.clear
        thirdButton.backgroundColor = UIColor.clear
        print(mcqBrain.getProgress())
        progressBar.setProgress(mcqBrain.getProgress(),animated:true)
        
    }
    
    @IBAction func buttonPress(_ sender: UIButton) {
        totalProgress += 1
        let userAnswer = sender.currentTitle ?? ""
        let userGotItRight = mcqBrain.checkAnswer(answer: userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        let quizEnded = mcqBrain.nextQuestion()
        
        if quizEnded{
            totalProgress = 0
            progressBar.setProgress(0,animated: true)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "StatusViewController") as? StatusViewController
            vc?.score = "Your Score is : \(mcqBrain.getScore())"
            self.navigationController?.pushViewController(vc!, animated: true)
            
        }
        updateUi()
    }
    
}
