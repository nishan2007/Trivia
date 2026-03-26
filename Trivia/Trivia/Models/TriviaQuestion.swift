//
//  TriviaQuestion.swift
//  Trivia
//
//  Created by Nishan Narain on 3/24/26.
//

import Foundation

struct TriviaQuestion: Codable, Identifiable {
    let id = UUID()
    let type: String
    let difficulty: String
    let category: String
    let question: String
    let correct_answer: String
    let incorrect_answers: [String]

    enum CodingKeys: String, CodingKey {
        case type
        case difficulty
        case category
        case question
        case correct_answer
        case incorrect_answers
    }
}
