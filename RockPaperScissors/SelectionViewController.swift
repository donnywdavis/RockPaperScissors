//
//  SelectionViewController.swift
//  RockPaperScissors
//
//  Created by Donny Davis on 2/29/16.
//  Copyright © 2016 Donny Davis. All rights reserved.
//

import UIKit

class SelectionViewController: UIViewController {
    
    var choices = ["rock", "paper", "scissors"]
    var playerChoice: String?
    
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Generate the computers choice
    func computerChoice() -> String {
        let randomValue = arc4random_uniform(3)
        return self.choices[Int(randomValue)]
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController as! WinnerViewController
        
        controller.computer = self.computerChoice()
        controller.player = self.playerChoice
    }

    @IBAction func playerSelection(sender: UIButton) {
        self.playerChoice = self.choices[sender.tag]
        
        performSegueWithIdentifier("makeSelection", sender: self)
    }
    
}

