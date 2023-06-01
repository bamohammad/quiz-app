//
//  QuestionProvider.swift
//  Quiz App
//
//  Created by Ali Bamohammad on 25/05/2023.
//

import Foundation
//(completion: @escaping (Result<[AddressModel], NSError>, Bool) -> Void)
protocol QuestionProviderProtocolo {
    func fetchQuestions(completion:@escaping([QuestionModel])-> Void)
}

class QuestionProvider:QuestionProviderProtocolo {
    func fetchQuestions(completion: @escaping ([QuestionModel]) -> Void) {
        let quietions = [
            QuestionModel(title: "1+2", answers:
                            [
                                AnswerModel(title: "2", IsCorrect: false),
                                AnswerModel(title: "3", IsCorrect: true),
                                AnswerModel(title: "4", IsCorrect: false),
                            ]
                         ),
            QuestionModel(title: "2+2", answers:
                            [
                                AnswerModel(title: "2", IsCorrect: false),
                                AnswerModel(title: "3", IsCorrect: false),
                                AnswerModel(title: "4", IsCorrect: true),
                            ]
                         ),
            QuestionModel(title: "3+1", answers:
                            [
                                AnswerModel(title: "2", IsCorrect: true),
                                AnswerModel(title: "3", IsCorrect: false),
                                AnswerModel(title: "4", IsCorrect: false),
                            ]
                         ),
            QuestionModel(title: "4+2", answers:
                            [
                                AnswerModel(title: "3", IsCorrect: false),
                                AnswerModel(title: "6", IsCorrect: true),
                                AnswerModel(title: "8", IsCorrect: false),
                            ]
                         ),
            QuestionModel(title: "8-5", answers:
                            [
                                AnswerModel(title: "3", IsCorrect: true),
                                AnswerModel(title: "5", IsCorrect: false),
                                AnswerModel(title: "4", IsCorrect: false),
                            ]
                         )
        ]
        completion(quietions)
    }
}
