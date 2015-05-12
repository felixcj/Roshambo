//
//  PlayViewController.swift
//  Roshambo
//
//  Created by Felix Christmann-Jacoby on 10.05.15.
//  Copyright (c) 2015 Felix Christmann-Jacoby. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func randomlyOpponentPlay() -> String {
        var randomNumber = arc4random() % 3
        switch (randomNumber) {
        case 0:
            return "Rock"
        case 1:
            return "Paper"
        case 2:
            return "Scissors"
        default:
            return ""
        }
    }
    
    func comparePlay(opponent: String, me: String) -> String {
        switch(opponent,me) {
        case ("Rock","Rock"):
            return "it's a tie"
        case ("Paper","Paper"):
            return "it's a tie"
        case ("Scissors","Scissors"):
            return "it's a tie"
        case ("Rock","Scissors"):
            return "you loose. rock beats scissors"
        case ("Scissors","Rock"):
            return "you win. rock beats scissors"
        case ("Paper","Rock"):
            return "you loose. paper beats rock"
        case ("Rock","Paper"):
            return "you win. paper beats rock"
        case ("Scissors","Paper"):
            return "you loose. scissors beat paper"
        case ("Paper","Scissors"):
            return "you win. scissors beat paper"
        default:
            return ""
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "PaperSegue" {
            let controller = segue.destinationViewController as! ResultViewController
            
            controller.result = comparePlay(randomlyOpponentPlay(), me: "Paper")
        } else {
            let controller = segue.destinationViewController as! ResultViewController
            
            controller.result = comparePlay(randomlyOpponentPlay(), me: "Scissors")
        }
    }
    
    //All code
    @IBAction func playRock(sender: AnyObject) {
        
        var result = comparePlay(randomlyOpponentPlay(), me: "Rock")
        
        var controller: ResultViewController
        controller = self.storyboard?.instantiateViewControllerWithIdentifier("ResultViewController") as! ResultViewController
    
        controller.result = result
        
        self.presentViewController(controller, animated: true, completion: nil)
    }
    
    //Perform Segue by Identifier
    @IBAction func playPaper(sender: AnyObject) {
        performSegueWithIdentifier("PaperSegue", sender: self)
    }

}

