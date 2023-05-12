//
//  ContentView.swift
//  HighOcean
//
//  Created by apple on 2023/05/03.
//

import SwiftUI

struct CollectionView: View {
    
    @Binding var cardArray: [Card]
    @Binding var showModal: Bool
    @Binding var selectedCardIndex: Int

    let columns = [
        GridItem(.flexible(maximum: 111)),
        GridItem(.flexible(maximum: 111)),
        GridItem(.flexible(maximum: 111)),
    ]
    
    var body: some View {
        ZStack{
            if !cardArray.isEmpty {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 26) {
                        ForEach(cardArray.indices) { index in
                            TotalThumbnailCardView(degree: .constant(0), card: $cardArray[min(index, cardArray.count-1)])
                                .onTapGesture {
                                    selectedCardIndex = index
                                    showModal = true
                                }
                        }
                    }
                    .padding(.top, 20)
                }
            }
        }
    }
}
