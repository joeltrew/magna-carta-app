//
//  StartGameViewController.swift
//  King for a Day
//
//  Created by Joel Trew on 04/05/2015.
//  Copyright (c) 2015 Group 10. All rights reserved.
//

import UIKit
import Foundation

class StartGameViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var playerTextInput: UITextField!
    @IBOutlet weak var genderControl: UISegmentedControl!
    var theView = UIView?(), labelHeading = UILabel(), label = UILabel(), labelGoodLuck = UILabel(),
labelTouchToContinue = UILabel()
    


    override func viewWillAppear(animated: Bool) {
        imageView.clipsToBounds = true
        theView = UIView(frame: CGRectMake(0, 0, 0,0))
        theView?.backgroundColor = UIColor(hue: 100, saturation: 0, brightness: 0, alpha: 0.8)
        self.view.addSubview(theView!)
        
        //Set up the label and add it to the view we create above NOT the main view.
        label.font = UIFont(name: "IowanOldStyle-Bold", size: 20)
        labelGoodLuck.font = UIFont(name: "IowanOldStyle-Bold", size: 20)
        labelTouchToContinue.font = UIFont(name: "IowanOldStyle-Bold", size: 20)
        labelHeading.font = UIFont(name: "IowanOldStyle-Bold", size: 28)
        label.numberOfLines = 0
        labelHeading.numberOfLines = 0
        
        labelGoodLuck.textAlignment = NSTextAlignment.Center
        labelHeading.textAlignment = NSTextAlignment.Center
        labelTouchToContinue.textAlignment = NSTextAlignment.Center
        
        
        label.textColor = UIColor.whiteColor()
        label.alpha = 1
        labelGoodLuck.textColor = UIColor.whiteColor()
        labelGoodLuck.alpha = 1
        labelTouchToContinue.textColor = UIColor.whiteColor()
        labelTouchToContinue.alpha = 1

        labelHeading.textColor = UIColor.whiteColor()
        labelHeading.alpha = 1
        //note here were calling addSubview on theView not just self.view as above.
        theView?.addSubview(labelHeading)
        theView?.addSubview(label)
        theView?.addSubview(labelGoodLuck)
        theView?.addSubview(labelTouchToContinue)
        

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.layer.cornerRadius = imageView.bounds.width/2
    }
    
    @IBAction func startQuizButton(sender: AnyObject) {
        if playerTextInput.text.isEmpty {
            showAlertEmpty()
            playerTextInput.backgroundColor = UIColor(red: 200, green: 25, blue: 0, alpha: 100)
        }else{
            if count(playerTextInput.text) > 11 {
                showAlertTooLong()
            }
            else{
                self.labelHeading.text = "Welcome \(playerTextInput.text)"
                self.label.text = "Your kingdom needs you to make difficult decisions. Find out how you will be remembered."
                self.labelGoodLuck.text = "Good Luck..."
                self.labelTouchToContinue.text = "Touch anywhere to continue"
                self.theView!.frame = CGRectMake(0, 0,  view.bounds.width, view.bounds.height)
                labelHeading.frame = CGRectMake(10, 50, theView!.bounds.width-30 ,200)
                label.frame = CGRectMake(20, 130,theView!.bounds.width-30 ,200)
                labelGoodLuck.frame = CGRectMake(10, 210,theView!.bounds.width-30 ,200)
                labelTouchToContinue.frame = CGRectMake(10, theView!.bounds.height-40, theView!.bounds.width-30, 20)
        
            }
        }
    }
    

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "quizStarted" {
            var seg = segue.destinationViewController as! ViewController
            var playerName = playerTextInput.text
            var playerGender = genderControl.selectedSegmentIndex == 0
            seg.passedPlayerName = playerName
            seg.passedPlayerGender = playerGender
            
        }
    }
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    
    @IBAction func showAlertTooLong() {
        var alert : UIAlertView = UIAlertView(title: "Name too long", message: "Please chose a shorter name",       delegate: nil, cancelButtonTitle: "Ok")
        
        alert.show()
    }
    
    @IBAction func showAlertEmpty() {
        var alert : UIAlertView = UIAlertView(title: "Please enter a name", message: "Please enter a name in the input box",       delegate: nil, cancelButtonTitle: "Ok")
        
        alert.show()
    }
    
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        if let touch = touches.first as? UITouch {
            var point = touch.locationInView(self.view)
            
            if theView!.frame.contains(point){
                performSegueWithIdentifier("quizStarted", sender: nil)
            }
        }
    }
}



