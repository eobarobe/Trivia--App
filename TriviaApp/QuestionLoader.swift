//
//  QuestionLoader.swift
//  TriviaApp
//
//  Created by Josh Bongard on 10/29/20.
//

import Foundation
public class QuestionLoader{
    @Published var QuestionData = [TriviaQuestions]()
    init(){
        load()
    }
    func load(){
        if let fileLocation = Bundle.main.url(forResource: "TriviaQuestions", withExtension: ".json"){
            //do catch in case of error
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([TriviaQuestions].self, from: data) 
                
                self.QuestionData = dataFromJson
            }catch{
                print(error)
            }
        }
    }
    
    func sort(){
        //sort in alphabetical order 
        self.QuestionData = self.QuestionData.sorted(by: {$0.question < $1.question })
    }
}
