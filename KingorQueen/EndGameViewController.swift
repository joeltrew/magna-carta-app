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
        royalNameLabel.text = royalName
        passedPlayer?.printPlayerScores()
       
    }
    
}