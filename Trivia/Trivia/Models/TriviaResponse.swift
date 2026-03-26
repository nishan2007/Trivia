//
//  TriviaResponse.swift
//  Trivia
//
//  Created by Nishan Narain on 3/24/26.
//

import Foundation

struct TriviaResponse: Codable {
    let response_code: Int
    let results: [TriviaQuestion]
}
