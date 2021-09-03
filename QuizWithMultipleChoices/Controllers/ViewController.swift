//
//  ViewController.swift
//  QuizWithMultipleChoices
//
//  Created by Kalyanam Bhargava Ram on 9/3/21.
//


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var lblScore: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var btnAnswer1: UIButton!
    @IBOutlet weak var btnAnswer2: UIButton!
    @IBOutlet weak var btnAnswer3: UIButton!
    
    
    var quizBrain = QuizQuestionsBrain()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        updateUI()
        
        
        
    }


    @IBAction func btnAnswerClicked(_ sender: UIButton)  {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
       
        
        Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateUI), userInfo: nil, repeats: true)
        quizBrain.nextQuestion()
    }
    
    @objc func updateUI() {
        lblQuestion.text = quizBrain.getQuestionText()
        print(quizBrain.getChoiceAnswers())
        let aryChoices = quizBrain.getChoiceAnswers()
        btnAnswer1.setTitle(aryChoices[0], for: .normal)
        btnAnswer2.setTitle(aryChoices[1], for: .normal)
        btnAnswer3.setTitle(aryChoices[2], for: .normal)
        progressBar.progress = quizBrain.getProgress()
        btnAnswer1.backgroundColor = UIColor.clear
        btnAnswer2.backgroundColor = UIColor.clear
        btnAnswer3.backgroundColor = UIColor.clear
        lblScore.text = "Score:  \(quizBrain.getScore())"
    }
}

