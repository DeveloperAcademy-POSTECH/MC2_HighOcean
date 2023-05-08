//
//  Cards.swift
//  MC2_Test
//
//  Created by jeongyun on 2023/05/04.
//

import Foundation

class Cards: ObservableObject {
    
//    let currentUser: User?
    
    @Published var uncheckedCards: [Card] = []
    @Published var sentCards: [Card] = []
    @Published var recievedCards: [Card] = []
    @Published var likedCards: [Card] = []

    @Published var cards: [Card] = [
        Card(context: "보고싶어요!", image: "image", createdDate: "22-04-31", from: "지호가", to: "엄마", creator:"지호", isLiked: false, isChecked: true, show: false),
        Card(context: "보고싶어요2!", image: "image", createdDate: "22-04-31", from: "지호가", to: "엄마", creator:"지호", isLiked: false, isChecked: false, show: false),
        Card(context: "보고싶어요3!", image: "image", createdDate: "22-04-31", from: "지호가", to: "엄마", creator:"지호", isLiked: false, isChecked: false, show: false),
        Card(context: "보고싶어요4!", image: "image", createdDate: "22-04-31", from: "지호가", to: "엄마", creator:"지호", isLiked: false, isChecked: true, show: false),
        Card(context: "보고싶어요5!", image: "image", createdDate: "22-04-31", from: "지호가", to: "엄마", creator:"지호", isLiked: false, isChecked: false, show: false),
        Card(context: "보고싶어요6!", image: "image", createdDate: "22-04-31", from: "지호가", to: "엄마", creator:"지호", isLiked: false, isChecked: false, show: false),
        Card(context: "보고싶어요7!", image: "image", createdDate: "22-04-31", from: "지호가", to: "엄마", creator:"지호", isLiked: false, isChecked: true, show: false)
    ]
    
    init() {
        self.uncheckedCards = cards
            .filter { !$0.isChecked }                             // 확인한 카드 필터링
            .sorted{ $0.createdDate > $1.createdDate }          // 최신순 소팅
//        self.sentCards = cards
//            .filter { $0.creator == currentUser.name }            // 보낸 카드 필터링
//            .sorted{ $0.createdDate > $1.createdDate }          // 최신순 소팅
//        self.recievedCards = cards
//            .filter { $0.creator != currentUser.name }            // 받은 카드 필터링
//            .sorted{ $0.createdDate > $1.createdDate }            // 최신순 소팅
        self.likedCards = cards
            .filter { $0.isLiked }                                // 좋아요한 카드 필터링
            .sorted{ $0.createdDate > $1.createdDate }            // 최신순 소팅
    }
}
