import Foundation

struct Form: Identifiable {
    let id = UUID()
    let name: String
    let koreanName: String
    let beltLevel: BeltLevel
    let movements: [FormMovement]
    let description: String
}

struct FormMovement: Identifiable {
    let id = UUID()
    let description: String
    let koreanName: String
    let germanName: String
}

enum BeltLevel: Int, CaseIterable {
    case white = 1
    case yellowWhite = 2
    case yellow = 3
    case greenYellow = 4
    case green = 5
    case blueGreen = 6
    case blue = 7
    case redBlue = 8
    case red = 9
    case blackRed = 10
    case black = 11
    
    var description: String {
        switch self {
        case .white: return "Weiß (1. Kup)"
        case .yellowWhite: return "Gelb-Weiß (2. Kup)"
        case .yellow: return "Gelb (3. Kup)"
        case .greenYellow: return "Grün-Gelb (4. Kup)"
        case .green: return "Grün (5. Kup)"
        case .blueGreen: return "Blau-Grün (6. Kup)"
        case .blue: return "Blau (7. Kup)"
        case .redBlue: return "Rot-Blau (8. Kup)"
        case .red: return "Rot (9. Kup)"
        case .blackRed: return "Schwarz-Rot (10. Kup)"
        case .black: return "Schwarz (Dan)"
        }
    }
} 
