import Foundation

struct SajuJirugi {
    static func createForm() -> Form {
        return Form(
            name: "Saju Jirugi",
            koreanName: "Sadsu Dschirugi",
            beltLevel: .yellow,
            movements: [
                FormMovement(
                    description: "Junbi (Grundstellung)",
                    koreanName: "Dschunbi",
                    germanName: "Grundstellung"
                ),
                FormMovement(
                    description: "Drehung 90° nach links in linke Vorwärtsstellung mit linkem Unterblock",
                    koreanName: "wen arae-makki",
                    germanName: "Links Unterblock"
                ),
                FormMovement(
                    description: "Rechter Mittelschlag in linker Vorwärtsstellung",
                    koreanName: "orün momtong-dschirugi",
                    germanName: "Rechts Mittelstufe Fauststoß"
                ),
                FormMovement(
                    description: "Drehung 180° nach rechts in rechte Vorwärtsstellung mit rechtem Unterblock",
                    koreanName: "orün arae-makki",
                    germanName: "Rechts Unterblock"
                ),
                FormMovement(
                    description: "Linker Mittelschlag in rechter Vorwärtsstellung",
                    koreanName: "wen momtong-dschirugi",
                    germanName: "Links Mittelstufe Fauststoß"
                ),
                FormMovement(
                    description: "Drehung 90° nach rechts in rechte Vorwärtsstellung mit rechtem Unterblock",
                    koreanName: "orün arae-makki",
                    germanName: "Rechts Unterblock"
                ),
                FormMovement(
                    description: "Linker Mittelschlag in rechter Vorwärtsstellung",
                    koreanName: "wen momtong-dschirugi",
                    germanName: "Links Mittelstufe Fauststoß"
                ),
                FormMovement(
                    description: "Drehung 180° nach links in linke Vorwärtsstellung mit linkem Unterblock",
                    koreanName: "wen arae-makki",
                    germanName: "Links Unterblock"
                ),
                FormMovement(
                    description: "Rechter Mittelschlag in linker Vorwärtsstellung",
                    koreanName: "orün momtong-dschirugi",
                    germanName: "Rechts Mittelstufe Fauststoß"
                ),
                FormMovement(
                    description: "Zurück zur Grundstellung",
                    koreanName: "Dschunbi",
                    germanName: "Grundstellung"
                )
            ],
            description: "Grundlegende Vier-Richtungs-Schlagform. Jede Richtung beinhaltet einen unteren Block gefolgt von einem mittleren Fauststoß in der Vorwärtsstellung."
        )
    }
} 