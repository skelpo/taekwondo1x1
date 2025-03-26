import SwiftUI

struct FormsView: View {
    @StateObject private var viewModel = AppViewModel()
    @State private var selectedForm: Form?
    
    var body: some View {
        NavigationView {
            List(viewModel.forms) { form in
                FormRow(form: form)
                    .onTapGesture {
                        selectedForm = form
                    }
            }
            .navigationTitle("Formen")
            .sheet(item: $selectedForm) { form in
                FormDetailView(form: form)
            }
        }
    }
}

struct FormRow: View {
    let form: Form
    
    var body: some View {
        HStack {
            FormDiagramView(form: form, size: 60)
                .cornerRadius(8)
            
            VStack(alignment: .leading) {
                Text(form.name)
                    .font(.headline)
                Text(form.koreanName)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text(form.beltLevel.rawValue == 0 ? "1. Dan" : "\(form.beltLevel.rawValue). Kup")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 4)
    }
}

struct FormDetailView: View {
    let form: Form
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    FormDiagramView(form: form, size: 300)
                        .cornerRadius(12)
                        .padding()
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text(form.description)
                            .font(.body)
                        
                        Text("Bewegungen:")
                            .font(.headline)
                        
                        ForEach(Array(form.movements.enumerated()), id: \.offset) { index, movement in
                            VStack(alignment: .leading, spacing: 4) {
                                Text("\(index + 1). \(movement.description)")
                                    .font(.body)
                                Text(movement.koreanName)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                Text(movement.germanName)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            .padding(.vertical, 4)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle(form.name)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Fertig") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    FormsView()
} 