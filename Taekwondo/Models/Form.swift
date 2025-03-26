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
    case white = 10
    case yellowWhite = 9
    case yellow = 8
    case greenYellow = 7
    case green = 6
    case blueGreen = 5
    case blue = 4
    case redBlue = 3
    case red = 2
    case blackRed = 1
    case black = 0
    
    var description: String {
        switch self {
        case .white: return "Weiß (10. Kup)"
        case .yellowWhite: return "Gelb-Weiß (9. Kup)"
        case .yellow: return "Gelb (8. Kup)"
        case .greenYellow: return "Grün-Gelb (7. Kup)"
        case .green: return "Grün (6. Kup)"
        case .blueGreen: return "Blau-Grün (5. Kup)"
        case .blue: return "Blau (4. Kup)"
        case .redBlue: return "Rot-Blau (3. Kup)"
        case .red: return "Rot (2. Kup)"
        case .blackRed: return "Schwarz-Rot (1. Kup)"
        case .black: return "Schwarz (1. Dan)"
        }
    }
} 
