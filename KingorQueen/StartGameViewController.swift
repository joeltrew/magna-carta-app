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

    override func viewWillAppear(animated: Bool) {
        imageView.clipsToBounds = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.layer.cornerRadius = imageView.bounds.width/2
    }
    
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


