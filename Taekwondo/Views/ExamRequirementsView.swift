import SwiftUI

struct ExamRequirementsView: View {
    @StateObject private var viewModel = AppViewModel()
    @State private var selectedBeltLevel: BeltLevel = .white
    
    var body: some View {
        List {
            Section {
                Picker("Gürtelgrad", selection: $selectedBeltLevel) {
                    ForEach(BeltLevel.allCases, id: \.self) { level in
                        HStack {
                            Circle()
                                .fill(beltColor(for: level))
                                .frame(width: 20, height: 20)
                            Text(level.description)
                        }
                        .tag(level)
                    }
                }
            }
            
            if let requirement = viewModel.examRequirements.first(where: { $0.beltLevel == selectedBeltLevel }) {
                Section("Grundschule") {
                    ForEach(requirement.basicTechniques, id: \.self) { technique in
                        Text(technique)
                    }
                }
                
                Section("Formen") {
                    ForEach(requirement.forms, id: \.self) { form in
                        Text(form)
                    }
                }
                
                Section("Selbstverteidigung") {
                    ForEach(requirement.selfDefense, id: \.self) { technique in
                        Text(technique)
                    }
                }
                
                Section("Sparring") {
                    ForEach(requirement.sparring, id: \.self) { rule in
                        Text(rule)
                    }
                }
                
                if let breakingTest = requirement.breakingTest {
                    Section("Bruchtest") {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Mindestalter: \(breakingTest.minimumAge) Jahre")
                            Text("Brettstärke: \(breakingTest.thickness)")
                            Text(breakingTest.description)
                        }
                    }
                }
                
                Section("Theorie") {
                    ForEach(requirement.theory, id: \.self) { topic in
                        Text(topic)
                    }
                }
            }
        }
        .navigationTitle("Prüfungsordnung")
    }
    
    private func beltColor(for level: BeltLevel) -> Color {
        switch level {
        case .white: return .white
        case .yellowWhite, .yellow: return .yellow
        case .greenYellow, .green: return .green
        case .blueGreen, .blue: return .blue
        case .redBlue, .red: return .red
        case .blackRed, .black: return .black
        }
    }
}

#Preview {
    NavigationStack {
        ExamRequirementsView()
    }
} 