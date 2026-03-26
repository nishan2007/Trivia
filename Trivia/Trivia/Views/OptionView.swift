//
//  OptionView.swift
//  Trivia
//
//  Created by Nishan Narain on 3/24/26.
//

import SwiftUI

struct OptionView: View{
    @State private var numberOfQuestions = 5
    @State private var selectedCategory = ""
    @State private var selectedType = ""
    @State private var selectedDifficulty = ""
    
    @State private var startGame = false
    
    let categories : [(name: String, id: String)] = [
        ("Any Category",""),
        ("General Knowledge","9"),
        ("Books","10"),
        ("Film","11"),
        ("Music","12"),
        ("Science & Nature","17"),
        ("Computers","18"),
        ("Mathematics","19"),
        ("Sports","21")
    ]
    
    var body: some View {
          NavigationStack {
              Form {
                  
                  Section("Number of Questions") {
                      Stepper("Questions: \(numberOfQuestions)", value: $numberOfQuestions, in: 1...20)
                  }
                  
                  Section("Category") {
                      Picker("Category", selection: $selectedCategory) {
                          ForEach(categories, id: \.id) { category in
                              Text(category.name).tag(category.id)
                          }
                      }
                  }
                  
                  Section("Difficulty") {
                      Picker("Difficulty", selection: $selectedDifficulty) {
                          Text("Any").tag("")
                          Text("Easy").tag("easy")
                          Text("Medium").tag("medium")
                          Text("Hard").tag("hard")
                      }
                  }
                  
                  Section("Type") {
                      Picker("Type", selection: $selectedType) {
                          Text("Any").tag("")
                          Text("Multiple Choice").tag("multiple")
                          Text("True / False").tag("boolean")
                      }
                  }
                  
                  Button("Start Trivia Game") {
                      startGame = true
                  }
              }
              .navigationTitle("Trivia Options")
              .navigationDestination(isPresented: $startGame) {
                  QuizView(
                      amount: numberOfQuestions,
                      category: selectedCategory,
                      difficulty: selectedDifficulty,
                      type: selectedType
                  )
              }
          }
      }
  }
    
