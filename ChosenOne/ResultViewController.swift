//
//  ResultViewController.swift
//  ChosenOne
//
//  Created by JackYu on 2021/2/2.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var textScore:TotalScore!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let finalScore = textScore.finalscore
        
        scoreLabel.text = String(finalScore)
    }


}
