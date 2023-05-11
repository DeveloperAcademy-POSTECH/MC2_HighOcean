//
//  Cards.swift
//  MC2_Test
//
//  Created by jeongyun on 2023/05/04.
//

import Foundation

struct User {
    let name:String
}


class Cards: ObservableObject {
    
    let currentUser: User = User(name: "지호")
    
    @Published var cards: [Card] = [
//                Card(context: "보고싶어요!", image: "image", createdDate: "22-04-30", from: "지호가", to: "엄마", creator:"지호", isLiked: false, isChecked: true, show: false),
//                Card(context: "보고싶어요2!", image: "image", createdDate: "22-04-22", from: "엄마", to: "지호가", creator:"엄마", isLiked: false, isChecked: false, show: false),
//                Card(context: "보고싶어요3!", image: "image", createdDate: "22-04-24", from: "지호가", to: "엄마", creator:"지호", isLiked: false, isChecked: false, show: false),
//                Card(context: "보고싶어요4!", image: "image", createdDate: "22-04-25", from: "지호가", to: "엄마", creator:"지호", isLiked: false, isChecked: true, show: false),
//                Card(context: "보고싶어요5!", image: "image", createdDate: "22-04-28", from: "지호가", to: "엄마", creator:"지호", isLiked: false, isChecked: false, show: false),
//                Card(context: "보고싶어요6!", image: "image", createdDate: "22-04-20", from: "지호가", to: "엄마", creator:"지호", isLiked: false, isChecked: false, show: false),
//                Card(context: "보고싶어요7!", image: "image", createdDate: "22-04-22", from: "엄마", to: "지호가", creator:"엄마", isLiked: false, isChecked: true, show: false)
    ]
    @Published var uncheckedCards: [Card] = []
    @Published var sentCards: [Card] = []
    @Published var recievedCards: [Card] = []
    @Published var likedCards: [Card] = []
    
    
    init() {
        self.uncheckedCards = cards
            .filter { !$0.isChecked }                             // 확인한 카드 필터링
            .sorted{ $0.createdDate > $1.createdDate }          // 최신순 소팅
        self.sentCards = cards
            .filter { $0.creator == currentUser.name }            // 보낸 카드 필터링
            .sorted{ $0.createdDate > $1.createdDate }          // 최신순 소팅
        self.recievedCards = cards
            .filter { $0.creator != currentUser.name }            // 받은 카드 필터링
            .sorted{ $0.createdDate > $1.createdDate }            // 최신순 소팅
        self.likedCards = cards
            .filter { $0.isLiked }                                // 좋아요한 카드 필터링
            .sorted{ $0.createdDate > $1.createdDate }            // 최신순 소팅
        loadData()
    }
    
    func dataSort() {
        likedCards = cards
            .filter { $0.isLiked }
            .sorted { $0.createdDate > $1.createdDate }
        uncheckedCards = cards
            .filter { !$0.isChecked }                             // 확인한 카드 필터링
            .sorted{ $0.createdDate > $1.createdDate }          // 최신순 소팅
        sentCards = cards
            .filter { $0.creator == currentUser.name }            // 보낸 카드 필터링
            .sorted{ $0.createdDate > $1.createdDate }          // 최신순 소팅
        recievedCards = cards
            .filter { $0.creator != currentUser.name }            // 받은 카드 필터링
            .sorted{ $0.createdDate > $1.createdDate }            // 최신순 소팅
    }
    
    func loadData() {
        guard let url = URL(string: "https://mc2highocean-default-rtdb.firebaseio.com/photoCard.json") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("No data in response: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([String: Card].self, from: data)
                self.cards = Array(jsonData.values)
                self.dataSort()
                
                print("DEBUG: " + "\(self.cards)")
                
            } catch let error {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
        }.resume()
    }
}

