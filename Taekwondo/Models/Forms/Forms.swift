import Foundation

struct Forms {
    static func loadAllForms() -> [Form] {
        return [
            SajuJirugi.createForm(),
            TaegeukIlJang.createForm(),
            TaegeukEeJang.createForm(),
            TaegeukSamJang.createForm(),
            TaegeukSaJang.createForm(),
            TaegeukOhJang.createForm(),
            TaegeukYukJang.createForm(),
            TaegeukChilJang.createForm(),
            TaegeukPalJang.createForm(),
            Koryo.createForm()
        ]
    }
} 