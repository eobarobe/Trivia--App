//
//  TriviaAppTests.swift
//  TriviaAppTests
//
//  Created by Josh Bongard on 10/29/20.
//

import XCTest
@testable import TriviaApp

class TriviaAppTests: XCTestCase {

    func testRandomNum(){
        let tvc = TriviaController()
        let result = tvc.getRandomNum(tvc.questionNumber)
        XCTAssertNotEqual(result, tvc.questionNumber)
    }
}
