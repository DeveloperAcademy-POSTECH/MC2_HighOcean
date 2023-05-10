//
//  ContentView.swift
//  HighOcean
//
//  Created by apple on 2023/05/03.
//

import SwiftUI

struct CollectionView: View {
    
    @State private var selectedCard: Card?
        @EnvironmentObject var cards: Cards
    
    let data = Array(1...1000).map { "목록 \($0)"}
    let columns = [
        GridItem(.flexible(maximum: 110)),
        GridItem(.flexible(maximum: 110)),
        GridItem(.flexible(maximum: 110)),
        ]
    
    var body: some View {
    
        LazyVGrid(columns: columns, spacing: 26) {
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 144))], spacing: 16) {
                ForEach($cards.likedCards) { $card in
                    Button {
                        self.selectedCard = card
                    } label: {
                        TotalThumbnailCardView(degree: .constant(0), card: $card)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            

        }
        

    }
}
struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView()
    }
}
