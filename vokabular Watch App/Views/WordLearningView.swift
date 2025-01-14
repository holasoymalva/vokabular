//
//  WordLearningView.swift
//  vokabular
//
//  Created by malva on 13/01/25.
//
import SwiftUI

struct WordLearningView: View {
    let language: Language
    let onBack: () -> Void
    
    @State private var currentWord: Word?
    @State private var isShowingTranslation = false
    
    var body: some View {
        VStack(spacing: 10) {
            if let word = currentWord {
                Text(word.original)
                    .font(.system(size: 24, weight: .bold))
                
                if isShowingTranslation {
                    Text(word.translation)
                        .font(.system(size: 20))
                    Text(word.example)
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                }
                
                Button(action: {
                    withAnimation {
                        isShowingTranslation.toggle()
                    }
                }) {
                    Text(isShowingTranslation ? "Hide Translation" : "Show Translation")
                }
                
                Button(action: loadNewWord) {
                    Text("Next Word")
                }
            }
            
            Button(action: onBack) {
                Text("Change Language")
                    .foregroundColor(.red)
            }
        }
        .onAppear(perform: loadNewWord)
    }
    
    private func loadNewWord() {
        currentWord = WordDatabase.shared.getRandomWord(for: language)
        isShowingTranslation = false
    }
}
