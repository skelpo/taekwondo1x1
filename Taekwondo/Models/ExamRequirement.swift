import Foundation

struct ExamRequirement: Identifiable {
    let id = UUID()
    let beltLevel: BeltLevel
    let basicTechniques: [String]
    let forms: [String]
    let selfDefense: [String]
    let sparring: [String]
    let theory: [String]
    let breakingTest: BreakingTest?
}

struct BreakingTest {
    let minimumAge: Int
    let thickness: String
    let description: String
    
    static let standardRequirements = """
    Die Brettstärke beträgt grundsätzlich:
    2,5 cm bei Männern ab 18 bis 39 Jahre;
    2,0 cm bei Frauen ab 18 bis 39 Jahre;
    1,5 cm bei Jugendlichen (m/w) ab 15 - 17 Jahre sowie bei Frauen und Männern ab 40 Jahre;
    """
} 