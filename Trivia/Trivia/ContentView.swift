//
//  ContentView.swift
//  Trivia
//
//  Created by Nishan Narain on 3/24/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = TriviaViewModel()
    
    var body: some View {
    OptionView()
    }
}
