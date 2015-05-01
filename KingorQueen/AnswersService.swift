//
//  AnswersService.swift
//  King for a Day
//
//  Created by Joel Trew on 29/04/2015.
//  Copyright (c) 2015 Tristan Earl. All rights reserved.
//

import Foundation


protocol AnswersServiceDelegate: class {
    func didLoadQuestionsAndAnswers(questionsAndAnswers: [Question])
}



class AnswersService: NSObject {
    
    weak var delegate: AnswersServiceDelegate?
    private let answersDataPath: String
    
    init(answersDataPath: String) {
        self.answersDataPath = answersDataPath
    }
    
    
    func loadAnswers() {
        //load json url
        let url = NSURL(string:answersDataPath)!
        let request = NSURLRequest(URL: url)
        let data = NSData(contentsOfURL: url)
        //init json with url data
        let json:JSON = JSON(data:data!)

        var questionsArray = [Question]()
        //set up questionsArray which will hold our quetions which will in turn hold our answers
        
        for (key: String, que: JSON) in json["questions"] {
            //loop through all the questions
            
            var answersArray = [Answer]()
            //create an Array to store our Answers in
            
            for(index:String, ans:JSON) in que["answers"] {
                //loop through all the answers in a question
                
                var answertext = ans["answerText"].string
                var answerstrength = ans["answerStrength"].int
                var answermorality = ans["answerMorality"].int
                var answerhumour = ans["answerHumour"].int
                var answermodern = ans["answerModern"].int
                //set json data values to new variables we will use
                
                var answers = Answer(answerText: answertext!, answerStrength: answerstrength!, answerMorality: answermorality!, answerHumour: answerhumour!, answerModern: answermodern!)
                //initialise Answer object with new variables from the json
                answersArray.append(answers)
                //add/append that Answer to the array we made
            }
            
            var questiontext = que["question"].string
            //get the question text variable from json data
            
            var question = Question(questionText: questiontext!, answers: answersArray)
            //initalise a new Question object with both the question text and the array of Answers we just made
            
            questionsArray.append(question)
            //add the Question(with child answers) to large questionArray which we will pass to the viewcontroller
            
        }
        self.delegate?.didLoadQuestionsAndAnswers(questionsArray)
        //delegate the questionsArray which is full of our questions and answers
    }
}