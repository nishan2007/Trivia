//
//  TriviaAPIService.swift
//  Trivia
//
//  Created by Nishan Narain on 3/24/26.
//
import Foundation

class TriviaAPIService {
    
    static func fetchQuestions(
        amount: Int,
        category: String? = nil,
        difficulty: String? = nil,
        type: String? = nil
    ) async throws -> [TriviaQuestion] {
        
        var components = URLComponents(string: "https://opentdb.com/api.php")!
        
        var queryItems: [URLQueryItem] = [
            URLQueryItem(name: "amount", value: "\(amount)")
        ]
        
        if let category = category, !category.isEmpty {
            queryItems.append(URLQueryItem(name: "category", value: category))
        }
        
        if let difficulty = difficulty, !difficulty.isEmpty {
            queryItems.append(URLQueryItem(name: "difficulty", value: difficulty))
        }
        
        if let type = type, !type.isEmpty {
            queryItems.append(URLQueryItem(name: "type", value: type))
        }
        
        components.queryItems = queryItems
        
        guard let url = components.url else {
            throw URLError(.badURL)
        }
        
        print("STEP 1: URL created")
        print("Fetching URL: \(url.absoluteString)")
        
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 15
        config.timeoutIntervalForResource = 15
        
        let session = URLSession(configuration: config)
        
        print("STEP 2: Starting request")
        let (data, response) = try await session.data(from: url)
        print("STEP 3: Request finished")
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        
        print("STEP 4: Status code = \(httpResponse.statusCode)")
        
        guard httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        print("STEP 5: Raw data size = \(data.count)")
        
        let decodedResponse = try JSONDecoder().decode(TriviaResponse.self, from: data)
        print("STEP 6: Decoded successfully")
        print("Questions returned: \(decodedResponse.results.count)")
        
        return decodedResponse.results
    }
}
