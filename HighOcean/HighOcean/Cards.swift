//
//  Cards.swift
//  HighOcean
//
//  Created by jisukwon on 2023/05/08.
//

import UIKit

struct Card: Identifiable, Equatable {
    let id: UUID = UUID()
    let context: String
    let image: UIImage
    let createdDate: Date
    let from: String
    let isLike: Bool
    let isCheck: Bool
    var show:Bool
}


struct Cards {
    var checkedCards: [Card] = []
    var likedCards: [Card] = []
    var unCheckedCards: [Card] = []
    
    init() {
        for _ in 1...3 {
            checkedCards.append(Card(context: "안녕 아들아", image: UIImage(systemName: "bolt")!, createdDate: Date(), from: "엄마가", isLike: true, isCheck: true, show:false))
            likedCards.append(Card(context: "안녕 마이아들", image: UIImage(systemName: "bolt")!, createdDate: Date(), from: "엄마가", isLike: true, isCheck: true, show:false))
        }
        
        for _ in 1...2 {
            checkedCards.append(Card(context: "안녕 아들아", image: UIImage(systemName: "bolt")!, createdDate: Date(), from: "엄마가", isLike: false, isCheck: true, show:false))
        }
        
        for _ in 1...2 {
            unCheckedCards.append(Card(context: "안녕 아들아", image: UIImage(systemName: "bolt")!, createdDate: Date(), from: "엄마가", isLike: false, isCheck: false, show:false))
        }
    }
}
