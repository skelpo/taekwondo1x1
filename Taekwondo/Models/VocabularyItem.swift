import Foundation

struct VocabularyItem: Identifiable, Hashable {
    let id = UUID()
    let german: String
    let korean: String
    let category: VocabularyCategory
    var illustration: String? // Optional illustration/diagram
}

enum VocabularyCategory: String, CaseIterable {
    case general = "Allgemeines"
    case steps = "Tritte"
    case strikes = "Schläge"
    case stances = "Stellungen"
    case numbers = "Zahlen"
    case commands = "Kommandos"
} 