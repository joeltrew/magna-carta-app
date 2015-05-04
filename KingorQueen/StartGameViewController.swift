//
//  StartGameViewController.swift
//  King for a Day
//
//  Created by Joel Trew on 04/05/2015.
//  Copyright (c) 2015 Tristan Earl. All rights reserved.
//

import UIKit
import Foundation

class StartGameViewController: UIViewController {
    
    @IBOutlet weak var playerTextInput: UITextField!
    @IBOutlet weak var genderControl: UISegmentedControl!
    
    @IBAction func startQuizButton(sender: AnyObject) {
        performSegueWithIdentifier("quizStarted", sender: nil)
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
}


