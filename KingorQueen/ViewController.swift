//
//  ViewController.swift
//  King for a Day
//
//  Created by Tristan Earl on 02/03/2015.
//  Copyright (c) 2015 Tristan Earl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // variables
    @IBOutlet weak var questionlabel: UILabel!
    
    //buttons
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    var buttonArray: [UIButton] {return [button1, button2, button3, button4 ]}
    
   //question variables
    var questions = [Question]()
    var currentQuestionIndex = 0
    var currentQuestion: Question { return questions[currentQuestionIndex] }
    
    
    //init player
    var player = Player(name: "Dan", gender: .Male)
    //
    
   //json variables
    let answersDataPath = "http://joeltrew.com/kfadAnswers.json"
    var answersService: AnswersService!
    //
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
        
        //Initialises Answers for Question 1
        var question1Answers = [
            Answer(answerText: "Declare War", answerStrength: 20, answerMorality: -10, answerHumour: 0, answerModern: 0),
            Answer (answerText: "Burn the Leaders at the Stake", answerStrength: 5, answerMorality: -25, answerHumour: 5, answerModern: -25),
            Answer(answerText: "Post a Facebook Status", answerStrength: -20, answerMorality: 0, answerHumour: 25, answerModern: 25),
            Answer(answerText: "Give them what they want", answerStrength: -15, answerMorality: 25, answerHumour: 0, answerModern: 0)
        ]
        
        // Initialises Question 1
        var question1 = Question(questionText: "The Peasants are Rebelling. \n What do you do?", answers: question1Answers)
        
        //Adds Question 1 to question array
        questions.append(question1)
        
        //Initialises Answers for Question 2
        var question2Answers = [
            Answer(answerText: "Raise Taxes", answerStrength: 10, answerMorality: -20, answerHumour: -10, answerModern: 0),
            Answer(answerText: "Do Nothing", answerStrength: -20, answerMorality: -10, answerHumour: 10, answerModern: 10),
            Answer(answerText: "Blame the Celts", answerStrength: -25, answerMorality: -5, answerHumour: 25, answerModern: -25),
            Answer(answerText: "Steal from the Rich", answerStrength: 20, answerMorality: 5, answerHumour: 5, answerModern: 10)
        ]
        
        //Initialises Question 2
        var question2 = Question(questionText: "You've run out of Money. \n What do you do?", answers: question2Answers)
        //Adds Question 2 to question array
        questions.append(question2)
        
        
        //Initialises Answers for Question 3
        var question3Answers = [
            Answer(answerText: "Raise 3xes", answerStrength: 10, answerMorality: -20, answerHumour: -10, answerModern: 0),
            Answer(answerText: "Do Nothing", answerStrength: -20, answerMorality: -10, answerHumour: 10, answerModern: 10),
            Answer(answerText: "Blame the Celts", answerStrength: -25, answerMorality: -5, answerHumour: 25, answerModern: -25),
            Answer(answerText: "Steal from the Rich", answerStrength: 20, answerMorality: 5, answerHumour: 5, answerModern: 10)
        ]
        
        //Initialises Question 3
        var question3 = Question(questionText: "Test 3", answers: question3Answers)
        //Adds Question 3 to question array
        questions.append(question3)
        
        
    }
    
    
    func addScoreToPlayer(buttonIndex:Int) {
        //adds answer scores to player scores and prints  
        
        let answer = currentQuestion.answers[buttonIndex]
        player.strength += currentQuestion.answers[buttonIndex].answerStrength
        player.morality += currentQuestion.answers[buttonIndex].answerMorality
        player.humour += currentQuestion.answers[buttonIndex].answerHumour
        player.modern += currentQuestion.answers[buttonIndex].answerModern
        player.printPlayerScores()
    }
    


    
    func finalScorePrint() {
            
            println("\n----FINAL SCORES----\n")
            player.printPlayerScores()
    }
    
    
    @IBAction func tappedButton(sender: UIButton) {
        
        let lastQuestion = questions.count-1
        let buttonIndex = find(buttonArray, sender)!

        
        if currentQuestionIndex == (lastQuestion){
            addScoreToPlayer(buttonIndex)
            finalScorePrint()
            
            // do something else here which removes the buttons
        }else {
            

            // Which button was tapped
            
            addScoreToPlayer(buttonIndex)
            
            //Checks to make sure questions array does not get out of range
            
            if currentQuestionIndex < (lastQuestion){
                currentQuestionIndex++
                //sets question label to the current question text
                questionlabel.text = questions[currentQuestionIndex].questionText
            }
            
            //Goes through each item in the button array
            for (index, button) in enumerate(self.buttonArray) {
                
                //sets the button title to answer
                button.setTitle(currentQuestion.answers[index].answerText, forState: UIControlState.Normal)
                
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //sets question label to first question in question array
        questionlabel.text = questions[0].questionText
        
        
        for (index, item) in enumerate(self.buttonArray) {
            //sets the line break mode for each button to warp to the next line
            item.titleLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
            
            //sets the button title to
            item.setTitle(currentQuestion.answers[index].answerText, forState: UIControlState.Normal)
            
            
           
            
        }
        
      
        answersService = AnswersService(answersDataPath: answersDataPath)
        answersService.delegate = self
        answersService.loadAnswers()
        
    
        
    
    }
    


    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }
    
    
    
    
    
}

extension ViewController: AnswersServiceDelegate {
    func didLoadAnswers(answers:[Question]){
        var questions = answers
        
    }
}


