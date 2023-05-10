//
//  ContentView.swift
//  HighOcean
//
//  Created by apple on 2023/05/03.
//

import SwiftUI

struct CollectionView: View {
    
    @State private var selectedCard: Card?
    var cards: [Card]
    
//    let data = Array(1...1000).map { "목록 \($0)"}
    let columns = [
        GridItem(.flexible(maximum: 111)),
        GridItem(.flexible(maximum: 111)),
        GridItem(.flexible(maximum: 111)),
    ]
    
    var body: some View {
    
        LazyVGrid(columns: columns, spacing: 26) {

            ForEach(cards) { card in
                Button {
                    self.selectedCard = card
                } label: {
                    TotalThumbnailCardView(degree: .constant(0), card: .constant(card))
                }
                .buttonStyle(PlainButtonStyle())
            }
            
        }
        
    }
}
//
//struct CollectionView_Previews: PreviewProvider {
//    static var previews: some View {
//        CollectionView(card: .constant(card().cards[0]))
//            .environmentObject(Cards())
//    }
//}
