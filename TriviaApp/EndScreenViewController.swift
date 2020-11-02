//
//  EndScreenViewController.swift
//  TriviaApp
//
//  Created by Josh Bongard on 11/1/20.
//

import Foundation
import UIKit
class EndScreenViewController: UIViewController {
    @IBOutlet weak var finalScoreLabel: UILabel!
    var finalScore : String = "" 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        finalScoreLabel.text = finalScore
        print(finalScore)
    }
    
    @IBAction func homeButtonTapped(){
        //change main vc = trivia vc
        let vc = storyboard?.instantiateViewController(identifier: "start screen") as! ViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
}
