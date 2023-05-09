import Foundation
import SwiftUI

class user : ObservableObject {
    
    @Published var name = ""
    
}
//enum familyRole {
//    case 엄마
//    case 아빠
//    case 아이
//}
//let familyrole: familyRole
//var combacktime: Int
//var connectrink: String
//var todayfeeling = ":)"
//    init(name: String, familyRole: familyRole, combacktime: Int, connectrink: String) {
//        self.name = name
//        self.familyrole = familyRole
//        self.combacktime = combacktime
//        self.connectrink = connectrink
//    }


//
//  OnboardingView.swift
//  HighOcean
//
//  Created by Shin seungah on 2023/05/08.
//

//import Foundation
//import SwiftUI
//
//class User : ObservableObject {
//    enum familyRole {
//        case 부모
//        case 아이
//    }
//    
//    let name: String
//    let familyrole: familyRole
//    var combacktime: Int
//    var connectrink: String
//    @Published var todayfeeling = ":)"
//    init(name: String, familyRole: familyRole, combacktime: Int, connectrink: String) {
//        self.name = name
//        self.familyrole = familyRole
//        self.combacktime = combacktime
//        self.connectrink = connectrink
//    }
//    
//    func printf() {
//        print("\(self.name), \(self.familyrole)")
//    }
//}
//
//let user1 = User(name: "Pinetree", familyRole: .부모, combacktime: 6, connectrink: "https://happy0115.tistory.com")
//let user2 = User(name: "Pine", familyRole: .아이, combacktime: 0, connectrink: "https://happy0115.tistory.com")
