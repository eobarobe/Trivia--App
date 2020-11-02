//
//  TriviaQuestions.swift
//  TriviaApp
//
//  Created by Josh Bongard on 10/29/20.
//
/**
 Parson Json File to return codable values
 */
import Foundation

struct TriviaQuestions: Codable{
    //default values
    var question: String = ""
    var incorrect: [String] = []
    var correct: String = ""
    
}
