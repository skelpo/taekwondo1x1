import SwiftUI
import AudioToolbox

struct TrainingView: View {
    @StateObject private var viewModel = AppViewModel()
    @State private var selectedCategory: ExerciseCategory = .warmup
    @State private var selectedLevel: ExerciseLevel = .beginner
    @State private var isTimerActive = false
    @State private var remainingTime: TimeInterval = 0
    @State private var selectedExercise: TrainingExercise?
    
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var filteredExercises: [TrainingExercise] {
        viewModel.trainingExercises.filter { exercise in
            exercise.category == selectedCategory && exercise.level == selectedLevel
        }
    }
    
    var body: some View {
        List {
            Section {
                Picker("Kategorie", selection: $selectedCategory) {
                    ForEach(ExerciseCategory.allCases, id: \.self) { category in
                        Text(category.rawValue).tag(category)
                    }
                }
                
                Picker("Level", selection: $selectedLevel) {
                    ForEach(ExerciseLevel.allCases, id: \.self) { level in
                        Text(level.rawValue).tag(level)
                    }
                }
            }
            
            Section {
                ForEach(filteredExercises) { exercise in
                    ExerciseRowView(
                        exercise: exercise,
                        isSelected: selectedExercise?.id == exercise.id,
                        isTimerActive: isTimerActive,
                        remainingTime: remainingTime
                    )
                    .onTapGesture {
                        selectExercise(exercise)
                    }
                }
            }
        }
        .navigationTitle("Training")
        .onReceive(timer) { _ in
            if isTimerActive && remainingTime > 0 {
                remainingTime -= 1
            } else if isTimerActive && remainingTime == 0 {
                isTimerActive = false
                playCompletionSound()
            }
        }
    }
    
    private func selectExercise(_ exercise: TrainingExercise) {
        selectedExercise = exercise
        remainingTime = exercise.duration
        isTimerActive = true
    }
    
    private func playCompletionSound() {
        // Play system sound when timer completes
        AudioServicesPlaySystemSound(1007)
    }
}

struct ExerciseRowView: View {
    let exercise: TrainingExercise
    let isSelected: Bool
    let isTimerActive: Bool
    let remainingTime: TimeInterval
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(exercise.title)
                    .font(.headline)
                
                Spacer()
                
                if isSelected {
                    Text(timeString(from: remainingTime))
                        .monospacedDigit()
                        .foregroundColor(isTimerActive ? .blue : .secondary)
                } else {
                    Text(timeString(from: exercise.duration))
                        .foregroundColor(.secondary)
                }
            }
            
            Text(exercise.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            if let variation = exercise.variation {
                Text("Variante: \(variation)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.top, 4)
            }
        }
        .padding(.vertical, 8)
        .background(isSelected ? Color.blue.opacity(0.1) : Color.clear)
    }
    
    private func timeString(from timeInterval: TimeInterval) -> String {
        let minutes = Int(timeInterval) / 60
        let seconds = Int(timeInterval) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

#Preview {
    NavigationStack {
        TrainingView()
    }
} 