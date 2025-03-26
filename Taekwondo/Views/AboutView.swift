import SwiftUI

struct AboutView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                LogoView(size: 180)
                    .padding(.top, 40)
                
                VStack(spacing: 10) {
                    Text("Taekwondo")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("Dein Leitfaden für Taekwondo-Muster")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                VStack(alignment: .leading, spacing: 15) {
                    infoRow(icon: "person.fill", text: "Erlerne traditionelle Taekwondo-Formen")
                    infoRow(icon: "chart.bar.fill", text: "Verfolgen deinen Fortschritt")
                    infoRow(icon: "video.fill", text: "Visuelle Bewegungsanleitungen")
                    infoRow(icon: "mappin.and.ellipse", text: "Form-Diagramme und Muster")
                }
                .padding(.horizontal)
                
                Divider()
                    .padding(.vertical)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Impressum")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    Text("Skelpo GmbH\n\nKöttingstraße 41\nBreckerfeld\nDeutschland\nTelefon +49 (0) 2338 8733446\ninfo@skelpo.com\n\nVertretungsberechtigter Geschäftsführer: Ralph Küpper\n\nHandelsregister: Amtsgericht Hagen HRB 8266\nUmsatzsteuer-Identifikationsnummer: DE266573808\nHaftungshinweis\n\nTrotz sorgfältiger inhaltlicher Kontrolle übernehmen wir keine Haftung für die Inhalte externer Links. Für den Inhalt der verlinkten Seiten sind ausschließlich deren Betreiber verantwortlich\n\nInhaltlich verantwortlich: Ralph Küpper")
                        .font(.caption)
                        .padding(.horizontal)
                    
                    HStack {
                        Text("Kontakt:")
                            .font(.caption)
                            .fontWeight(.medium)
                        
                        Link("taekwondo@skelpo.com", destination: URL(string: "mailto:taekwondo@skelpo.com")!)
                            .font(.caption)
                    }
                    .padding(.horizontal)
                    .padding(.top, 5)
                }
                
                Spacer()
                
                Text("Version 1.0")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 20)
            }
            .frame(maxWidth: .infinity)
            .background(Color(.systemBackground))
        }
    }
    
    private func infoRow(icon: String, text: String) -> some View {
        HStack(spacing: 15) {
            Image(systemName: icon)
                .font(.system(size: 22))
                .foregroundColor(.blue)
                .frame(width: 30)
            
            Text(text)
                .font(.body)
        }
    }
}

#Preview {
    AboutView()
} 
