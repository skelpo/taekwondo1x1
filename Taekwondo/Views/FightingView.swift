import SwiftUI
import AudioToolbox

struct FightingView: View {
    @StateObject private var viewModel = AppViewModel()
    @State private var session: FightingSession?
    @State private var timeRemaining: TimeInterval = 0
    @State private var isActive = false
    
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack(spacing: 20) {
            // Timer Display
            ZStack {
                Circle()
                    .stroke(lineWidth: 8)
                    .opacity(0.3)
                    .foregroundColor(.blue)
                
                Circle()
                    .trim(from: 0.0, to: progress)
                    .stroke(style: StrokeStyle(lineWidth: 8, lineCap: .round, lineJoin: .round))
                    .foregroundColor(session?.isBreak == true ? .orange : .blue)
                    .rotationEffect(Angle(degrees: 270.0))
                
                VStack {
                    Text(timeString(from: timeRemaining))
                        .font(.system(size: 60, weight: .bold, design: .monospaced))
                    
                    if let session = session {
                        Text("Runde \(session.currentRound)/\(session.settings.numberOfRounds)")
                            .font(.headline)
                    }
                }
            }
            .frame(width: 250, height: 250)
            
            // Task
            if let session = session {
                Text(session.settings.task)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            
            // Controls
            HStack(spacing: 30) {
                Button(action: resetTimer) {
                    Image(systemName: "arrow.counterclockwise")
                        .font(.title)
                }
                
                Button(action: toggleTimer) {
                    Image(systemName: isActive ? "pause.fill" : "play.fill")
                        .font(.title)
                }
            }
            .padding()
            
            // Settings
            SwiftUI.Form {
                Section("Einstellungen") {
                    Picker("Pausenzeit", selection: $viewModel.fightingSettings.breakDuration) {
                        ForEach(FightingSettings.defaultBreakDurations, id: \.self) { duration in
                            Text("\(Int(duration)) Sekunden").tag(duration)
                        }
                    }
                    
                    Picker("Kampfzeit", selection: $viewModel.fightingSettings.roundDuration) {
                        ForEach(FightingSettings.defaultRoundDurations, id: \.self) { duration in
                            Text("\(Int(duration)) Sekunden").tag(duration)
                        }
                    }
                }
            }
        }
        .navigationTitle("Kampf")
        .onAppear {
            resetTimer()
        }
        .onReceive(timer) { _ in
            guard isActive else { return }
            
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                handleRoundComplete()
            }
        }
    }
    
    private var progress: Double {
        guard let session = session else { return 0 }
        let total = session.isBreak ? session.settings.breakDuration : session.settings.roundDuration
        return 1.0 - (timeRemaining / total)
    }
    
    private func timeString(from timeInterval: TimeInterval) -> String {
        let minutes = Int(timeInterval) / 60
        let seconds = Int(timeInterval) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    private func toggleTimer() {
        isActive.toggle()
    }
    
    private func resetTimer() {
        isActive = false
        session = FightingSession(settings: viewModel.fightingSettings)
        timeRemaining = viewModel.fightingSettings.roundDuration
    }
    
    private func handleRoundComplete() {
        guard var session = session else { return }
        
        if session.isBreak {
            // Break is over, start next round
            session.currentRound += 1
            session.isBreak = false
            timeRemaining = session.settings.roundDuration
        } else if session.currentRound < session.settings.numberOfRounds {
            // Round is over, start break
            session.isBreak = true
            timeRemaining = session.settings.breakDuration
        } else {
            // Session complete
            isActive = false
            playCompletionSound()
        }
        
        self.session = session
    }
    
    private func playCompletionSound() {
        AudioServicesPlaySystemSound(1007)
    }
}

#Preview {
    NavigationStack {
        FightingView()
    }
} 