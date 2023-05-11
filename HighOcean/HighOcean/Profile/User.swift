import Foundation

class User: ObservableObject {
    var name: String
    var date: [Bool]
    var time: Date
    var familyRule: String
    @Published var mode: Int
    
    init(name: String, date: [Bool], time: Date, familyRule: String, mode: Int = 0) {
        self.name = name
        self.date = date
        self.time = time
        self.familyRule = familyRule
        self.mode = mode
    }
}
