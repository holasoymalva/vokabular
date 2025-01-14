//
//  ContentView.swift
//  vokabular
//
//  Created by malva on 13/01/25.
//
import SwiftUI

struct ContentView: View {
    @State private var selectedLanguage: Language?
    
    var body: some View {
        if let language = selectedLanguage {
            WordLearningView(language: language) {
                selectedLanguage = nil
            }
        } else {
            LanguageSelectionView(selectedLanguage: $selectedLanguage)
        }
    }
}
