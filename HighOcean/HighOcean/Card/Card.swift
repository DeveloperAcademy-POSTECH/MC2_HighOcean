//
//  Card.swift
//  HighOcean
//
//  Created by jeongyun on 2023/05/08.
//

import Foundation
import FirebaseDatabase
import FirebaseDatabaseSwift

struct Card: Identifiable, Equatable, Codable, Hashable{  // Codable -> Encode, Decode 가능
    let id: String
    let context: String
    let image: String
    let createdDate: String
    let from: String
    let to: String
    let creator: String
    var isLiked: Bool
    var isChecked: Bool
    var show: Bool
    
    init(context: String, image: String, createdDate: String, from: String, to: String, creator: String, isLiked: Bool, isChecked: Bool, show: Bool, id: String = UUID().uuidString){
        self.id = id
        self.context = context
        self.image = image
        self.createdDate = createdDate
        self.from = from
        self.to = to
        self.creator = creator
        self.isLiked = isLiked
        self.isChecked = isChecked
        self.show = show
    }
    
    mutating func changeIsLiked(){
        self.isLiked.toggle()
    }
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    mutating func editCheckedCard() {
        self.isChecked = true
        let ref: DatabaseReference = Database.database().reference()
        ref.child("photoCard/\(self.id)/isChecked").setValue(true)
    }
}
