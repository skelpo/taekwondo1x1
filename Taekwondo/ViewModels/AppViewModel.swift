import Foundation
import Combine

class AppViewModel: ObservableObject {
    @Published var vocabularyItems: [VocabularyItem] = []
    @Published var trainingExercises: [TrainingExercise] = []
    @Published var forms: [Form] = []
    @Published var examRequirements: [ExamRequirement] = []
    @Published var fightingSettings = FightingSettings()
    
    init() {
        loadData()
    }
    
    private func loadData() {
        loadVocabulary()
        loadTrainingExercises()
        loadForms()
        loadExamRequirements()
    }
    
    private func loadVocabulary() {
        // Basic Commands
        vocabularyItems += [
            VocabularyItem(german: "Achtung", korean: "Charyeot", category: .commands),
            VocabularyItem(german: "Grüßen", korean: "Kyeongne", category: .commands),
            VocabularyItem(german: "Anfangen", korean: "Shijak", category: .commands),
            VocabularyItem(german: "Aufhören", korean: "Guman", category: .commands),
            VocabularyItem(german: "Weitermachen", korean: "Gaesok", category: .commands),
            VocabularyItem(german: "Zurücktreten", korean: "Baro", category: .commands),
            VocabularyItem(german: "Umdrehen", korean: "Dwiró Dora", category: .commands),
            VocabularyItem(german: "Fertig", korean: "Junbi", category: .commands),
            VocabularyItem(german: "Pause", korean: "Swieo", category: .commands),
            VocabularyItem(german: "Wechseln", korean: "Bakkuro", category: .commands)
        ]
        
        // Numbers (expanded with Sino-Korean numbers)
        vocabularyItems += [
            // Native Korean Numbers
            VocabularyItem(german: "1", korean: "Hana", category: .numbers),
            VocabularyItem(german: "2", korean: "Dul", category: .numbers),
            VocabularyItem(german: "3", korean: "Set", category: .numbers),
            VocabularyItem(german: "4", korean: "Net", category: .numbers),
            VocabularyItem(german: "5", korean: "Dasot", category: .numbers),
            VocabularyItem(german: "6", korean: "Yasot", category: .numbers),
            VocabularyItem(german: "7", korean: "Ilgop", category: .numbers),
            VocabularyItem(german: "8", korean: "Yadul", category: .numbers),
            VocabularyItem(german: "9", korean: "Ahop", category: .numbers),
            VocabularyItem(german: "10", korean: "Yol", category: .numbers),
        ]
        
        // Stances (expanded)
        vocabularyItems += [
            VocabularyItem(german: "Grundstellung", korean: "Naranhi-Sogi", category: .stances),
            VocabularyItem(german: "Parallelstellung", korean: "Chuchum-Sogi", category: .stances),
            VocabularyItem(german: "Vorwärtsstellung", korean: "Ap-Sogi", category: .stances),
            VocabularyItem(german: "Rückwärtsstellung", korean: "Dwit-Sogi", category: .stances),
            VocabularyItem(german: "L-Stellung", korean: "Niunja-Sogi", category: .stances),
            VocabularyItem(german: "Kampfstellung", korean: "Gunnun-Sogi", category: .stances),
            VocabularyItem(german: "Katzenstellung", korean: "Goburyo-Sogi", category: .stances),
            VocabularyItem(german: "Kreuzstellung", korean: "Kyotdari-Sogi", category: .stances),
            VocabularyItem(german: "X-Stellung", korean: "Kyocha-Sogi", category: .stances),
            VocabularyItem(german: "Diamantstellung", korean: "Dwitbal-Sogi", category: .stances)
        ]
        
        // Kicks (expanded)
        vocabularyItems += [
            VocabularyItem(german: "Frontkick", korean: "Ap-Chagi", category: .steps),
            VocabularyItem(german: "Halbkreiskick", korean: "Dollyo-Chagi", category: .steps),
            VocabularyItem(german: "Seitkick", korean: "Yop-Chagi", category: .steps),
            VocabularyItem(german: "Rückwärtskick", korean: "Dwit-Chagi", category: .steps),
            VocabularyItem(german: "Drehkick", korean: "Bandae-Dollyo-Chagi", category: .steps),
            VocabularyItem(german: "Axtkick", korean: "Naeryo-Chagi", category: .steps),
            VocabularyItem(german: "Aufwärtskick", korean: "Ap-Cha-Olligi", category: .steps),
            VocabularyItem(german: "Hackenkick", korean: "Tuit-Chagi", category: .steps),
            VocabularyItem(german: "Sprungkick", korean: "Twimyo-Chagi", category: .steps),
            VocabularyItem(german: "Doppelkick", korean: "Dubro-Chagi", category: .steps),
            VocabularyItem(german: "Fegekick", korean: "Suroh-Chagi", category: .steps),
            VocabularyItem(german: "Dreieckskick", korean: "Mikulgi-Chagi", category: .steps)
        ]
        
        // Hand Techniques (expanded)
        vocabularyItems += [
            VocabularyItem(german: "Fauststoß", korean: "Jirugi", category: .strikes),
            VocabularyItem(german: "Vierseitenschlag", korean: "Saju-Jirugi", category: .strikes),
            VocabularyItem(german: "Handkantenschlag außen", korean: "Sonkal-Taerigi", category: .strikes),
            VocabularyItem(german: "Handkantenschlag innen", korean: "Sonkal-Dung-Taerigi", category: .strikes),
            VocabularyItem(german: "Unterarmblock", korean: "Palmok-Makgi", category: .strikes),
            VocabularyItem(german: "Hoher Block", korean: "Nopunde-Makgi", category: .strikes),
            VocabularyItem(german: "Mittlerer Block", korean: "Kaunde-Makgi", category: .strikes),
            VocabularyItem(german: "Tiefer Block", korean: "Najunde-Makgi", category: .strikes),
            VocabularyItem(german: "Doppelunterarmblock", korean: "Doo-Palmok-Makgi", category: .strikes),
            VocabularyItem(german: "Kreuzblock", korean: "Kyocha-Makgi", category: .strikes),
            VocabularyItem(german: "Messerhand", korean: "Sonkal", category: .strikes),
            VocabularyItem(german: "Speerhand", korean: "Pyonsonkeut", category: .strikes),
            VocabularyItem(german: "Ellbogenschlag", korean: "Palkup-Taerigi", category: .strikes),
            VocabularyItem(german: "Fingerspitzenstoß", korean: "Pyonsonkeut-Tulgi", category: .strikes),
            VocabularyItem(german: "Rückfaust", korean: "Dung-Joomuk", category: .strikes)
        ]
        
        // General Terms (expanded)
        vocabularyItems += [
            VocabularyItem(german: "Taekwondo-Schule", korean: "Dojang", category: .general),
            VocabularyItem(german: "Anzug", korean: "Dobok", category: .general),
            VocabularyItem(german: "Gürtel", korean: "Ti", category: .general),
            VocabularyItem(german: "Meister", korean: "Sabum-Nim", category: .general),
            VocabularyItem(german: "Großmeister", korean: "Kwanjang-Nim", category: .general),
            VocabularyItem(german: "Schüler", korean: "Jeja", category: .general),
            VocabularyItem(german: "Form", korean: "Poomsae", category: .general),
            VocabularyItem(german: "Kampf", korean: "Kyorugi", category: .general),
            VocabularyItem(german: "Kraft", korean: "Him", category: .general),
            VocabularyItem(german: "Geist", korean: "Shim", category: .general),
            VocabularyItem(german: "Training", korean: "Sooryon", category: .general),
            VocabularyItem(german: "Meditation", korean: "Muk-Nyom", category: .general),
            VocabularyItem(german: "Kampfschrei", korean: "Kihap", category: .general),
            VocabularyItem(german: "Zählen", korean: "Seshi", category: .general)
        ]
    }
    
