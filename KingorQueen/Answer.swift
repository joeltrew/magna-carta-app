//
//  Answer.swift
//  KingorQueen
//
//  Created by Tristan Earl and Joel Trew on 13/03/2015.
//  Copyright (c) 2015 Group 10. All rights reserved.
//

import UIKit

class Answer: NSObject {
    
    var answerText = ""
    
    var answerStrength : Int
    var answerMorality : Int
    var answerHumour : Int
    var answerModern : Int
    
    
    init(answerText: String, answerStrength: Int, answerMorality: Int, answerHumour: Int, answerModern: Int ) {
        self.answerText = answerText
        self.answerStrength = answerStrength
        self.answerMorality = answerMorality
        self.answerHumour = answerHumour
        self.answerModern = answerModern
    }
   
}
