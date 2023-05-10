//
//  ContentView.swift
//  HighOcean
//
//  Created by apple on 2023/05/03.
//

import SwiftUI

enum tapInfo : String, CaseIterable {
    case dis = "수신"
    case out = "발신"
}

struct TotalCardCollectionView: View {
    
    @State private var selectedPicker: tapInfo = .dis
    @EnvironmentObject var cards: Cards
    
    var body: some View {
        ZStack(alignment:.top){
            Color("Secondary").ignoresSafeArea()
            
            VStack{
                Picker("Pick", selection: $selectedPicker){
                    ForEach(tapInfo.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                .pickerStyle(.segmented)
                .padding()
                
                cardsView(selectedOption: selectedPicker)
                    .environmentObject(cards)
            }
    
        }
        .navigationTitle("전체 카드")
        
    }
 }

// 카드 내용 변경
struct cardsView : View {
    
    var selectedOption : tapInfo
    @EnvironmentObject var cards: Cards
    
    var body: some View{
        
        switch selectedOption {
        case .dis:
            CollectionView(cards: cards.recievedCards)
        case .out:
            CollectionView(cards: cards.sentCards)
        }
    }
}


//미리보기
struct TotalCardCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        TotalCardCollectionView()
            .environmentObject(Cards())
    }
}
