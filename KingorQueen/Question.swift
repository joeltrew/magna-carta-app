//
//  Questions.swift
//  KingorQueen
//
//  Created by Tristan on 13/03/2015.
//  Copyright (c) 2015 Tristan Earl. All rights reserved.
//

import UIKit


class Question: NSObject {
    
    var questionText: String
    var questionImage: UIImage
    var answers: [Answer]
    
    
    init(questionText: String, questionImage:UIImage, answers: [Answer]) {
        self.questionText = questionText
        self.questionImage = questionImage
        self.answers = answers

    }
}