    private func loadTrainingExercises() {
        // Stretching Exercises
        trainingExercises += [
            TrainingExercise(
                title: "Dynamisches Beinschwingen",
                description: "Vor dem Körper die Beine abwechselnd nach vorne schwingen. Auf Kontrolle und Höhe achten.",
                duration: 120,
                category: .warmup,
                level: .beginner,
                variation: "Seitlich oder nach hinten schwingen"
            ),
            TrainingExercise(
                title: "Spagat-Vorbereitung",
                description: "In Schrittstellung, vorderes Bein beugen und das hintere Bein strecken. Position 30 Sekunden halten.",
                duration: 60,
                category: .warmup,
                level: .beginner,
                variation: "Mit Oberkörper nach vorne beugen"
            ),
            TrainingExercise(
                title: "Schulter-Mobilisation",
                description: "Arme kreisen, erst klein dann groß. Vorwärts und rückwärts.",
                duration: 60,
                category: .warmup,
                level: .beginner,
                variation: "Einzeln oder mit beiden Armen"
            )
        ]
        
        // Warm-up Exercises
        trainingExercises += [
            TrainingExercise(
                title: "Seilspringen",
                description: "Grundlegendes Seilspringen mit beiden Beinen gleichzeitig.",
                duration: 180,
                category: .warmup,
                level: .beginner,
                variation: "Einbeinig oder mit Laufschritt"
            ),
            TrainingExercise(
                title: "Hampelmann",
                description: "Klassischer Hampelmann mit Arm- und Beinkoordination.",
                duration: 60,
                category: .warmup,
                level: .beginner,
                variation: "Mit zusätzlicher 180-Grad-Drehung"
            ),
            TrainingExercise(
                title: "Zombieball",
                description: "3 Bälle. Nur 3 Schritte mit Ball erlaubt. Wird der Ball gefangen, gilt der Werfer als Abgeworfen.",
                duration: 300,
                category: .warmup,
                level: .beginner,
                variation: "Wurde man abgeworfen: 3 Liegestütze"
            ),
            TrainingExercise(
                title: "Koordinationsleiter",
                description: "Verschiedene Laufübungen in der Koordinationsleiter.",
                duration: 180,
                category: .warmup,
                level: .beginner,
                variation: "Seitwärts oder rückwärts"
            )
        ]
        
        // Strength Exercises
        trainingExercises += [
            TrainingExercise(
                title: "Beinheber",
                description: "15 Wiederholungen. Mit dem Rücken auf den Boden/Matte legen und die Beine gleichzeitig und durchgestreckt bis zum 90° Winkel anheben.",
                duration: 60,
                category: .strength,
                level: .beginner,
                variation: "Nur 1 Bein. Beine abwechselnd anheben."
            ),
            TrainingExercise(
                title: "Liegestütze",
                description: "3 Sätze à 10 Wiederholungen. Korrekte Ausführung mit geradem Rücken.",
                duration: 180,
                category: .strength,
                level: .beginner,
                variation: "Auf den Knien oder mit erhöhter Position"
            ),
            TrainingExercise(
                title: "Wandsitzen",
                description: "Mit dem Rücken an der Wand, Beine im 90-Grad-Winkel.",
                duration: 60,
                category: .strength,
                level: .beginner,
                variation: "Abwechselnd ein Bein anheben"
            ),
            TrainingExercise(
                title: "Kniebeugen",
                description: "3 Sätze à 15 Wiederholungen. Knie nicht über die Zehenspitzen.",
                duration: 180,
                category: .strength,
                level: .beginner,
                variation: "Mit Sprung am Ende"
            ),
            TrainingExercise(
                title: "Unterarmstütz",
                description: "Planking-Position halten. Auf geraden Rücken achten.",
                duration: 60,
                category: .strength,
                level: .beginner,
                variation: "Abwechselnd Beine anheben"
            )
        ]
        
        // Technical Exercises
        trainingExercises += [
            TrainingExercise(
                title: "Ap-Chagi Techniktraining",
                description: "Frontkick-Technik üben. 10 Kicks pro Bein, langsam und kontrolliert.",
                duration: 300,
                category: .technique,
                level: .beginner,
                variation: "Mit Schritt oder aus der Kampfstellung"
            ),
            TrainingExercise(
                title: "Dollyo-Chagi Kombination",
                description: "Halbkreiskick-Kombination. Vorderes und hinteres Bein im Wechsel.",
                duration: 300,
                category: .technique,
                level: .intermediate,
                variation: "Mit Mehrfachkicks oder Sprung"
            ),
            TrainingExercise(
                title: "Yop-Chagi am Sandsack",
                description: "Seitkick-Training am Sandsack. Auf korrekte Fußstellung achten.",
                duration: 300,
                category: .technique,
                level: .intermediate,
                variation: "Mit Step-Technik"
            ),
            TrainingExercise(
                title: "Dwit-Chagi Präzision",
                description: "Rückwärtskick auf verschiedene Höhen. Ziele markieren.",
                duration: 240,
                category: .technique,
                level: .advanced,
                variation: "Mit Drehung oder aus der Bewegung"
            )
        ]
        
        // Combination Exercises
        trainingExercises += [
            TrainingExercise(
                title: "Grundschulkombination 1",
                description: "Ap-Chagi, Dollyo-Chagi, Yop-Chagi (jeweils rechts/links).",
                duration: 180,
                category: .combination,
                level: .beginner,
                variation: "Mit zusätzlichen Handtechniken"
            ),
            TrainingExercise(
                title: "Partnerkombination",
                description: "Partner A: Angriff mit Ap-Chagi, Partner B: Ausweichen und Konter mit Dollyo-Chagi.",
                duration: 300,
                category: .combination,
                level: .intermediate,
                variation: "Mit verschiedenen Distanzen"
            ),
            TrainingExercise(
                title: "3-Step-Sparring",
                description: "Dreischrittkampf mit festgelegten Techniken. Angriff und Verteidigung üben.",
                duration: 300,
                category: .combination,
                level: .intermediate,
                variation: "Mit wechselnden Techniken"
            ),
            TrainingExercise(
                title: "Wettkampfkombination",
                description: "Doppel-Dollyo-Chagi gefolgt von Dwit-Chagi als Konter.",
                duration: 240,
                category: .combination,
                level: .advanced,
                variation: "Mit verschiedenen Ausweichtechniken"
            )
        ]
    }
    
