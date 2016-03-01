//
//  WinnerViewController.swift
//  RockPaperScissors
//
//  Created by Donny Davis on 3/1/16.
//  Copyright © 2016 Donny Davis. All rights reserved.
//

import UIKit

class WinnerViewController: UIViewController {
    
    var computer: String?
    var player: String?
    
    @IBOutlet weak var winnerImage: UIImageView!
    @IBOutlet weak var winnerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        // Check if it's a tie
        if self.player! == self.computer! {
            winnerLabel.text = "It's a tie!"
            winnerImage.image = UIImage(named: "tie")
        } else {
            var playerWins = false
            
            // Let's determine if the player wins
            if (self.player! == "rock" && self.computer! == "scissors") ||
               (self.player! == "paper" && self.computer! == "rock") ||
               (self.player! == "scissors" && self.computer! == "paper") {
                playerWins = true
            } else {
                playerWins = false
            }
            
            if playerWins {
                winnerLabel.text = "You Win, \(player!) beats \(computer!)"
                winnerImage.image = UIImage(named: "\(player!)Wins")
            } else {
                winnerLabel.text = "You Lose, \(computer!) beats \(player!)"
                winnerImage.image = UIImage(named: "\(computer!)Wins")
            }
        }
    }
    
    @IBAction func playAgain(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
