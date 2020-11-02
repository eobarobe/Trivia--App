//
//  TriviaController.swift
//  TriviaApp
//
//  Created by Josh Bongard on 10/29/20.
//

import Foundation
import UIKit

class TriviaController: UIViewController,UITableViewDelegate, UITableViewDataSource{
    /*Interface Outlets:
     -Question Label
     -Answers Tablee
     */
    @IBOutlet var questionsLabel: UILabel!
    @IBOutlet var answerTable: UITableView!
    
    var questionCounter = 1
    //Score Keeper
    var score = 0
    //Loading Question Label
    var data = QuestionLoader().QuestionData
    //Question Numbers
    var questionNumber = Int.random(in: 0..<QuestionLoader().QuestionData.count)
    var alreadyUsed = [Int]()
    //MARK: -General Overrides-
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        configureUI()
        
    }
    
    
    override func viewDidLoad() {
        
        //do any additional set up after loading the view
        //load json data
        super.viewDidLoad()
        setUpQuestions()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
              if (segue.identifier == "endOfGame") {
                let egvc = segue.destination as! EndScreenViewController

                egvc.finalScore = "\(score)"

               }
            }
 
    
    //MARK: -Set Ups-
    private func configureUI(){
        questionsLabel.text = data[questionNumber].question
        
        answerTable.delegate = self
        answerTable.dataSource = self
    }
    func setUpQuestions(){
        for q in 0 ..< data.count{
            data[q].incorrect.append(data[q].correct)
        }
    }
    //MARK: -Some Functions-

    public func getRandomNum(_ questionNumber: Int)->Int{
        //check that the newly generated number does not get repeated
        
        alreadyUsed.append(questionNumber)
        var newQuestion = Int.random(in: 0..<QuestionLoader().QuestionData.count)
        if questionNumber == newQuestion || alreadyUsed.contains(newQuestion){
            newQuestion = Int.random(in: 0..<QuestionLoader().QuestionData.count)
            return newQuestion
        }else{
            return newQuestion
        }
    }
    
    private func checkAnswer(_ answer: String ,_ questionNumber: Int)->Bool{
        if data[questionNumber].correct == answer{
          
            //returns true
            return true
        }else{
            return false
        }
        
    }
    private func checkForNextQuestion(_ questionNumber: Int){

        questionCounter += 1
        if questionCounter < 10{
                //next question
                self.questionNumber = getRandomNum(questionNumber)
                configureUI()
                //update table with next Question
                answerTable.reloadData()
            } else{
                //end of game
                print(score)
                //end of game aleart
                
                let endAlert = UIAlertController(title: "Game Over", message: "You completed the Trivia", preferredStyle: .alert)
                
                endAlert.addAction(UIAlertAction(title: "Dimiss",style: .cancel,handler: {
                                                    action in self.performSegue(withIdentifier: "endOfGame", sender: self)}
                    ))
                present(endAlert,animated: true)
                
                //insert end of game screen later
            }
        
        
    }

   
    //MARK: -Table View Functions-
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[questionNumber].incorrect.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        cell.textLabel?.text = data[questionNumber].incorrect[indexPath.row]
        

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: true)
        
        let question = data[questionNumber]
        
        let selectedAnswer = question.incorrect[indexPath.row]
        if checkAnswer(selectedAnswer, questionNumber){
            checkForNextQuestion(questionNumber)
            //updates score
            self.score += 1
            
        }else{
            checkForNextQuestion(questionNumber)
            //no score update but alert user that their choice is wrong
            let correctAnswer = data[questionNumber].correct
            let wrongAlert = UIAlertController(title: "Wrong Answer", message: "The correct answer is " + correctAnswer, preferredStyle: .alert)
            wrongAlert.addAction(UIAlertAction(title: "Dimiss",style: .cancel,handler: nil))
            present(wrongAlert,animated: true)
            
            
        }
        
    }
    
  
}
