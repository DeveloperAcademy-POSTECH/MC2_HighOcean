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
    
    @State private var showModal = false
    @State private var selectedCardIndex = 0
    
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
                    
                CollectionView(cardArray: selectedPicker == .dis ? $cards.recievedCards : $cards.sentCards, showModal: $showModal, selectedCardIndex: $selectedCardIndex)
            }
            
            if self.showModal {
                ZStack{
                    CardView(card: $cards.recievedCards[selectedCardIndex])
                
                    VStack{
                        Spacer()

                        Button(action: {
                            withAnimation{
                                self.showModal.toggle()
                            }
                        }, label: {
                            Image(systemName: "xmark").resizable()
                                .frame(width: 15, height: 15)
                                .foregroundColor(.black)
                                .padding(20)
                                .background(Color.white)
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                .padding(.bottom, 80)
                        })
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .background(Color.black.opacity(0.5))
                .edgesIgnoringSafeArea(.all)
            }
        }
        .navigationTitle("전체 카드")
    }
}
