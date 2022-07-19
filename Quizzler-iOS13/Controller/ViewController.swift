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
    @IBOutlet weak var trueButtton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    var quizBrain = QuizBrain()
    
    var totalQuestions:Float = 0
    var totalProgress:Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUi()
        totalQuestions = Float(quizBrain.quizQuestions.count)
    }
    
    
    func updateUi(){
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(update), userInfo: nil, repeats: false)
    }
    @objc func update() {
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        questionLabel.text = quizBrain.getQuestionText()
        trueButtton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.setProgress(quizBrain.getProgress(),animated:true)
        
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        totalProgress += 1
        let userAnswer = sender.currentTitle ?? ""
        let userGotItRight = quizBrain.checkAnswer(answer: userAnswer)
        
        let percentageProgress = totalProgress / totalQuestions
        
        progressBar.setProgress(Float(percentageProgress), animated:true)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        let quizEnded = quizBrain.nextQuestion()
        
        if quizEnded{
            totalProgress = 0
            progressBar.setProgress(0,animated: true)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "StatusViewController") as? StatusViewController
            vc?.score = "Your Score is : \(quizBrain.getScore())"
            self.navigationController?.pushViewController(vc!, animated: true)
        }
        updateUi()
    }
}
