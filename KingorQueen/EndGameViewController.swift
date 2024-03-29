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
    @IBOutlet weak var sealDescription: UILabel!
    var passedPlayer:Player?
    var fullRoyalName:String?
    
    override func viewDidLoad() {
        passedPlayer?.printPlayerScores()
        
        let royalName = passedPlayer?.coolName()
        let nameEnd = workOutName(passedPlayer!).endName
        let seal = workOutName(passedPlayer!).sealImage
        let sealText = workOutName(passedPlayer!).sealText
        let nameStart = royalName
        let fullRoyalName = nameStart! + " " + nameEnd
        
        self.royalNameLabel.text = fullRoyalName
        println(fullRoyalName)
        self.sealImageView.image = seal
        self.fullRoyalName = fullRoyalName
        self.sealDescription.text = "“" + sealText + "”"
        
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
    
    func workOutName(player: Player) -> (endName:String, sealImage:UIImage, sealText:String) {
        
        let playerScores = (player.strength,player.morality,player.humour,player.modern)

        let low = (0...299)
        let high = (300...1000)

        
        
        switch playerScores{
        case(high,high,low,low):return	("the Bloodthirsty", UIImage(named: "Seal_The_Bloodthirsty")!, "They threaten the innocent who spare the guilty")
        case(high,low,high,low):return	("the Drunk", UIImage(named: "Seal_The_Drunk")!, "In wine there is truth")
        case(high,low,low,high):return	("the Politician", UIImage(named: "Seal_The_Politician")!, "Where there is unity, there is victory")
        case(low,high,high,low):return	("the Mad", UIImage(named: "Seal_The_Mad")!, "If madness comes, death will follow")
        case(low,high,low,high):return	("the Hacker", UIImage(named: "Seal_The_Hacker")!, "I am the Lord of Computers")
        case(low,low,high,high):return	("the Meme Maker", UIImage(named: "Seal_The_Meme_Maker")!, "I am the Creator of Memes")
        case(high,low,low,low):return    ("the Great", UIImage(named: "Seal_The_Great")!, "The important thing isn't how long you live, but how well you live")
        case(low,high,low,low):return    ("the Grim", UIImage(named: "Seal_The_Grim")!, "Either kill or be killed")
        case(low,low,high,low):return    ("the Jester", UIImage(named: "Seal_The_Jester")!, "I am the Lord of Comedy")
        case(low,low,low,high):return	  ("the Futurist", UIImage(named: "Seal_The_Futuristic")!, "Technology is the road to success")
        case(high,high,high,low):return   ("the Taker of Heads", UIImage(named: "Seal_The_Taker_Of_Heads")!, "A life of shame leaves no room even for an honorable death")
        case(high,low,high,high):return   ("the Gamer", UIImage(named: "Seal_The_Gamer")!, "Work hard, play harder")
        case(high,high,low,high):return   ("the Terminator", UIImage(named: "Seal_The_Terminator")!, "All fall before my powers of robotics")
        case(low,high,high,high):return   ("the Keyboard Warrior", UIImage(named: "Seal_The_Keyboard_Warrior")!, "I came, I saw, and I have the power of the Internet")
            
        default:
            //this is the default case in which if nothing is matched then the next line is printed
            println("Error!!!!!!")
            return ("the Nothing Special", UIImage(named: "Seal_The_Jester")!,"Eek I think something went wrong!")
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