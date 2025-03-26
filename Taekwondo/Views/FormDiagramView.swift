import SwiftUI

struct FormDiagramView: View {
    let form: Form
    let size: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Background
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(.systemBackground))
                    .shadow(radius: 2)
                
                // Form diagram
                FormDiagramContent(form: form, size: size)
                    .frame(width: size * 0.8, height: size * 0.8)
            }
        }
        .frame(width: size, height: size)
    }
}

struct FormDiagramContent: View {
    let form: Form
    let size: CGFloat
    
    var body: some View {
        let center = CGPoint(x: size/2, y: size/2)
        let radius = size/2 * 0.9
        
        Group {
            switch form.name {
            case "Saju Jirugi":
                SajuJirugiPattern(center: center, radius: radius)
            case "Taegeuk Il Jang":
                TaegeukIlJangPattern(center: center, radius: radius)
            case "Taegeuk Ih Jang":
                TaegeukIhJangPattern(center: center, radius: radius)
            case "Taegeuk Sam Jang":
                TaegeukSamJangPattern(center: center, radius: radius)
            case "Taegeuk Sa Jang":
                TaegeukSaJangPattern(center: center, radius: radius)
            case "Taegeuk Oh Jang":
                TaegeukOhJangPattern(center: center, radius: radius)
            case "Taegeuk Yuk Jang":
                TaegeukYukJangPattern(center: center, radius: radius)
            case "Taegeuk Chil Jang":
                TaegeukChilJangPattern(center: center, radius: radius)
            case "Taegeuk Pal Jang":
                TaegeukPalJangPattern(center: center, radius: radius)
            case "Koryo":
                KoryoPattern(center: center, radius: radius)
            default:
                EmptyView()
            }
        }
    }
}

// Base pattern components
struct MovementLine: Shape {
    let start: CGPoint
    let end: CGPoint
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: start)
        path.addLine(to: end)
        return path
    }
}

struct MovementArrow: Shape {
    let start: CGPoint
    let end: CGPoint
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: start)
        path.addLine(to: end)
        
        // Pfeilspitze hinzufügen
        let angle = atan2(end.y - start.y, end.x - start.x)
        let arrowLength = 10.0
        let arrowAngle = CGFloat.pi / 6
        
        let arrowPoint1 = CGPoint(
            x: end.x - arrowLength * cos(angle - arrowAngle),
            y: end.y - arrowLength * sin(angle - arrowAngle)
        )
        let arrowPoint2 = CGPoint(
            x: end.x - arrowLength * cos(angle + arrowAngle),
            y: end.y - arrowLength * sin(angle + arrowAngle)
        )
        
        path.move(to: end)
        path.addLine(to: arrowPoint1)
        path.move(to: end)
        path.addLine(to: arrowPoint2)
        
        return path
    }
}

// Individual form patterns
struct SajuJirugiPattern: View {
    let center: CGPoint
    let radius: CGFloat
    
    var body: some View {
        ZStack {
            // Saju Jirugi ist eine Vier-Richtungs-Form (4 Stoßrichtungen)
            // Kreuzform für vorwärts, rückwärts, links, rechts zeichnen
            let angles = [0.0, 90.0, 180.0, 270.0] // Vorwärts, Rechts, Rückwärts, Links
            ForEach(angles, id: \.self) { angle in
                let radians = angle * .pi / 180
                let end = CGPoint(
                    x: center.x + radius * cos(radians),
                    y: center.y + radius * sin(radians)
                )
                
                MovementArrow(start: center, end: end)
                    .stroke(Color.blue, lineWidth: 2)
            }
        }
    }
}

struct TaegeukIlJangPattern: View {
    let center: CGPoint
    let radius: CGFloat
    
