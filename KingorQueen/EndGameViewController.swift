//
//  EndGameViewController.swift
//  King for a Day
//
//  Created by Joel Trew on 01/05/2015.
//  Copyright (c) 2015 Tristan Earl. All rights reserved.
//

import UIKit
import Foundation

class EndGameViewController: UIViewController {
    
    @IBOutlet weak var royalNameLabel: UILabel!
    var passedPlayer:Player?
    
    override func viewDidLoad() {
        let royalName = passedPlayer?.coolName()
        
        passedPlayer?.printPlayerScores()
        let nameEnd = workOutName(passedPlayer!)
        let nameStart = passedPlayer?.name
        
        let fullRoyalName = nameStart! + " " + nameEnd
        royalNameLabel.text = fullRoyalName
        
    }
    
    
    func workOutName(player: Player) -> String {
        
        let playerScores = (player.strength,player.morality,player.humour,player.modern)
        
        switch playerScores{
        case (100 ... 170,  -100 ... -30,  10 ... 80,  -80 ... -60):
            //in this case if the player strength is between 100 and 170,
            //and the morality is between -100 and -30, and the hunour is between 10 and 80,
            // and the modern is between -80 and -60 
            // then it will print the line below
            return "the Mad"
        case (100 ... 170, -100 ... -30 ,_,_):
            //in this case if the player strength is between 100 and 170, and the morality is between -100 and -30 then it will print the line below without any humour or modern values having to be checked
            return "the Evil"
            //in this case if the players strength is the only thing checked
        case (100...170,_,_,_):
            return "the Crazy"
            
        default:
            //this is the default case in which if nothing is matched then the next line is printed
           return "the Boreing"
        }
    }
}