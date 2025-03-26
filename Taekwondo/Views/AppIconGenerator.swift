import SwiftUI

struct AppIconGenerator: View {
    let sizes: [CGFloat] = [1024, 180, 120, 87, 80, 60, 58, 40]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Taekwondo App Icons")
                    .font(.headline)
                
                ForEach(sizes, id: \.self) { size in
                    VStack {
                        Text("\(Int(size))×\(Int(size))")
                            .font(.caption)
                        
                        LogoView(size: size)
                            .frame(width: min(size, 300), height: min(size, 300))
                            .border(Color.gray.opacity(0.3))
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    AppIconGenerator()
} 