    private func loadForms() {
        forms = [
            TaegeukPalJang.createForm(),
            TaegeukChilJang.createForm(),
            TaegeukYukJang.createForm(),
            TaegeukOhJang.createForm(),
            TaegeukSaJang.createForm(),
            TaegeukSamJang.createForm(),
            TaegeukEeJang.createForm(),
            SajuJirugi.createForm(),
            TaegeukIlJang.createForm(),
            Koryo.createForm(),
        ]
        
        // Sort forms by belt level from lowest (white) to highest (black)
        forms.sort { $0.beltLevel.rawValue > $1.beltLevel.rawValue }
    }
    
    private func loadExamRequirements() {
        examRequirements = [
            // 10. Kup - White
            ExamRequirement(
                beltLevel: .white,
                basicTechniques: [],
                forms: [],
                selfDefense: [],
                sparring: [],
                theory: [],
                breakingTest: nil
            ),
            
            // 9. Kup - White/Yellow
            ExamRequirement(
                beltLevel: .yellowWhite,
                basicTechniques: [
                    "Grundschule (Basis-Einzeltechniken)"
                ],
                forms: [],
                selfDefense: [],
                sparring: ["Step-Sparring", "Pratzensparring"],
                theory: ["Koreanische und deutsche Bezeichnungen der bisherigen Techniken, Fußstellungen und Kommandos"],
                breakingTest: nil
            ),
            
            // 8. Kup - Yellow
            ExamRequirement(
                beltLevel: .yellow,
                basicTechniques: [
                    "Grundschule (Basis-Einzel- und Mehrfachtechniken)"
                ],
                forms: ["Saju Jirugi"],
                selfDefense: ["Fallschule", "Ausweichen gegen Fuß-, Faust- und Handangriffe", "Lösen von einfachen Handangriffen"],
                sparring: ["Step-Sparring", "Pratzensparring (Angriff – Konter)", "Situationssparring oder freies Sparring"],
                theory: ["Koreanische und deutsche Bezeichnungen der bisherigen Techniken", "Wettkampfregeln nach WOZ oder WOP"],
                breakingTest: nil
            ),
            
            // 7. Kup - Yellow/Green
            ExamRequirement(
                beltLevel: .greenYellow,
                basicTechniques: ["Grundschule (optional)"],
                forms: ["Taegeuk Il Jang"],
                selfDefense: ["Fallschule", "Ausweichen gegen Fuß-, Faust- und Handangriffe", "Lösen von einfachen Handangriffen"],
                sparring: ["Step-Sparring", "Pratzensparring (Angriff – Konter)", "1-Schritt-Kampf oder Situations-Sparring oder freies Sparring"],
                theory: ["Bisherige Themen", "Erklärung der Techniken, Fußstellungen und Übungen aus dem bisherigen Prüfungsprogramm"],
                breakingTest: nil
            ),
            
            // 6. Kup - Green
            ExamRequirement(
                beltLevel: .green,
                basicTechniques: ["Grundschule (optional)"],
                forms: ["Taegeuk Ih Jang"],
                selfDefense: ["Verteidigung gegen Angriffe aus der Nahdistanz"],
                sparring: ["Step-Sparring", "Pratzensparring (Angriff – Konter)", "1-Schritt-Kampf oder Situations-Sparring oder freies Sparring"],
                theory: ["Bisherige Themen", "Notwehrrecht sinngemäß"],
                breakingTest: BreakingTest(
                    minimumAge: 15,
                    thickness: "1.5 cm",
                    description: "Nach eigener Wahl für Altersklassen ≥ 15 Jahre"
                )
            ),
            
            // 5. Kup - Green/Blue
            ExamRequirement(
                beltLevel: .blueGreen,
                basicTechniques: ["Grundschule (optional)"],
                forms: ["Taegeuk Sam Jang"],
                selfDefense: ["Verteidigung gegen kombinierte Angriffe aus der Nah- und mittleren Distanz"],
                sparring: ["Step-Sparring", "Pratzensparring (Angriff – Konter)", "1-Schritt-Kampf oder Situations-Sparring oder freies Sparring"],
                theory: ["Bisherige Themen", "Geistige Hintergründe des TKD"],
                breakingTest: BreakingTest(
                    minimumAge: 15,
                    thickness: "1.5 cm",
                    description: "Nach eigener Wahl für Altersklassen ≥ 15 Jahre"
                )
            ),
            
            // 4. Kup - Blue
            ExamRequirement(
                beltLevel: .blue,
                basicTechniques: ["Grundschule"],
                forms: ["Taegeuk Sa Jang"],
                selfDefense: ["Freie Abwehr von Angriffen aus der langen, mittleren und Nahdistanz", "SV unter dem Aspekt \"Raumnot\""],
                sparring: ["Pratzensparring", "Situations-Sparring (Angriff – Konter)"],
                theory: ["Bisherige Themen", "Kenntnis der vitalen Körperpunkte"],
                breakingTest: BreakingTest(
                    minimumAge: 15,
                    thickness: "2.0 cm",
                    description: "1 Technik nach eigener Wahl"
                )
            ),
            
            // 3. Kup - Blue/Red
            ExamRequirement(
                beltLevel: .redBlue,
                basicTechniques: ["Grundschule"],
                forms: ["Taegeuk Oh Jang"],
                selfDefense: ["Freie Abwehr von Angriffen aus allen Distanzen", "Abwehr gegen abgesprochene Angriffe in der Bodenlage", "Abwehr gegen abgesprochene Stockangriffe"],
                sparring: ["Pratzensparring", "Situations-Sparring (Angriff – Konter)"],
                theory: ["Bisherige Themen", "Beschreibung und Erklärung der Trainingsinhalte"],
                breakingTest: BreakingTest(
                    minimumAge: 15,
                    thickness: "2.0 cm",
                    description: "2 verschiedene Einzeltechniken nach eigener Wahl"
                )
            ),
            
            // 2. Kup - Red
            ExamRequirement(
                beltLevel: .red,
                basicTechniques: ["Grundschule"],
                forms: ["Taegeuk Yuk Jang"],
                selfDefense: ["Abwehr gegen freie unbewaffnete Angriffe und freie Stockangriffe", "Abgesprochene Messerangriffe"],
                sparring: ["Pratzensparring", "Situations-Sparring (Angriff – Konter)"],
                theory: ["Bisherige Themen", "Technikprinzipien"],
                breakingTest: BreakingTest(
                    minimumAge: 15,
                    thickness: "2.5 cm",
                    description: "2 verschiedene Einzeltechniken nach eigener Wahl"
                )
            ),
            
            // 1. Kup - Red/Black
            ExamRequirement(
                beltLevel: .blackRed,
                basicTechniques: ["Grundschule"],
                forms: ["Taegeuk Chil Jang"],
                selfDefense: ["Abwehr gegen freie unbewaffnete und bewaffnete Angriffe"],
                sparring: ["Pratzensparring", "Situations-Sparring (Angriff – Konter)"],
                theory: ["Bisherige Themen", "Organisation/Aufbau der DTU und der zuständigen LV", "Grundkenntnisse zur Trainingslehre"],
                breakingTest: BreakingTest(
                    minimumAge: 15,
                    thickness: "2.5 cm",
                    description: "2 verschiedene Einzeltechniken nach eigener Wahl"
                )
            ),
            
            // 1. Dan/Poom
            ExamRequirement(
                beltLevel: .black,
                basicTechniques: [],
                forms: ["Taegeuk Pal Jang", "1 Form aus dem Vorprogramm nach Losvorgabe"],
                selfDefense: ["Freie Abwehr gegen unbewaffnete und bewaffnete Angriffe eines Partners aus verschiedenen Distanzen"],
                sparring: ["Freies Sparring (1 Runde)", "Sparring mit einfacher technischer und/oder taktischer Aufgabenstellung"],
                theory: [],
                breakingTest: BreakingTest(
                    minimumAge: 15,
                    thickness: "2.5 cm",
                    description: "3 verschiedene Techniken nach eigener Wahl; hierbei muss eine 2-er-Kombination gezeigt werden"
                )
            )
        ]
    }
} 
