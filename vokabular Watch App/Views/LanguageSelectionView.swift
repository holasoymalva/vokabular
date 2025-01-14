//
//  LanguageSelectionView.swift
//  vokabular
//
//  Created by malva on 13/01/25.
//
import SwiftUI

struct LanguageSelectionView: View {
    @Binding var selectedLanguage: Language?
    
    var body: some View {
        List(Language.allCases, id: \.self) { language in
            Button(action: {
                selectedLanguage = language
            }) {
                Text(language.rawValue)
                    .foregroundColor(.white)
            }
        }
        .navigationTitle("Select Language")
    }
}