    var body: some View {
        ZStack {
            // Taegeuk Il Jang - horizontales "I"-Muster
            // Alle Taegeuk-Formen werden auf drei parallelen Linien ausgeführt
            
            // Die drei horizontalen Linien zeichnen
            let lineWidth = radius * 1.6
            let lineSpacing = radius * 0.5
            
            // Obere Linie
            MovementLine(
                start: CGPoint(x: center.x - lineWidth/2, y: center.y - lineSpacing),
                end: CGPoint(x: center.x + lineWidth/2, y: center.y - lineSpacing)
            ).stroke(Color.blue, lineWidth: 2)
            
            // Mittlere Linie
            MovementLine(
                start: CGPoint(x: center.x - lineWidth/2, y: center.y),
                end: CGPoint(x: center.x + lineWidth/2, y: center.y)
            ).stroke(Color.blue, lineWidth: 2)
            
            // Untere Linie
            MovementLine(
                start: CGPoint(x: center.x - lineWidth/2, y: center.y + lineSpacing),
                end: CGPoint(x: center.x + lineWidth/2, y: center.y + lineSpacing)
            ).stroke(Color.blue, lineWidth: 2)
            
            // Vertikale Verbindungslinien
            MovementLine(
                start: CGPoint(x: center.x - lineWidth/2, y: center.y - lineSpacing),
                end: CGPoint(x: center.x - lineWidth/2, y: center.y + lineSpacing)
            ).stroke(Color.blue, lineWidth: 2)
            
            MovementLine(
                start: CGPoint(x: center.x + lineWidth/2, y: center.y - lineSpacing),
                end: CGPoint(x: center.x + lineWidth/2, y: center.y + lineSpacing)
            ).stroke(Color.blue, lineWidth: 2)
            
            // Startpunkt
            Circle()
                .fill(Color.red)
                .frame(width: 8, height: 8)
                .position(x: center.x - lineWidth/2, y: center.y)
        }
    }
}

struct TaegeukIhJangPattern: View {
    let center: CGPoint
    let radius: CGFloat
    
    var body: some View {
        ZStack {
            // Taegeuk Ih Jang - ähnlich wie Il Jang, aber mit leicht verändertem Muster
            // Repräsentiert das See-Trigramm
            
            // Die drei horizontalen Linien zeichnen
            let lineWidth = radius * 1.6
            let lineSpacing = radius * 0.5
            
            // Obere Linie
            MovementLine(
                start: CGPoint(x: center.x - lineWidth/2, y: center.y - lineSpacing),
                end: CGPoint(x: center.x + lineWidth/2, y: center.y - lineSpacing)
            ).stroke(Color.blue, lineWidth: 2)
            
            // Mittlere Linie
            MovementLine(
                start: CGPoint(x: center.x - lineWidth/2, y: center.y),
                end: CGPoint(x: center.x + lineWidth/2, y: center.y)
            ).stroke(Color.blue, lineWidth: 2)
            
            // Untere Linie
            MovementLine(
                start: CGPoint(x: center.x - lineWidth/2, y: center.y + lineSpacing),
                end: CGPoint(x: center.x + lineWidth/2, y: center.y + lineSpacing)
            ).stroke(Color.blue, lineWidth: 2)
            
            // Vertikale Verbindungslinien
            MovementLine(
                start: CGPoint(x: center.x - lineWidth/2, y: center.y - lineSpacing),
                end: CGPoint(x: center.x - lineWidth/2, y: center.y + lineSpacing)
            ).stroke(Color.blue, lineWidth: 2)
            
            MovementLine(
                start: CGPoint(x: center.x + lineWidth/2, y: center.y - lineSpacing),
                end: CGPoint(x: center.x + lineWidth/2, y: center.y + lineSpacing)
            ).stroke(Color.blue, lineWidth: 2)
            
            // Startpunkt
            Circle()
                .fill(Color.red)
                .frame(width: 8, height: 8)
                .position(x: center.x - lineWidth/2, y: center.y)
        }
    }
}

struct TaegeukSamJangPattern: View {
    let center: CGPoint
    let radius: CGFloat
    
