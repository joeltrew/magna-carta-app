//
//  AnswersService.swift
//  King for a Day
//
//  Created by Joel Trew on 29/04/2015.
//  Copyright (c) 2015 Tristan Earl. All rights reserved.
//

import Foundation


protocol AnswersServiceDelegate: class {
    func didLoadAnswers(answers: [Question])
}



class AnswersService: NSObject {
    
    weak var delegate: AnswersServiceDelegate?
    private let answersDataPath: String
    init(answersDataPath: String) {
        self.answersDataPath = answersDataPath
    }
    
    
    func loadAnswers() {
        let url = NSURL(string:"http://joeltrew.com/kfadAnswers.json")!
        let request = NSURLRequest(URL: url)
        let data = NSData(contentsOfURL: url)
        let json:JSON = JSON(data:data!)

        var questionsArray = [Question]()
        
        for (key: String, que: JSON) in json["questions"] {
            
            var answersArray = [Answer]()
            
            
            
            
            for(index:String, ans:JSON) in que["answers"] {
                
                //println(ans["answerText"])
                
                var answertext = ans["answerText"].string
                var answerstrength = ans["answerStrength"].int
                var answermorality = ans["answerMorality"].int
                var answerhumour = ans["answerHumour"].int
                var answermodern = ans["answerModern"].int
                
                var answers = Answer(answerText: answertext!, answerStrength: answerstrength!, answerMorality: answermorality!, answerHumour: answerhumour!, answerModern: answermodern!)
                answersArray.append(answers)
                
            
            }
            var questiontext = que["question"].string
            var question = Question(questionText: questiontext!, answers: answersArray)
            
            questionsArray.append(question)
      
            
        }
        self.delegate?.didLoadAnswers(questionsArray)
        println(questionsArray.count)
        println(questionsArray[0].answers[1].answerText)
    }
}