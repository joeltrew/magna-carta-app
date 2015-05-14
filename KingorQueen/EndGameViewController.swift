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
    var fullRoyalName:String?
    
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
        self.fullRoyalName = fullRoyalName
        
    }
    
    
    @IBAction func tweetButton(sender: AnyObject) {
        // 1
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter) {
            // 2
            var tweetSheet = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            // 3
           
            tweetSheet.setInitialText("I have been crowned \(fullRoyalName!). Find out your name with the Rule for a Day App")
            
            tweetSheet.addImage(workOutName(passedPlayer!).sealImage)
            
            // 4
            self.presentViewController(tweetSheet, animated: true, completion: nil)
        } else {
            // 5
            showAlert()
            println("error")
        }
    }
    
    func workOutName(player: Player) -> (endName:String, sealImage:UIImage) {
        
        let playerScores = (player.strength,player.morality,player.humour,player.modern)

        let low = (0...299)
        let high = (300...1000)

        
        
        switch playerScores{
       
            
        case(high,high,low,low):return	("the Bloodthirsty", UIImage(named: "seal2")!)
        case(high,low,high,low):return	("the Drunk", UIImage(named: "seal2")!)
        case(high,low,low,high):return	("the Politician", UIImage(named: "seal2")!)
        case(low,high,high,low):return	("the Mad", UIImage(named: "seal2")!)
        case(low,high,low,high):return	("the Hacker", UIImage(named: "seal2")!)
        case(low,low,high,high):return	("the Meme Maker", UIImage(named: "seal2")!)
        case(high,low,low,low):return    ("the Great", UIImage(named: "seal2")!)
        case(low,high,low,low):return    ("the Grim", UIImage(named: "seal2")!)
        case(low,low,high,low):return    ("the Jester", UIImage(named: "seal2")!)
        case(low,low,low,high):return	  ("the Futuristic", UIImage(named: "seal2")!)
        case(high,high,high,low):return   ("the Taker of Heads", UIImage(named: "seal2")!)
        case(high,low,high,high):return   ("the Gamer", UIImage(named: "seal2")!)
        case(high,high,low,high):return   ("the Terminator", UIImage(named: "seal2")!)
        case(low,high,high,high):return   ("the Keyboard Warrior", UIImage(named: "seal2")!)
            
        default:
            //this is the default case in which if nothing is matched then the next line is printed
            println("Error!!!!!!")
            return ("the Error", UIImage(named: "seal5")!)
        }
    }
    
    @IBAction func showAlert() {
        var alert : UIAlertView = UIAlertView(title: "No twitter account found", message: "Please add a Twitter account to your iDevice to use this service",       delegate: nil, cancelButtonTitle: "Ok")
        
        alert.show()
    }

    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}