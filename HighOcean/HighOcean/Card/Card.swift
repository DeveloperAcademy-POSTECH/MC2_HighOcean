//
//  Card.swift
//  HighOcean
//
//  Created by jeongyun on 2023/05/08.
//

import Foundation

struct Card: Identifiable, Equatable, Codable, Hashable{  // Codable -> Encode, Decode 가능
    let id = UUID()
    let context: String
    let image: String
    let createdDate: String
    let from: String
    let to: String
    let creator: String
    var isLiked: Bool
    var isChecked: Bool
    var show: Bool
    
    init(context: String, image: String, createdDate: String, from: String, to: String, creator: String, isLiked: Bool, isChecked: Bool, show: Bool){
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
    
    mutating func changeIschecked(){
        self.isChecked = true
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
}
