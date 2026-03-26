//
//  TriviaViewModels.swift
//  Trivia
//
//  Created by Nishan Narain on 3/24/26.
//

import Foundation
import Combine

@MainActor
class TriviaViewModel: ObservableObject {
    @Published var questions: [TriviaQuestion] = []
    @Published var selectedAnswers: [UUID: String] = [:]
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var score = 0
    @Published var showScoreAlert = false

    func loadQuestions(amount: Int, category: String, difficulty: String, type: String) async {
        isLoading = true
        errorMessage = nil
        selectedAnswers = [:]
        score = 0

        do {
            questions = try await TriviaAPIService.fetchQuestions(
                amount: amount,
                category: category,
                difficulty: difficulty,
                type: type
            )
        } catch {
            errorMessage = error.localizedDescription
            print("VIEWMODEL ERROR: \(error)")
        }

        isLoading = false
    }

    func selectAnswer(for questionID: UUID, answer: String) {
        selectedAnswers[questionID] = answer
    }

    func submitQuiz() {
        score = questions.filter { question in
            selectedAnswers[question.id] == question.correct_answer
        }.count

        showScoreAlert = true
    }
}
