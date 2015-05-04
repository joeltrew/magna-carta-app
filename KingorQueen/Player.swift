//
//  Player.swift
//  KingorQueen
//
//  Created by Tristan on 13/03/2015.
//  Copyright (c) 2015 Tristan Earl. All rights reserved.
//

import UIKit

enum Gender {
    case Male
    case Female
}

class Player: NSObject {
    
    var name: String
    var gender: Gender
    
    var morality = 0
    var strength = 0
    var humour = 0
    var modern = 0
    
    init(name: String, gender: Gender) {
        self.name = name
        self.gender = gender
    }
    
    func coolName() -> String {
        switch gender {
        case .Male : return "King \(name)"
        case .Female : return "Queen \(name)"
        }
    }

    
    func getGender() -> String {
        switch gender {
        case .Male : return "Male"
        case .Female : return "Female"
        }
    }
    
    func printPlayerScores(){
        var coolPlayerName = coolName()
        println("\(coolPlayerName) Str =\(self.strength)","\(coolPlayerName) Morals= \(self.morality)","\(coolPlayerName) Humour= \(self.humour)","\(coolPlayerName) Modern= \(self.modern)")
    }
}
