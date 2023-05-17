//
//  Cards.swift
//  MC2_Test
//
//  Created by jeongyun on 2023/05/04.
//

import SwiftUI
import FirebaseDatabase
import FirebaseDatabaseSwift

class Cards: ObservableObject {
    let ref: DatabaseReference = Database.database().reference()
    
    @Published var currentUser: User
    
    @Published var cards: [Card] = []
    @Published var uncheckedCards: [Card] = []
    @Published var sentCards: [Card] = []
    @Published var recievedCards: [Card] = []
    @Published var likedCards: [Card] = []
    @Published var isNewCards: Bool = false
 
    
    init(currentUser: User) {
        self.currentUser = currentUser
        loadData()
    }
    
    func dataSort() {
        sentCards = cards
            .filter { $0.familyRule == currentUser.familyRule }
            .sorted{ $0.createdDate > $1.createdDate }
        recievedCards = cards
            .filter { $0.familyRule != currentUser.familyRule }
            .sorted{ $0.createdDate > $1.createdDate }
        likedCards = recievedCards
            .filter { $0.isLiked && ($0.creator != currentUser.name)}
            .sorted { $0.createdDate > $1.createdDate }
        uncheckedCards = recievedCards
            .filter { !$0.isChecked && ($0.creator != currentUser.name)}
            .sorted{ $0.createdDate > $1.createdDate }
        if recievedCards.count != 0 {
            self.isNewCards = true
        }
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
            } catch let error {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
        }.resume()
    }
    
    func addNewCard(card: Card) {
        self.ref.child("photoCard").child("\(card.id)").setValue([
            "id": card.id,
            "context": card.context,
            "image": card.image,
            "createdDate": card.createdDate,
            "from": card.from,
            "to": card.to,
            "creator": card.creator,
            "isLiked": card.isLiked,
            "isChecked": card.isChecked,
            "show": card.show,
            "familyRule": card.familyRule
        ])
    }
    
    func editLikedCard(card: Card, isLiked: Bool) {
        if isLiked {
            ref.child("photoCard/\(card.id)/isLiked").setValue(true)
        } else {
            ref.child("photoCard/\(card.id)/isLiked").setValue(false)
        }
    }

    func editCard(card: Card) {
        let updates: [String : Any] = [
            "id": card.id,
            "context": card.context,
            "image": card.image,
            "createdDate": card.createdDate,
            "from": card.from,
            "to": card.to,
            "creator": card.creator,
            "isLiked": card.isLiked,
            "isChecked": card.isChecked,
            "show": card.show,
            "familyRule": card.familyRule
        ]
        
        let childUpdates = ["photo/\(card.id)": updates]
        for (index, cardItem) in cards.enumerated() where cardItem.id == card.id {
            cards[index] = card
        }
        self.ref.updateChildValues(childUpdates)
    }
}

