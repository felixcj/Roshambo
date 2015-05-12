//
//  ResultViewController.swift
//  Roshambo
//
//  Created by Felix Christmann-Jacoby on 12.05.15.
//  Copyright (c) 2015 Felix Christmann-Jacoby. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var resultText: UILabel!
    @IBOutlet weak var resultImage: UIImageView!
    
    var result: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultText.text = result
        
        switch (self.result){
        case "it's a tie":
            resultImage.image = UIImage(named: "itsATie")
        case "you loose. rock beats scissors", "you win. rock beats scissors":
            resultImage.image = UIImage(named: "RockCrushesScissors")
        case "you loose. paper beats rock", "you win. paper beats rock":
            resultImage.image = UIImage(named: "PaperCoversRock")
        case "you loose. scissors beat paper", "you win. scissors beat paper":
            resultImage.image = UIImage(named: "ScissorsCutPaper")
        default:
            resultImage.image = UIImage(named: "")
        }
    }
}
