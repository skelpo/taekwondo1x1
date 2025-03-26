import SwiftUI

struct VocabularyView: View {
    @StateObject private var viewModel = AppViewModel()
    @State private var selectedCategories: Set<VocabularyCategory> = Set(VocabularyCategory.allCases)
    @State private var showingKorean = false
    
    var filteredItems: [VocabularyItem] {
        viewModel.vocabularyItems.filter { selectedCategories.contains($0.category) }
    }
    
    var body: some View {
        List {
            Section {
                ForEach(VocabularyCategory.allCases, id: \.self) { category in
                    Toggle(category.rawValue, isOn: binding(for: category))
                }
            } header: {
                Text("Kategorie")
            }
            
            Section {
                ForEach(filteredItems) { item in
                    VocabularyCardView(item: item, showingKorean: showingKorean)
                }
            }
        }
        .navigationTitle("Vokabeln")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: { showingKorean.toggle() }) {
                    Image(systemName: showingKorean ? "textformat.abc" : "textformat.alt")
                }
            }
        }
    }
    
    private func binding(for category: VocabularyCategory) -> Binding<Bool> {
        Binding(
            get: { selectedCategories.contains(category) },
            set: { isSelected in
                if isSelected {
                    selectedCategories.insert(category)
                } else {
                    selectedCategories.remove(category)
                }
            }
        )
    }
}

struct VocabularyCardView: View {
    let item: VocabularyItem
    let showingKorean: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(showingKorean ? item.korean : item.german)
                .font(.headline)
            
            Text(showingKorean ? item.german : item.korean)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            if let illustration = item.illustration {
                Image(illustration)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
            }
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    NavigationStack {
        VocabularyView()
    }
} 