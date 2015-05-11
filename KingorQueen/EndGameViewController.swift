//
//  EndGameViewController.swift
//  King for a Day
//
//  Created by Joel Trew on 01/05/2015.
//  Copyright (c) 2015 Group 10. All rights reserved.
//

import UIKit
import Social
import Foundation

class EndGameViewController: UIViewController {
    

   
    @IBOutlet weak var sealImageView: UIImageView!
    @IBOutlet weak var royalNameLabel: UILabel!
    
    var passedPlayer:Player?
    
    override func viewDidLoad() {
        passedPlayer?.printPlayerScores()
        
        let royalName = passedPlayer?.coolName()
        let nameEnd = workOutName(passedPlayer!).endName
        let seal = workOutName(passedPlayer!).sealImage
        let nameStart = royalName
        let fullRoyalName = nameStart! + " " + nameEnd
        
        self.royalNameLabel.text = fullRoyalName
        println(fullRoyalName)
        self.sealImageView.image = seal
        
    }
    
    
    @IBAction func tweetButton(sender: AnyObject) {
        // 1
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter) {
            // 2
            var tweetSheet = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            // 3
            tweetSheet.setInitialText(workOutName(passedPlayer!).endName)
            tweetSheet.addImage(workOutName(passedPlayer!).sealImage)
            
            // 4
            self.presentViewController(tweetSheet, animated: true, completion: nil)
        } else {
            // 5
            println("error")
        }
    }
    
    func workOutName(player: Player) -> (endName:String, sealImage:UIImage) {
        
        let playerScores = (player.strength,player.morality,player.humour,player.modern)
        let vlow = (0...199)
        let low = (200...299)
        let high = (300...499)
        let vhigh = (500...1000)
        
        
        switch playerScores{
       
        case (vhigh,vhigh,vlow,vlow): return ("the Bloodthirsty", UIImage(named: "seal2")!)
        case (vhigh,high,low,vlow): return ("the Cruel", UIImage(named: "seal2")!)
        case (vhigh,high,vlow,low): return ("the Conquerer", UIImage(named: "seal2")!)
        case (vhigh,low,high,vlow): return ("the Brave", UIImage(named: "seal2")!)
        case (vhigh,low,vlow,high): return ("the Tank", UIImage(named: "seal2")!)
        case (vhigh,vlow,vhigh,vlow): return ("the Devil", UIImage(named: "seal2")!)
        case (vhigh,vlow,low,high): return ("the Kind", UIImage(named: "seal2")!)
        case (vhigh,vlow,high,low): return ("the Strong", UIImage(named: "seal2")!)
        case (vhigh,vlow,vlow,vhigh): return ("the Terminator", UIImage(named: "seal2")!)
        case (high,vhigh,low,vlow): return ("the Executionar", UIImage(named: "seal2")!)
        case (high,vhigh,vlow,low): return ("the Wicked", UIImage(named: "seal2")!)
        case (high,high,low,low): return ("the Fearless", UIImage(named: "seal2")!)
        case (high,low,high,low): return ("the Great", UIImage(named: "seal2")!)
        case (high,vlow,vhigh,low): return ("the Tough", UIImage(named: "seal2")!)
        case (high,low,low,high): return ("the Rich", UIImage(named: "seal2")!)
        case (high,low,vlow,vhigh): return ("the Lionheart", UIImage(named: "seal2")!)
        case (high,vlow,vhigh,low): return ("the Merry", UIImage(named: "seal2")!)
        case (high,vlow,low,vhigh): return ("the Fair", UIImage(named: "seal2")!)
        case (low,vhigh,high,vlow): return ("the Mad", UIImage(named: "seal2")!)
        case (low,vhigh,vlow,high): return ("the Terrible", UIImage(named:  "seal2")!)
        case (low,high,vhigh,vlow): return ("the Jester", UIImage(named: "seal2")!)
        case (low,high,high,low): return ("the Joker", UIImage(named: "seal2")!)
        case (low,high,vlow,vhigh): return ("the Peaceful", UIImage(named: "seal2")!)
        case (low,low,high,high): return ("the Sloth", UIImage(named: "seal2")!)
        case (low,high,low,high): return ("the Impaler", UIImage(named: "seal2")!)
        case (low,vlow,high,vhigh): return ("the Diplomat", UIImage(named: "seal2")!)
        case (low,vlow,vhigh,high): return ("the Good", UIImage(named: "seal2")!)
        case (vlow,vhigh,vhigh,vlow): return ("the Vampire", UIImage(named: "seal2")!)
        case (vlow,vhigh,high,low): return ("the Grim", UIImage(named: "seal2")!)
        case (vlow,vhigh,low,high): return ("the Damned", UIImage(named: "seal2")!)
        case (vlow,vhigh,vlow,vhigh): return ("the Bad", UIImage(named: "seal2")!)
        case (vlow,high,vhigh,low): return ("the Dung Named:", UIImage(named: "seal2")!)
        case (vlow,high,low,vhigh): return ("the Mad Scientist", UIImage(named: "seal2")!)
        case (vlow,low,vhigh,high): return ("the Weak", UIImage(named: "seal2")!)
        case (vlow,low,high,vhigh): return ("the Gentle", UIImage(named: "seal2")!)
        case (vlow,vlow,vhigh,vhigh): return ("the Troll", UIImage(named: "seal2")!)
            
        default:
            //this is the default case in which if nothing is matched then the next line is printed
            println("Error!!!!!!")
            return ("the Error", UIImage(named: "seal5")!)
        }
    }
}