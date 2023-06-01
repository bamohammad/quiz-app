//
//  QuestionsVM.swift
//  Quiz App
//
//  Created by Ali Bamohammad on 23/05/2023.
//

import Foundation

protocol QuestionsVMProtocol {
    // quiz quitons
    var quetions: [QuestionModel] { get }
    // indicator for curent qutins
    var curentQuitionIndex: Int { get set }
    //
    func fetchQuestions()
    //
    func moveToNextQuestion()
    //
    func moveToPreviousQuetion()
    //
    func checkIfCorrectAnswor(index:Int) -> Bool
    //
    func checkIfLastQuestion() -> Bool
}

class QuestionsVM: QuestionsVMProtocol {
    var quetions: [QuestionModel] = []

    var curentQuitionIndex: Int

    var providor: QuestionProviderProtocolo

    init(providor: QuestionProviderProtocolo = QuestionProvider()) {
        self.providor = providor
        curentQuitionIndex = 0
    }

    func fetchQuestions() {
        providor.fetchQuestions { [weak self] questios in
            self?.quetions = questios
        }
    }

    func moveToNextQuestion() {
        guard quetions.indices.contains(curentQuitionIndex + 1) else { return }
        curentQuitionIndex += 1
    }

    func moveToPreviousQuetion() {
        guard curentQuitionIndex > 0 else { return }
        curentQuitionIndex -= 1
    }

    func checkIfCorrectAnswor(index:Int) -> Bool {
        
        guard quetions[curentQuitionIndex].answers.indices.contains(index) else { return false }
        return quetions[curentQuitionIndex].answers[index].IsCorrect
    }

    func checkIfLastQuestion() -> Bool {
        return curentQuitionIndex == quetions.count - 1
    }
}
