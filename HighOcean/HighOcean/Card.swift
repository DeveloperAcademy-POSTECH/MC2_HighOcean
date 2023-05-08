//
//  Card.swift
//  HighOcean
//
//  Created by jeongyun on 2023/05/08.
//

import Foundation

struct Card: Identifiable, Equatable{
    let id = UUID()
    let context: String
    let image: String
    let createdDate: String
    let from: String
    let creator: String
    var isLiked: Bool
    var isChecked: Bool
    
    init(context: String, image: String, createdDate: String, from: String, creator: String, isLiked: Bool, isChecked: Bool){
        self.context = context
        self.image = image
        self.createdDate = createdDate
        self.from = from
        self.creator = creator
        self.isLiked = isLiked
        self.isChecked = isChecked
    }
    
    mutating func changeIschecked(){
        self.isChecked = true
    }
}
