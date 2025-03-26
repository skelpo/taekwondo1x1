import SwiftUI

struct ContentView: View {
    @State private var showingDeveloperTools = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Logo in header
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .padding(.vertical, 20)
                
                List {
                    NavigationLink(destination: VocabularyView()) {
                        MenuRowView(
                            title: "Vokabeln",
                            icon: "textbook",
                            color: .blue
                        )
                    }
                    
                    NavigationLink(destination: TrainingView()) {
                        MenuRowView(
                            title: "Training",
                            icon: "figure.martial.arts",
                            color: .orange
                        )
                    }
                    
                    NavigationLink(destination: FormsView()) {
                        MenuRowView(
                            title: "Formen",
                            icon: "figure.walk",
                            color: .purple
                        )
                    }
                    
                    NavigationLink(destination: FightingView()) {
                        MenuRowView(
                            title: "Kampf",
                            icon: "timer",
                            color: .red
                        )
                    }
                    
                    NavigationLink(destination: ExamRequirementsView()) {
                        MenuRowView(
                            title: "Prüfungsordnung",
                            icon: "list.clipboard",
                            color: .green
                        )
                    }
                    
                    // About section
                    NavigationLink(destination: AboutView()) {
                        MenuRowView(
                            title: "Über die App",
                            icon: "info.circle",
                            color: .indigo
                        )
                    }
                }
                .navigationTitle("Taekwondo")
                .navigationBarTitleDisplayMode(.inline)
                .listStyle(.insetGrouped)
            }
            .sheet(isPresented: $showingDeveloperTools) {
                NavigationStack {
                    VStack {
                        Text("Developer Tools")
                            .font(.headline)
                            .padding()
                        
                        List {
                            NavigationLink(destination: AppIconExporter()) {
                                HStack {
                                    Image(systemName: "square.and.arrow.up")
                                        .foregroundColor(.white)
                                        .frame(width: 32, height: 32)
                                        .background(Color.orange)
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                    
                                    Text("Export App Icon")
                                }
                            }
                            
                            NavigationLink(destination: AppIconGenerator()) {
                                HStack {
                                    Image(systemName: "ruler")
                                        .foregroundColor(.white)
                                        .frame(width: 32, height: 32)
                                        .background(Color.purple)
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                    
                                    Text("View Icon Sizes")
                                }
                            }
                        }
                    }
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button("Done") {
                                showingDeveloperTools = false
                            }
                        }
                    }
                }
            }
        }
    }
}

extension View {
    func onLongPress(perform action: @escaping () -> Void) -> some View {
        self.gesture(
            LongPressGesture(minimumDuration: 1.0)
                .onEnded { _ in
                    action()
                }
        )
    }
}

struct MenuRowView: View {
    let title: String
    let icon: String
    let color: Color
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.white)
                .frame(width: 32, height: 32)
                .background(color)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            Text(title)
                .font(.headline)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    ContentView()
} 
