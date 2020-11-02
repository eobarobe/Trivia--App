//
//  ViewController.swift
//  TriviaApp
//
//  Created by Josh Bongard on 10/29/20.
//
/*
 -Menu Screen
 -Game Screen
 -Answer Object
 -Question Object
 -Points Object
 */
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    @IBAction func startTrivia(){
        //change main vc = trivia vc
        let vc = storyboard?.instantiateViewController(identifier: "trivia") as! TriviaController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }


}

