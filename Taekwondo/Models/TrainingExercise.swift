import Foundation

struct TrainingExercise: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let duration: TimeInterval
    let category: ExerciseCategory
    let level: ExerciseLevel
    var variation: String?
}

enum ExerciseCategory: String, CaseIterable {
    case warmup = "Aufwärmen"
    case strength = "Kraftübungen"
    case technique = "Technik"
    case combination = "Kombinationen"
}

enum ExerciseLevel: String, CaseIterable {
    case beginner = "Anfänger"
    case intermediate = "Fortgeschritten"
    case advanced = "Experte"
} 