    var body: some View {
        ZStack {
            // Taegeuk Sam Jang - Feuer-Muster
            // Grundlegendes Drei-Linien-Muster mit zusätzlichen Bewegungen
            
            // Die drei horizontalen Linien zeichnen
            let lineWidth = radius * 1.6
            let lineSpacing = radius * 0.5
            
            // Obere Linie
            MovementLine(
                start: CGPoint(x: center.x - lineWidth/2, y: center.y - lineSpacing),
                end: CGPoint(x: center.x + lineWidth/2, y: center.y - lineSpacing)
            ).stroke(Color.blue, lineWidth: 2)
            
            // Mittlere Linie mit Einkerbung in der Mitte (Feuersymbol darstellend)
            MovementLine(
                start: CGPoint(x: center.x - lineWidth/2, y: center.y),
                end: CGPoint(x: center.x - lineWidth/4, y: center.y)
            ).stroke(Color.blue, lineWidth: 2)
            
            MovementLine(
                start: CGPoint(x: center.x - lineWidth/4, y: center.y),
                end: CGPoint(x: center.x, y: center.y - lineSpacing/2)
            ).stroke(Color.blue, lineWidth: 2)
            
            MovementLine(
                start: CGPoint(x: center.x, y: center.y - lineSpacing/2),
                end: CGPoint(x: center.x + lineWidth/4, y: center.y)
            ).stroke(Color.blue, lineWidth: 2)
            
            MovementLine(
                start: CGPoint(x: center.x + lineWidth/4, y: center.y),
                end: CGPoint(x: center.x + lineWidth/2, y: center.y)
            ).stroke(Color.blue, lineWidth: 2)
            
            // Untere Linie
            MovementLine(
                start: CGPoint(x: center.x - lineWidth/2, y: center.y + lineSpacing),
                end: CGPoint(x: center.x + lineWidth/2, y: center.y + lineSpacing)
            ).stroke(Color.blue, lineWidth: 2)
            
            // Vertikale Verbindungslinien
            MovementLine(
                start: CGPoint(x: center.x - lineWidth/2, y: center.y - lineSpacing),
                end: CGPoint(x: center.x - lineWidth/2, y: center.y + lineSpacing)
            ).stroke(Color.blue, lineWidth: 2)
            
            MovementLine(
                start: CGPoint(x: center.x + lineWidth/2, y: center.y - lineSpacing),
                end: CGPoint(x: center.x + lineWidth/2, y: center.y + lineSpacing)
            ).stroke(Color.blue, lineWidth: 2)
            
            // Startpunkt
            Circle()
                .fill(Color.red)
                .frame(width: 8, height: 8)
                .position(x: center.x - lineWidth/2, y: center.y)
        }
    }
}

struct TaegeukSaJangPattern: View {
    let center: CGPoint
    let radius: CGFloat
    
    var body: some View {
        ZStack {
            // Taegeuk Sa Jang - Donner-Muster
            
            // Die drei horizontalen Linien zeichnen
            let lineWidth = radius * 1.6
            let lineSpacing = radius * 0.5
            
            // Obere Linie
            MovementLine(
                start: CGPoint(x: center.x - lineWidth/2, y: center.y - lineSpacing),
                end: CGPoint(x: center.x + lineWidth/2, y: center.y - lineSpacing)
            ).stroke(Color.blue, lineWidth: 2)
            
            // Mittlere Linie mit Donner-Zickzack
            MovementLine(
                start: CGPoint(x: center.x - lineWidth/2, y: center.y),
                end: CGPoint(x: center.x - lineWidth/4, y: center.y)
            ).stroke(Color.blue, lineWidth: 2)
            
            // Blitzdarstellung
            let zigzagPath = Path { path in
                path.move(to: CGPoint(x: center.x - lineWidth/4, y: center.y))
                path.addLine(to: CGPoint(x: center.x, y: center.y - lineSpacing/3))
                path.addLine(to: CGPoint(x: center.x + lineWidth/6, y: center.y))
                path.addLine(to: CGPoint(x: center.x + lineWidth/3, y: center.y - lineSpacing/3))
                path.addLine(to: CGPoint(x: center.x + lineWidth/2, y: center.y))
            }
            zigzagPath.stroke(Color.blue, lineWidth: 2)
            
            // Untere Linie
            MovementLine(
                start: CGPoint(x: center.x - lineWidth/2, y: center.y + lineSpacing),
                end: CGPoint(x: center.x + lineWidth/2, y: center.y + lineSpacing)
            ).stroke(Color.blue, lineWidth: 2)
            
            // Vertikale Verbindungslinien
            MovementLine(
                start: CGPoint(x: center.x - lineWidth/2, y: center.y - lineSpacing),
                end: CGPoint(x: center.x - lineWidth/2, y: center.y + lineSpacing)
            ).stroke(Color.blue, lineWidth: 2)
            
            MovementLine(
                start: CGPoint(x: center.x + lineWidth/2, y: center.y - lineSpacing),
                end: CGPoint(x: center.x + lineWidth/2, y: center.y + lineSpacing)
            ).stroke(Color.blue, lineWidth: 2)
            
            // Startpunkt
            Circle()
                .fill(Color.red)
                .frame(width: 8, height: 8)
                .position(x: center.x - lineWidth/2, y: center.y)
        }
    }
}

struct TaegeukOhJangPattern: View {
    let center: CGPoint
    let radius: CGFloat
    
