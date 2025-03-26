import SwiftUI

struct LogoView: View {
    var size: CGFloat = 200
    var primaryColor: Color = .blue
    var accentColor: Color = .red
    
    var body: some View {
        ZStack {
            // Background circle with Korean flag-inspired design
            Circle()
                .fill(Color.white)
                .overlay(
                    ZStack {
                        // Taeguk symbol (centered, larger)
                        TaegukSymbol(size: size * 0.6)
                            .offset(x: 0, y: -size * 0.05)
                        
                        // Trigrams inspired by Korean flag
                        Group {
                            // Heaven trigram (top right)
                            KoreanTrigram(type: .heaven)
                                .frame(width: size * 0.2, height: size * 0.2)
                                .offset(x: size * 0.25, y: -size * 0.25)
                            
                            // Earth trigram (bottom left)
                            KoreanTrigram(type: .earth)
                                .frame(width: size * 0.2, height: size * 0.2)
                                .offset(x: -size * 0.25, y: size * 0.25)
                            
                            // Water trigram (bottom right)
                            KoreanTrigram(type: .water)
                                .frame(width: size * 0.2, height: size * 0.2)
                                .offset(x: size * 0.25, y: size * 0.25)
                            
                            // Fire trigram (top left)
                            KoreanTrigram(type: .fire)
                                .frame(width: size * 0.2, height: size * 0.2)
                                .offset(x: -size * 0.25, y: -size * 0.25)
                        }
                    }
                )
                .overlay(
                    // Kicking figure in center
                    TaekwondoKicker()
                        .fill(Color.black)
                        .frame(width: size * 0.4, height: size * 0.4)
                        .offset(y: size * 0.05)
                )
                .shadow(color: .gray.opacity(0.3), radius: 8, x: 0, y: 2)
            
            // Korean "태권도" text (Taekwondo) at the bottom
            Text("태권도")
                .font(.system(size: size * 0.16, weight: .bold, design: .default))
                .foregroundColor(.black)
                .offset(y: size * 0.35)
        }
        .frame(width: size, height: size)
    }
}

// Taeguk symbol (yin-yang style symbol from Korean flag)
struct TaegukSymbol: View {
    var size: CGFloat
    var redColor: Color = .red
    var blueColor: Color = .blue
    
    var body: some View {
        ZStack {
            // Blue half (representing heaven/cosmos)
            Circle()
                .fill(blueColor)
                .frame(width: size, height: size)
                .overlay(
                    Circle()
                        .fill(redColor)
                        .frame(width: size/2, height: size/2)
                        .offset(x: -size/4, y: 0)
                )
                .clipShape(
                    Rectangle()
                        .offset(x: size/4)
                )
            
            // Red half (representing earth)
            Circle()
                .fill(redColor)
                .frame(width: size, height: size)
                .overlay(
                    Circle()
                        .fill(blueColor)
                        .frame(width: size/2, height: size/2)
                        .offset(x: size/4, y: 0)
                )
                .clipShape(
                    Rectangle()
                        .offset(x: -size/4)
                )
        }
    }
}

// Korean trigram types from the flag
enum TrigramType {
    case heaven, earth, water, fire
}

// Korean trigram symbols
struct KoreanTrigram: View {
    var type: TrigramType
    
    var body: some View {
        VStack(spacing: 4) {
            ForEach(0..<3) { index in
                if lineForTrigram(type: type, line: index) {
                    Rectangle()
                        .frame(height: 5)
                } else {
                    HStack(spacing: 4) {
                        Rectangle()
                            .frame(width: 10, height: 5)
                        Rectangle()
                            .frame(width: 10, height: 5)
                    }
                }
            }
        }
        .foregroundColor(.black)
    }
    
    // Determine if a line is solid or broken based on trigram type and position
    private func lineForTrigram(type: TrigramType, line: Int) -> Bool {
        switch type {
        case .heaven:
            return true // All solid lines
        case .earth:
            return false // All broken lines
        case .water:
            return [false, true, false][line] // Broken, solid, broken
        case .fire:
            return [true, false, true][line] // Solid, broken, solid
        }
    }
}

// Taekwondo kicking figure
struct TaekwondoKicker: Shape {
    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        
        var path = Path()
        
        // More dynamic kicking pose
        
        // Head
        path.addEllipse(in: CGRect(x: width * 0.4, y: height * 0.15, width: width * 0.2, height: width * 0.2))
        
        // Body
        path.move(to: CGPoint(x: width * 0.5, y: height * 0.35))
        path.addLine(to: CGPoint(x: width * 0.5, y: height * 0.6))
        
        // Kicking leg - more dynamic high kick
        path.move(to: CGPoint(x: width * 0.5, y: height * 0.5))
        path.addCurve(
            to: CGPoint(x: width * 0.85, y: height * 0.25),
            control1: CGPoint(x: width * 0.6, y: height * 0.5),
            control2: CGPoint(x: width * 0.7, y: height * 0.3)
        )
        
        // Base leg
        path.move(to: CGPoint(x: width * 0.5, y: height * 0.6))
        path.addCurve(
            to: CGPoint(x: width * 0.3, y: height * 0.85),
            control1: CGPoint(x: width * 0.5, y: height * 0.7),
            control2: CGPoint(x: width * 0.4, y: height * 0.8)
        )
        
        // Arms in guard position
        path.move(to: CGPoint(x: width * 0.5, y: height * 0.4))
        path.addLine(to: CGPoint(x: width * 0.3, y: height * 0.45))
        
        path.move(to: CGPoint(x: width * 0.5, y: height * 0.4))
        path.addLine(to: CGPoint(x: width * 0.7, y: height * 0.35))
        
        // Make lines thicker for visibility
        return path.strokedPath(StrokeStyle(lineWidth: width * 0.06, lineCap: .round, lineJoin: .round))
    }
}

// Logo preview
struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 40) {
            LogoView(size: 200)
            
            // App icon preview size
            LogoView(size: 100)
                .padding()
                .background(Color(.systemBackground))
                .cornerRadius(20)
        }
        .padding()
        .background(Color(.systemGray6))
    }
} 