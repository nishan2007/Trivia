//
//  QuizView.swift
//  Trivia
//
//  Created by Nishan Narain on 3/24/26.
//

import SwiftUI

struct QuizView: View {
    @StateObject private var viewModel = TriviaViewModel()

    let amount: Int
    let category: String
    let difficulty: String
    let type: String

    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView("Loading questions...")
                    .padding()
            } else if let errorMessage = viewModel.errorMessage {
                VStack(spacing: 12) {
                    Text("Error loading questions")
                        .font(.headline)
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                }
                .padding()
            } else {
                List {
                    ForEach(viewModel.questions) { question in
                        VStack(alignment: .leading, spacing: 12) {
                            Text(decodeHTML(question.question))
                                .font(.headline)

                            ForEach(shuffledAnswers(for: question), id: \.self) { answer in
                                Button {
                                    viewModel.selectAnswer(for: question.id, answer: answer)
                                } label: {
                                    HStack {
                                        Text(decodeHTML(answer))
                                            .foregroundColor(.primary)
                                            .multilineTextAlignment(.leading)
                                        Spacer()
                                        if viewModel.selectedAnswers[question.id] == answer {
                                            Image(systemName: "checkmark.circle.fill")
                                        }
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(
                                        viewModel.selectedAnswers[question.id] == answer
                                        ? Color.blue.opacity(0.2)
                                        : Color.gray.opacity(0.1)
                                    )
                                    .cornerRadius(10)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .padding(.vertical, 8)
                    }
                }

                Button("Submit Quiz") {
                    viewModel.submitQuiz()
                }
                .buttonStyle(.borderedProminent)
                .padding()
            }
        }
        .navigationTitle("Trivia Game")
        .task {
            await viewModel.loadQuestions(
                amount: amount,
                category: category,
                difficulty: difficulty,
                type: type
            )
        }
        .alert("Your Score", isPresented: $viewModel.showScoreAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("You got \(viewModel.score) out of \(viewModel.questions.count) correct!")
        }
    }

    private func shuffledAnswers(for question: TriviaQuestion) -> [String] {
        let seed = question.id.uuidString
        return (question.incorrect_answers + [question.correct_answer])
            .sorted { "\($0)-\(seed)" < "\($1)-\(seed)" }
    }
}
