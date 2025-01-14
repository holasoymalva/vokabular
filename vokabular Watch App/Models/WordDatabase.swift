//
//  WordDatabase.swift
//  vokabular
//
//  Created by malva on 13/01/25.
//

class WordDatabase {
    static let shared = WordDatabase()
    
    var words: [Word] = [
        Word(original: "Casa", translation: "House", example: "Mi casa es grande", language: .spanish),
        Word(original: "Perro", translation: "Dog", example: "El perro ladra", language: .spanish),
        Word(original: "Maison", translation: "House", example: "C'est ma maison", language: .french),
        Word(original: "Chien", translation: "Dog", example: "Le chien aboie", language: .french),
        // Add more words here
    ]
    
    func getRandomWord(for language: Language) -> Word? {
        let languageWords = words.filter { $0.language == language }
        return languageWords.randomElement()
    }
}