    var body: some View {
        ZStack {
            // Taegeuk Oh Jang - Wind-Muster
            
            // Die drei horizontalen Linien mit einer gebogenen Mitte (Wind) zeichnen
            let lineWidth = radius * 1.6
            let lineSpacing = radius * 0.5
            
            // Obere Linie
            MovementLine(
                start: CGPoint(x: center.x - lineWidth/2, y: center.y - lineSpacing),
                end: CGPoint(x: center.x + lineWidth/2, y: center.y - lineSpacing)
            ).stroke(Color.blue, lineWidth: 2)
            
            // Mittlere Linie mit Windkurve
            Path { path in
                path.move(to: CGPoint(x: center.x - lineWidth/2, y: center.y))
                path.addCurve(
                    to: CGPoint(x: center.x + lineWidth/2, y: center.y),
                    control1: CGPoint(x: center.x - lineWidth/4, y: center.y - lineSpacing/2),
                    control2: CGPoint(x: center.x + lineWidth/4, y: center.y + lineSpacing/2)
                )
            }.stroke(Color.blue, lineWidth: 2)
            
            // Untere Linie
            MovementLine(
                start: CGPoint(x: center.x - lineWidth/2, y: center.y + lineSpacing),
                end: CGPoint(x: center.x + lineWidth/2, y: center.y + lineSpacing)
            ).stroke(Color.blue, lineWidth: 2)
            
            // Vertikale Verbindungslinien
            MovementLine(
                start: CGPoint(x: center.x - lineWidth/2, y: center.y - lineSpacing),
                end: CGPoint(x: center.x - lineWidth/2, y: center.y + lineSpacing)
            ).stroke(Color.blue, lineWidth: 2)
            
            MovementLine(
                start: CGPoint(x: center.x + lineWidth/2, y: center.y - lineSpacing),
                end: CGPoint(x: center.x + lineWidth/2, y: center.y + lineSpacing)
            ).stroke(Color.blue, lineWidth: 2)
            
            // Startpunkt
            Circle()
                .fill(Color.red)
                .frame(width: 8, height: 8)
                .position(x: center.x - lineWidth/2, y: center.y)
        }
    }
}

struct TaegeukYukJangPattern: View {
    let center: CGPoint
    let radius: CGFloat
    
    var body: some View {
        ZStack {
            // Taegeuk Yuk Jang - Wasser-Muster
            
            // Die drei horizontalen Linien mit einer Welle in der Mitte (Wasser) zeichnen
            let lineWidth = radius * 1.6
            let lineSpacing = radius * 0.5
            
            // Obere Linie
            MovementLine(
                start: CGPoint(x: center.x - lineWidth/2, y: center.y - lineSpacing),
                end: CGPoint(x: center.x + lineWidth/2, y: center.y - lineSpacing)
            ).stroke(Color.blue, lineWidth: 2)
            
            // Mittlere Linie mit Welle
            Path { path in
                path.move(to: CGPoint(x: center.x - lineWidth/2, y: center.y))
                path.addCurve(
                    to: CGPoint(x: center.x, y: center.y + lineSpacing/3),
                    control1: CGPoint(x: center.x - lineWidth/3, y: center.y),
                    control2: CGPoint(x: center.x - lineWidth/6, y: center.y + lineSpacing/3)
                )
                path.addCurve(
                    to: CGPoint(x: center.x + lineWidth/2, y: center.y),
                    control1: CGPoint(x: center.x + lineWidth/6, y: center.y + lineSpacing/3),
                    control2: CGPoint(x: center.x + lineWidth/3, y: center.y)
                )
            }.stroke(Color.blue, lineWidth: 2)
            
            // Untere Linie
            MovementLine(
                start: CGPoint(x: center.x - lineWidth/2, y: center.y + lineSpacing),
                end: CGPoint(x: center.x + lineWidth/2, y: center.y + lineSpacing)
            ).stroke(Color.blue, lineWidth: 2)
            
            // Vertikale Verbindungslinien
            MovementLine(
                start: CGPoint(x: center.x - lineWidth/2, y: center.y - lineSpacing),
                end: CGPoint(x: center.x - lineWidth/2, y: center.y + lineSpacing)
            ).stroke(Color.blue, lineWidth: 2)
            
            MovementLine(
                start: CGPoint(x: center.x + lineWidth/2, y: center.y - lineSpacing),
                end: CGPoint(x: center.x + lineWidth/2, y: center.y + lineSpacing)
            ).stroke(Color.blue, lineWidth: 2)
            
            // Startpunkt
            Circle()
                .fill(Color.red)
                .frame(width: 8, height: 8)
                .position(x: center.x - lineWidth/2, y: center.y)
        }
    }
}

struct TaegeukChilJangPattern: View {
    let center: CGPoint
    let radius: CGFloat
    
