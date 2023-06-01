//
//  QuestionVMTest.swift
//  Quiz AppTests
//
//  Created by Ali Bamohammad on 26/05/2023.
//

import XCTest
@testable import Quiz_App

final class QuestionVMTest: XCTestCase {

    var sut:QuestionsVMProtocol!
   
    override func setUpWithError() throws {
        sut = QuestionsVM()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchQuestios_NotEmpty() throws {
        sut.fetchQuestions()
        XCTAssertFalse(sut.quetions.isEmpty)
    }
    
    func testCurrentQuestion_StartAtZero() throws {
        XCTAssertEqual(sut.curentQuitionIndex, 0)
    }
    
    func testMoveToNextQuestion_IndexIncreas() throws {
        sut.fetchQuestions()
        sut.moveToNextQuestion()
        XCTAssertEqual(sut.curentQuitionIndex, 1)
        sut.moveToNextQuestion()
        XCTAssertEqual(sut.curentQuitionIndex, 2)
    }
    
    func testCheckIfCorrectAnswor_True() throws {
        sut.fetchQuestions()
        // firest qutions has second ansor as curreect
        XCTAssertTrue(sut.checkIfCorrectAnswor(index: 1))
    }
    
    func testCheckIfLastQuestion_True() throws {
        sut.fetchQuestions()
        for _ in 0...sut.quetions.count {
            sut.moveToNextQuestion()
        }
        // firest qutions has second ansor as curreect
        XCTAssertTrue(sut.checkIfLastQuestion())
    }

}
