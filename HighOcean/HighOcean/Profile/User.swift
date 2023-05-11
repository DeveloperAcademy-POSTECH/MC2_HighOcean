import Foundation

class User: ObservableObject, Codable {
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
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        date = try container.decode([Bool].self, forKey: .date)
        time = try container.decode(Date.self, forKey: .time)
        familyRule = try container.decode(String.self, forKey: .familyRule)
        mode = try container.decode(Int.self, forKey: .mode)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(date, forKey: .date)
        try container.encode(time, forKey: .time)
        try container.encode(familyRule, forKey: .familyRule)
        try container.encode(mode, forKey: .mode)
    }
    
    enum CodingKeys: CodingKey {
        case name, date, time, familyRule, mode
    }
    
    func formattedSeoulTime(date: Date, addTime: Int) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        formatter.timeZone = TimeZone(identifier: "Asia/Seoul")
        var newTime: Date
        
        if formatter.string(from: date) >= "22" {
            newTime = Calendar.current.date(byAdding: .hour, value: addTime-2, to: time)!
        } else {
            newTime = Calendar.current.date(byAdding: .hour, value: addTime, to: time)!
        }
        return formatter.string(from: newTime)
    }
}