    var body: some View {
        ZStack {
            // Taegeuk Chil Jang - Berg-Muster
            
            // Die drei horizontalen Linien mit einer Bergspitze in der Mitte zeichnen
            let lineWidth = radius * 1.6
            let lineSpacing = radius * 0.5
            
            // Obere Linie
            MovementLine(
                start: CGPoint(x: center.x - lineWidth/2, y: center.y - lineSpacing),
                end: CGPoint(x: center.x + lineWidth/2, y: center.y - lineSpacing)
            ).stroke(Color.blue, lineWidth: 2)
            
            // Mittlere Linie mit Berg
            MovementLine(
                start: CGPoint(x: center.x - lineWidth/2, y: center.y),
                end: CGPoint(x: center.x - lineWidth/4, y: center.y)
            ).stroke(Color.blue, lineWidth: 2)
            
            // Bergspitze
            Path { path in
                path.move(to: CGPoint(x: center.x - lineWidth/4, y: center.y))
                path.addLine(to: CGPoint(x: center.x, y: center.y - lineSpacing/2))
                path.addLine(to: CGPoint(x: center.x + lineWidth/4, y: center.y))
                path.addLine(to: CGPoint(x: center.x + lineWidth/2, y: center.y))
            }.stroke(Color.blue, lineWidth: 2)
            
            // Untere Linie
            MovementLine(
                start: CGPoint(x: center.x - lineWidth/2, y: center.y + lineSpacing),
                end: CGPoint(x: center.x + lineWidth/2, y: center.y + lineSpacing)
            ).stroke(Color.blue, lineWidth: 2)
            
            // Vertikale Verbindungslinien
            MovementLine(
                start: CGPoint(x: center.x - lineWidth/2, y: center.y - lineSpacing),
                end: CGPoint(x: center.x - lineWidth/2, y: center.y + lineSpacing)
            ).stroke(Color.blue, lineWidth: 2)
            
            MovementLine(
                start: CGPoint(x: center.x + lineWidth/2, y: center.y - lineSpacing),
                end: CGPoint(x: center.x + lineWidth/2, y: center.y + lineSpacing)
            ).stroke(Color.blue, lineWidth: 2)
            
            // Startpunkt
            Circle()
                .fill(Color.red)
                .frame(width: 8, height: 8)
                .position(x: center.x - lineWidth/2, y: center.y)
        }
    }
}

struct TaegeukPalJangPattern: View {
    let center: CGPoint
    let radius: CGFloat
    
    var body: some View {
        ZStack {
            // Taegeuk Pal Jang - Erde-Muster
            
            // Die drei horizontalen Linien zeichnen
            let lineWidth = radius * 1.6
            let lineSpacing = radius * 0.5
            
            // Obere Linie
            MovementLine(
                start: CGPoint(x: center.x - lineWidth/2, y: center.y - lineSpacing),
                end: CGPoint(x: center.x + lineWidth/2, y: center.y - lineSpacing)
            ).stroke(Color.blue, lineWidth: 2)
            
            // Mittlere Linie geteilt (Erde repräsentierend)
            MovementLine(
                start: CGPoint(x: center.x - lineWidth/2, y: center.y),
                end: CGPoint(x: center.x - lineWidth/6, y: center.y)
            ).stroke(Color.blue, lineWidth: 2)
            
            MovementLine(
                start: CGPoint(x: center.x + lineWidth/6, y: center.y),
                end: CGPoint(x: center.x + lineWidth/2, y: center.y)
            ).stroke(Color.blue, lineWidth: 2)
            
            // Untere Linie
            MovementLine(
                start: CGPoint(x: center.x - lineWidth/2, y: center.y + lineSpacing),
                end: CGPoint(x: center.x + lineWidth/2, y: center.y + lineSpacing)
            ).stroke(Color.blue, lineWidth: 2)
            
            // Vertikale Verbindungslinien
            MovementLine(
                start: CGPoint(x: center.x - lineWidth/2, y: center.y - lineSpacing),
                end: CGPoint(x: center.x - lineWidth/2, y: center.y + lineSpacing)
            ).stroke(Color.blue, lineWidth: 2)
            
            MovementLine(
                start: CGPoint(x: center.x + lineWidth/2, y: center.y - lineSpacing),
                end: CGPoint(x: center.x + lineWidth/2, y: center.y + lineSpacing)
            ).stroke(Color.blue, lineWidth: 2)
            
            // Startpunkt
            Circle()
                .fill(Color.red)
                .frame(width: 8, height: 8)
                .position(x: center.x - lineWidth/2, y: center.y)
        }
    }
}

