import Foundation

struct FightingSettings {
    var roundDuration: TimeInterval = 30 // Default 30 seconds
    var breakDuration: TimeInterval = 15 // Default 15 seconds
    var numberOfRounds: Int = 3
    var task: String = "Zwei Angriffe pro Person, dann abwechseln"
    
    static let defaultBreakDurations: [TimeInterval] = [15, 30, 45, 60]
    static let defaultRoundDurations: [TimeInterval] = [30, 60, 90, 120]
}

struct FightingSession {
    let settings: FightingSettings
    var currentRound: Int = 1
    var isBreak: Bool = false
    var timeRemaining: TimeInterval
    var isActive: Bool = false
    
    init(settings: FightingSettings) {
        self.settings = settings
        self.timeRemaining = settings.roundDuration
    }
} 