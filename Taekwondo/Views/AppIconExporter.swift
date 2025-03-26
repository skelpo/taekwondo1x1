import SwiftUI
import UIKit
import UniformTypeIdentifiers

// This view is for development only, to help with exporting app icon images
struct AppIconExporter: View {
    @State private var exportMessage = ""
    @State private var exportMode: ExportMode = .singleIcon
    @State private var exportedFileURL: URL? = nil
    @State private var showingShareSheet = false
    
    enum ExportMode {
        case singleIcon, allSizes
    }
    
    // App icon sizes required for iOS
    let appIconSizes: [(size: CGFloat, name: String)] = [
        (1024, "App Store 1024pt"),
        (180, "iPhone 60pt @3x"),
        (120, "iPhone 60pt @2x"),
        (120, "iPhone 40pt @3x"),
        (80, "iPhone 40pt @2x"),
        (87, "iPhone 29pt @3x"),
        (58, "iPhone 29pt @2x"),
        (60, "iPhone 20pt @3x"),
        (40, "iPhone 20pt @2x")
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Text("App Icon Exporter")
                    .font(.title)
                
                LogoView(size: 350)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 5)
                
                // Export mode selection
                Picker("Export Mode", selection: $exportMode) {
                    Text("Single Icon (1024×1024)").tag(ExportMode.singleIcon)
                    Text("All Required Sizes").tag(ExportMode.allSizes)
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                
                VStack(spacing: 20) {
                    HStack(spacing: 15) {
                        // Export button
                        Button(action: {
                            switch exportMode {
                            case .singleIcon:
                                exportAppIcon()
                            case .allSizes:
                                exportAllIconSizes()
                            }
                        }) {
                            HStack {
                                Image(systemName: "square.and.arrow.down")
                                Text(exportMode == .singleIcon ? "Export Icon" : "Export Icons")
                            }
                            .frame(minWidth: 120)
                            .padding()
                        }
                        .buttonStyle(.borderedProminent)
                        
                        // Share button (enabled after export)
                        Button(action: {
                            showingShareSheet = true
                        }) {
                            HStack {
                                Image(systemName: "square.and.arrow.up")
                                Text("Share")
                            }
                            .frame(minWidth: 120)
                            .padding()
                        }
                        .buttonStyle(.bordered)
                        .disabled(exportedFileURL == nil)
                    }
                    
                    Text(exportMessage)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Instructions:")
                        .font(.headline)
                    
                    Text("• Export: Saves icon(s) to app's Documents folder")
                    Text("• Share: Opens iOS Share Sheet to save to Files, send via AirDrop, etc.")
                    Text("• For App Store: Use the 1024×1024px icon (upload in App Store Connect)")
                    Text("• Use AirDrop or Save to Files to transfer to your computer")
                }
                .font(.caption)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
                
                if exportMode == .allSizes {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Sizes to be exported:")
                            .font(.caption)
                            .fontWeight(.bold)
                        
                        ForEach(appIconSizes, id: \.name) { size, name in
                            Text("• \(Int(size))×\(Int(size))px - \(name)")
                                .font(.caption)
                        }
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                }
            }
            .padding()
            .sheet(isPresented: $showingShareSheet) {
                if let url = exportedFileURL {
                    ShareSheet(items: [url])
                }
            }
        }
    }
    
    private func exportAppIcon() {
        // Create a UIHostingController to render our SwiftUI view
        let logoView = LogoView(size: 1024)
            .frame(width: 1024, height: 1024)
            .background(Color.white)
        
        let hostingController = UIHostingController(rootView: logoView)
        hostingController.view.frame = CGRect(x: 0, y: 0, width: 1024, height: 1024)
        
        // Render the view to an image
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 1024, height: 1024))
        let image = renderer.image { context in
            hostingController.view.drawHierarchy(in: hostingController.view.bounds, afterScreenUpdates: true)
        }
        
        // Save the image to the Documents directory
        if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileName = "TaekwondoAppIcon_1024x1024.png"
            let fileURL = documentsDirectory.appendingPathComponent(fileName)
            
            if let data = image.pngData() {
                do {
                    try data.write(to: fileURL)
                    exportMessage = "Saved to Documents. Tap Share to export."
                    exportedFileURL = fileURL
                    print("App icon saved to: \(fileURL.path)")
                } catch {
                    exportMessage = "Error saving image: \(error.localizedDescription)"
                }
            }
        }
    }
    
    private func exportAllIconSizes() {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            exportMessage = "Error: Could not access Documents directory"
            return
        }
        
        // Create a folder for all icon sizes
        let folderName = "TaekwondoAppIcons"
        let folderURL = documentsDirectory.appendingPathComponent(folderName)
        
        // Remove any existing folder
        try? FileManager.default.removeItem(at: folderURL)
        
        do {
            try FileManager.default.createDirectory(at: folderURL, withIntermediateDirectories: true)
        } catch {
            exportMessage = "Error creating directory: \(error.localizedDescription)"
            return
        }
        
        var savedCount = 0
        
        // Generate and save each size
        for (size, name) in appIconSizes {
            let intSize = Int(size)
            let safeSize = CGFloat(intSize) // Ensure we use exact integer size
            
            // Create the view at the target size
            let logoView = LogoView(size: safeSize)
                .frame(width: safeSize, height: safeSize)
                .background(Color.white)
            
            let hostingController = UIHostingController(rootView: logoView)
            hostingController.view.frame = CGRect(x: 0, y: 0, width: safeSize, height: safeSize)
            
            // Render the view
            let renderer = UIGraphicsImageRenderer(size: CGSize(width: safeSize, height: safeSize))
            let image = renderer.image { context in
                hostingController.view.drawHierarchy(in: hostingController.view.bounds, afterScreenUpdates: true)
            }
            
            // Save the image
            let fileName = "Icon-\(intSize)x\(intSize).png"
            let fileURL = folderURL.appendingPathComponent(fileName)
            
            if let data = image.pngData() {
                do {
                    try data.write(to: fileURL)
                    savedCount += 1
                    print("Saved \(fileName)")
                } catch {
                    print("Error saving \(fileName): \(error.localizedDescription)")
                }
            }
        }
        
        // Add a readme file
        let readmeContent = """
        Taekwondo App Icon Files
        =======================
        
        This folder contains app icon files for iOS in various required sizes.
        Use the 1024×1024 version for App Store submission.
        
        To use in Xcode:
        1. Drag these images into your AppIcon asset catalog
        2. Match each image with the corresponding size slot
        
        Generated: \(Date().formatted())
        """
        
        let readmeURL = folderURL.appendingPathComponent("README.txt")
        try? readmeContent.write(to: readmeURL, atomically: true, encoding: .utf8)
        
        // Share the folder directly
        exportMessage = "Saved \(savedCount) icons. Tap Share to export."
        exportedFileURL = folderURL
    }
}

// iOS Share Sheet for sharing files
struct ShareSheet: UIViewControllerRepresentable {
    let items: [Any]
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: items, applicationActivities: nil)
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}

#Preview {
    AppIconExporter()
} 