struct KoryoPattern: View {
    let center: CGPoint
    let radius: CGFloat
    
    var body: some View {
        ZStack {
            // Koryo - Gelehrten-Muster (ähnelt dem koreanischen Zeichen 士, was "Gelehrter" bedeutet)
            let lineWidth = radius * 1.6
            let lineSpacing = radius * 0.5
            
            // Obere horizontale Linie
            MovementLine(
                start: CGPoint(x: center.x - lineWidth/2, y: center.y - lineSpacing),
                end: CGPoint(x: center.x + lineWidth/2, y: center.y - lineSpacing)
            ).stroke(Color.blue, lineWidth: 2)
            
            // Mittlere horizontale Linie
            MovementLine(
                start: CGPoint(x: center.x - lineWidth/3, y: center.y),
                end: CGPoint(x: center.x + lineWidth/3, y: center.y)
            ).stroke(Color.blue, lineWidth: 2)
            
            // Untere horizontale Linie
            MovementLine(
                start: CGPoint(x: center.x - lineWidth/2, y: center.y + lineSpacing),
                end: CGPoint(x: center.x + lineWidth/2, y: center.y + lineSpacing)
            ).stroke(Color.blue, lineWidth: 2)
            
            // Vertikale Linien
            MovementLine(
                start: CGPoint(x: center.x - lineWidth/2, y: center.y - lineSpacing),
                end: CGPoint(x: center.x - lineWidth/2, y: center.y + lineSpacing)
            ).stroke(Color.blue, lineWidth: 2)
            
            MovementLine(
                start: CGPoint(x: center.x, y: center.y - lineSpacing),
                end: CGPoint(x: center.x, y: center.y + lineSpacing)
            ).stroke(Color.blue, lineWidth: 2)
            
            MovementLine(
                start: CGPoint(x: center.x + lineWidth/2, y: center.y - lineSpacing),
                end: CGPoint(x: center.x + lineWidth/2, y: center.y + lineSpacing)
            ).stroke(Color.blue, lineWidth: 2)
            
            // Startpunkt
            Circle()
                .fill(Color.red)
                .frame(width: 8, height: 8)
                .position(x: center.x - lineWidth/2, y: center.y)
        }
    }
}

#Preview {
    ScrollView {
        VStack(spacing: 20) {
            FormDiagramView(form: Form(
                name: "Saju Jirugi",
                koreanName: "사주 지르기",
                beltLevel: .yellow,
                movements: [],
                description: ""
            ), size: 200)
            
            FormDiagramView(form: Form(
                name: "Taegeuk Il Jang",
                koreanName: "태극 1장",
                beltLevel: .yellow,
                movements: [],
                description: ""
            ), size: 200)
            
            FormDiagramView(form: Form(
                name: "Taegeuk Ih Jang",
                koreanName: "태극 2장",
                beltLevel: .greenYellow,
                movements: [],
                description: ""
            ), size: 200)
            
            FormDiagramView(form: Form(
                name: "Taegeuk Sam Jang",
                koreanName: "태극 3장",
                beltLevel: .green,
                movements: [],
                description: ""
            ), size: 200)
            
            FormDiagramView(form: Form(
                name: "Taegeuk Sa Jang",
                koreanName: "태극 4장",
                beltLevel: .blue,
                movements: [],
                description: ""
            ), size: 200)
            
            FormDiagramView(form: Form(
                name: "Taegeuk Oh Jang",
                koreanName: "태극 5장",
                beltLevel: .blueGreen,
                movements: [],
                description: ""
            ), size: 200)
            
            FormDiagramView(form: Form(
                name: "Taegeuk Yuk Jang",
                koreanName: "태극 6장",
                beltLevel: .redBlue,
                movements: [],
                description: ""
            ), size: 200)
            
            FormDiagramView(form: Form(
                name: "Taegeuk Chil Jang",
                koreanName: "태극 7장",
                beltLevel: .red,
                movements: [],
                description: ""
            ), size: 200)
            
            FormDiagramView(form: Form(
                name: "Taegeuk Pal Jang",
                koreanName: "태극 8장",
                beltLevel: .blackRed,
                movements: [],
                description: ""
            ), size: 200)
            
            FormDiagramView(form: Form(
                name: "Koryo",
                koreanName: "고려",
                beltLevel: .black,
                movements: [],
                description: ""
            ), size: 200)
        }
        .padding()
    }
} 