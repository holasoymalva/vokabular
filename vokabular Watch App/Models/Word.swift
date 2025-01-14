//
//  Word.swift
//  vokabular
//
//  Created by malva on 13/01/25.
//
import Foundation

struct Word: Identifiable, Codable {
    let id: UUID
    let original: String
    let translation: String
    let example: String
    let language: Language
    
    init(original: String, translation: String, example: String, language: Language) {
        self.id = UUID()
        self.original = original
        self.translation = translation
        self.example = example
        self.language = language
    }
}

enum Language: String, CaseIterable, Codable {
    case spanish = "Spanish"
    case french = "French"
    case german = "German"
}
