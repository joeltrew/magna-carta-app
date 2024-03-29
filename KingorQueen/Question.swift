//
//  Questions.swift
//  KingorQueen
//
//  Created by Tristan Earl and Joel Trew on 13/03/2015.
//  Copyright (c) 2015 Group 10. All rights reserved.
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
